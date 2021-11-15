# Febs文档

mysql账号密码：
root
root123

1、获取验证码
http://localhost:8301/auth/captcha?key=777774396

2、获取token
localhost:8101/oauth/token?grant_type=password&username=mrbird&password=1234qwer&key=777774396&code=7746
post请求

3、rabbitmq
账号密码：febs 123456
查看相关信息：https://www.pianshen.com/article/91871304341/

4、zipkin启动

java -jar zipkin.jar --server.port=8402 --zipkin.storage.type=mysql --zipkin.storage.mysql.db=febs_cloud_base --zipkin.storage.mysql.username=root --zipkin.storage.mysql.password=root123 --zipkin.storage.mysql.host=localhost --zipkin.storage.mysql.port=3306 --zipkin.collector.rabbitmq.addresses=localhost:5672 --zipkin.collector.rabbitmq.username=febs --zipkin.collector.rabbitmq.password=123456