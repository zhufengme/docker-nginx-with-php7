# Nginx 与 PHP7-FPM 打包的镜像

## 环境变量

### HTTPS

    是否启用https，如果赋值，则nginx以https形式启动

### DEV_MODE

    是否启用开发模式，如果赋值，则PHP错误将直接打印

## 目录和文件

### /logs

    此目录挂载后，可获取所有日志输出

### /www/web

    web根目录

### /keys/server.crt.pem

    服务器证书文件，如果启用https，则必须挂载

### /keys/server.key.pem

    服务器密钥文件，如果启用https，则必须挂载
