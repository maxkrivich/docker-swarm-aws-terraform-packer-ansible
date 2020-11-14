# Docker Swarm cluster on AWS
In this repo you could find small example of docker swarm cluster deployed to AWS cloud and some basic usage of core swarm concepts. The intention of this demo app is to play around with docker swarm core concepts and create a boilerplate for my future projects with this orchestration tool.

## AWS Architecture
![image](https://user-images.githubusercontent.com/12199867/99159005-09da6b00-26d9-11eb-8cf1-b2b99f63c9b7.png)


## Demo app deployed to the Swarm-cluster
![image](https://user-images.githubusercontent.com/12199867/99159029-37bfaf80-26d9-11eb-9551-0af036268afb.png)
![image](https://user-images.githubusercontent.com/12199867/99159034-41491780-26d9-11eb-93c7-f2e93a331236.png)


## How-to
In order to deploy the app execute the following commands:
```bash
$ docker stack deploy -c docker-compose.yml demo_app
```
More useful commands can be found [here](https://github.com/sematext/cheatsheets/blob/master/docker-swarm-cheatsheet.md)


<details><summary>Links</summary>

https://docs.docker.com/engine/swarm/key-concepts/

https://docs.aws.amazon.com/

https://blog.container-solutions.com/deployment-strategies

https://devopscon.io/blog/continuous-deployment-docker-swarm/

https://docs.docker.com/engine/context/working-with-contexts/

https://docs.aws.amazon.com/workspaces/latest/adminguide/azs-workspaces.html

https://docs.aws.amazon.com/toolkit-for-visual-studio/latest/user-guide/vpc-tkv.html

https://buildvirtual.net/docker-swarm-cheat-sheet/

https://docs.docker.com/compose/compose-file/
</details>
