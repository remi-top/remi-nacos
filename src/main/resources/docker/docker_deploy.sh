#先删除原有的镜像
docker stop sit-sdt-base-nacos
docker rm -f sit-sdt-base-nacos
docker images | grep sit-sdt-base-nacos | awk '{print $3}' | xargs docker rmi -f
docker build -t sit-sdt-base-nacos .
docker images | grep sit-sdt-base-nacos
#把新镜像推送到私服
docker login -uadmin -pYdsz1020 harbor.njydsz.com
docker tag sit-sdt-base-nacos harbor.njydsz.com/startdis/sit-sdt-base-nacos:2.0.9
docker tag sit-sdt-base-nacos harbor.njydsz.com/startdis/sit-sdt-base-nacos
docker push harbor.njydsz.com/startdis/sit-sdt-base-nacos:2.0.9
docker push harbor.njydsz.com/startdis/sit-sdt-base-nacos
#启动最新的镜像服务
docker run --restart=always -t -dit -p 8848:8848 --name sit-sdt-base-nacos sit-sdt-base-nacos
docker ps -a
