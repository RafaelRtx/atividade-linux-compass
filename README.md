# Instalação do WSL + Ubuntu

### 1. Instalação do WSL

Abra o PowerShell como adminstrador e rode o seguinte comando:
```
wsl --install
```
### 2. Instalação do Linux

### Via Microsoft Store
1. Pesquise por Ubuntu (ou outra distro de seu interesse)
2. Clique na versão que deseja instalar e selecione **Obter** ou **Instalar**.
3. Após a instalação, clique em **Iniciar** para abrir o Ubuntu.

#### Após a instalação é necessário que você reinicie o computador para aplicar as mudanças

Com tudo pronto, basta digitar `wsl` dentro do PowerShell que seu linux irá iniciar


# Monitoramento do serviço NGINX no Linux

Este projeto implementa um sistema de monitoramento simples do serviço Nginx em um sistema Linux. O script verifica se o Nginx está rodando e gera logs separadamente para os casos em que o serviço está **online** ou **offline**. Além disso, o script é configurado para ser executado automaticamente a cada 5 minutos via `cron`.

## Requisitos

- Sistema Linux com acesso ao `cron` (Baixe a biblioteca caso necessário)
- Servidor Nginx instalado e rodando

### 1. Instalação do Nginx

Instale o Nginx com o comando:

```bash
sudo apt update
sudo apt install nginx
```

### 2. Criação do Script de Validação
Crie um script chamado `nginx_validate.sh` no diretório `/home/linux-compass/nginx_validate.sh` onde validará se o serviço `Nginx` está operante ou não.

### 3. Permissões do Script
Garantindo que o script tenha permissão para excução:
```
sudo chmod +x /home/linux-compass/nginx_validate.sh
```

### 4. Configuração do Cron
Para automatizar a execução do script a cada 5 minutos, utilizaremos o cron:

```
crontab -e
```
Com o crontab aberto, adicione a linha de comando:

```
*/5 * * * * /bin/bash /home/linux-compass/nginx_validate.sh
```

Isso garante que o script seja executado a cada 5 minutos.

### 5. Teste do Funcionamento
**Testar o Log de ONLINE**

Se o serviço Nginx estiver rodando, o script irá gerar logs no arquivo `nginx_online.log` com a seguinte estrutura:
```
2024-12-26 23:00:00 - nginx - ONLINE - O serviço está Online.
```
**Testar o Log de OFFLINE**

Para simular o Nginx offline, pare o serviço:
```
sudo systemctl stop nginx
```

O script irá registrar o seguinte no arquivo `nginx_offline.log`:

```
2024-12-26 23:36:00 - nginx - OFFLINE - O serviço está Offline
```


 