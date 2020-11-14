import flask
import redis

from get_docker_secret import get_docker_secret


app = flask.Flask(__name__)
redis_client = redis.Redis(
    host='redis',
    port=6379,
    password=get_docker_secret('redis_pwd')
)

@app.route('/')
def index():
    cnt = redis_client.incr('hits')
    return flask.jsonify(hits=cnt)
