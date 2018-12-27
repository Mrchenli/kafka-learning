```json
依赖安装
sudo yum install -y yum-utils device-mapper-persistent-data lvm2
```

```json
添加yum 
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
```

```json
docker安装
sudo yum install docker-ce
```

```json
启动docker
sudo systemctl start docker
```


```json
swarm环境安装
vim /usr/lib/systemd/system/docker.service
ExecStart=/usr/bin/dockerd -H tcp://0.0.0.0:2375 -H unix:///var/run/docker.sock -H tcp://0.0.0.0:7654 --label=function=nodeone --label=192.168.10.98=node1
systemctl daemon-reload
service docker restart

docker swarm init 
//docker swarm join --token SWMTKN-1-0q4pcspbxcrr2r85a3uvh275z878jprcwf41479asow8its556-19xbsg9qz96e98ery8ce18vog 192.168.100.8:2377
```
````json
docker控制台安装
docker volume create portainer_data
docker run -d -p 9000:9000 --name portainer --restart always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer
````

```json
访问docker控制台
localhost:9000
```