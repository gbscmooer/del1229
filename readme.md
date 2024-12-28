已经修改完成：Home，Register，Login，404
已经废弃；TimeSearch，Map，

*不允许修改文件名，只能修改文件内容*

springboot2.5.9

Java 1.8

Mybatis 3.5.1

hutool 5.7.20


localhost部署服务端
1）kokomi.sql初始化数据库

2）npm run server

3)run springbootapplication

4）http://localhost:8080/ 登录



账号：

|        | 账号     | 密码  |
| ------ | -------- | ----- |
| 管理员 | admin    | admin |
| 研究员 | March7   | 123   |
| 访客   | StarStar | 123   |

头像无法修改检查redis是否开启 redis-server
监听 6379端口 lsof -i :6379
如
COMMAND     PID       USER   FD   TYPE             DEVICE SIZE/OFF NODE NAME
redis-ser 34335 katisarrow    6u  IPv4 0xb3**5df3ef6f****      0t0  TCP *:6379 (LISTEN)
redis-ser 34335 katisarrow    7u  IPv6 0xf1**6f261213****      0t0  TCP *:6379 (LISTEN)

启用ngrok映射8080端口到公网
ngrok http http://localhost:8080

ssh协议连接服务器
ssh -i /Users/katisarrow/Downloads/hutao.pem root@121.40.42.42
ssh -i root@121.40.42.42


