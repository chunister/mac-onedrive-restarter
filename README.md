# OneDrive Restart Script

This script was created to control the execution of OneDrive on macOS, starting it periodically for synchronization and stopping it after a defined period.

The reason for this automation is that OneDrive consumes a lot of CPU when it stays open continuously. Running it in cycles reduces system impact without losing regular file synchronization.

# How it works

✅ Checks if OneDrive is already running.

✅ If it is, waits 5 minutes (variable `${TIME}`) to allow synchronization, then stops it.

✅ If it is not running, starts OneDrive, waits the synchronization time, and then stops it.

✅ Logs actions in: `onedrive_restart.log`

# Installation

## Download
```bash
git clone https://github.com/chunister/mac-onedrive-restarter.git
```

## Grant execution permissions to the script
```bash
cd mac-onedrive-restarter
```

```bash
chmod +x onedrive_restart.sh
```

# 🕒 Scheduling with crontab

To run it automatically every hour, edit your user’s crontab:
```bash
crontab -e
```

Add the following line:
```text
0 * * * * /Users/your_user/opt/mac-onedrive-restarter/onedrive_restart.sh
```

- Replace `your_user` with your macOS username.
- Make sure to specify the full path to where the script was saved.  
  In the example above, there is an `opt` directory inside the user’s home directory.




# pt_BR
# OneDrive Restart Script

Este script foi criado para controlar a execução do OneDrive no macOS, iniciando-o periodicamente para sincronização e encerrando-o após um período definido.

O motivo para esta automação é que o OneDrive consome bastante CPU quando permanece aberto continuamente. Executá-lo por ciclos reduz o impacto no sistema sem perder a sincronização regular dos arquivos.

# Funcionamento

✅ Verifica se o OneDrive já está rodando.

✅ Caso esteja, aguarda 5 minutos, variável "${TIME}" para sincronizar e encerra.

✅ Caso não esteja, inicia o OneDrive, espera o tempo de sincronização e encerra.

✅ Registra logs em: `onedrive_restart.log`

# Instalação

## Download
```bash
git clone https://github.com/chunister/mac-onedrive-restarter.git
```

## Inserindo permissões de execução para o script
```bash
cd mac-onedrive-restarter
```

```bash
chmod +x onedrive_restart.sh
```

# 🕒 Agendamento com crontab

Para que rode automaticamente a cada hora, edite o crontab do seu usuário:
```bash
crontab -e
```

Adicione a seguinte linha:
```text
0 * * * * /Users/seu_usuario/opt/mac-onedrive-restarter/onedrive_restart.sh
```

- Substitua `seu_usuario` pelo seu nome de usuário no macOS.
- Indique o caminho completo de onde o script foi salvo.  
  No exemplo acima, existe um diretório `opt` dentro do diretório home do usuário.
