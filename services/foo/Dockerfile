FROM python:3.9-alpine
ENV PYTHONUNBUFFERED 1
ENV FLASK_APP /usr/src/server.py

RUN pip install \
            flask==1.1.2 \
            redis==3.5.3 \ 
            get-docker-secret==1.0.1

WORKDIR /usr/src
COPY ./server.py .

EXPOSE 80

CMD ["flask", "run", "--host", "0.0.0.0", "--port", "80"]