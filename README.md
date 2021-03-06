# Chia_on_CSD

## 1- Install instructions for Ubuntu/Debian on CSD

```
ngd@node1:~$ sudo apt-get update
ngd@node1:~$ sudo apt-get upgrade -y
# Install Git
ngd@node1:~$ sudo apt install git -y

# Checkout the source and install
ngd@node1:~$ git clone https://github.com/Chia-Network/chia-blockchain.git -b latest --recurse-submodules
ngd@node1:~$ cd chia-blockchain
ngd@node1:~/chia-blockchain$ sh install.sh
ngd@node1:~/chia-blockchain$ . ./activate
(venv) ngd@node1:~/chia-blockchain$ 

```

## 2- Using CSDs as a Chia plotter
Chia blockchain recommends SSD as a temp drive which makes plotting faster.

```
ngd@node1:~$ cd chia-blockchain
ngd@node1:~/chia-blockchain$ . ./activate
(venv) ngd@node1:~/chia-blockchain$ chia plots create -k 32 -b 5120 -u 128 -r 1 -n 1 -t /media/newport/temp/ -d /media/newport/plots/ -f Farmer_Public_Key -p Pool_Public_Key

```
## 3- Using CSDs as a Chia Harvester

Here is the scenario as under:

![image](https://user-images.githubusercontent.com/31414094/152264115-0670ecb8-f435-40fd-9ab4-a92d8d7edf53.png)

In the above scenario, we assumed that Full and Farmer nodes are working on the Host, and CSDs are harvesting on their local plots. The architecture comprises one host server that runs the farmer, full node, and wallet and CSDs that run only the harvester. Only the host server will connect to the Chia network.

### The steps we need to run on the host server are as follows.

a- Make a copy of the host server CA directory into the same path in CSDs.
```
(venv) ngd@Host:~/chia-blockchain$ scp  -r ~/.chia/mainnet/config/ssl/ca ngd@10.1.1.2:~/.chia/mainnet/config/ssl/catmp
```

b- Make sure the host server IP address on port 8447 is accessible by CSDs harvester machines.
```
(venv) ngd@Host:~/chia-blockchain$ sudo ufw allow from 10.1.1.2
```

c- See the list of remote harvesters after some minutes. 
```
(venv) ngd@Host:~/chia-blockchain$ chia farm summary
```

### The steps we need to run on the CSDs are as follows.
a- Fix the plots directories by using "chia plots show", "chia plots add -d [dir]"   and "chia plots remove -d [dir]" commands.
```
(venv) ngd@node1:~/chia-blockchain$ chia plots show
```

b- Open the ~/.chia/mainnet/config/config.yaml file in each CSD harvester, and enter the host IP address in the remote harvester's farmer_peer section (NOT full_node). 

```
(venv) ngd@node1:~/chia-blockchain$ vim ~/.chia/mainnet/config/config.yaml
```
For example, this section would look like this:
```
harvester:
  chia_ssl_ca:
    crt: config/ssl/ca/chia_ca.crt
    key: config/ssl/ca/chia_ca.key
  farmer_peer:
    host: 10.1.1.1
    port: 8447
```

c- Make sure the Host IP address on port 8447 (10.1.1.1:8447) is accessible by the CSDs harvester.

d- Create a new certificate signed by the host machine's CA on each CSDs harvester.
```
(venv) ngd@node1:~/chia-blockchain$ chia init -c ~/.chia/mainnet/config/ssl/catmp
```
e- Launch the harvester by running CLI ``` chia start harvester -r ``` and you should see a new connection on the host machine in your INFO level logs.
```
(venv) ngd@node1:~/chia-blockchain$ chia start harvester -r
```

## 4- Using NGD SSD to make plotting faster

Here is the scenario as follows:

![image](https://user-images.githubusercontent.com/31414094/152451005-d401d788-9199-4be5-afb3-2ccf4ad55524.png)

a- Running multiple plotters parallel on different terminal tabs for different NGD-SSD drives [ngd_chia_plotter.sh](./ngd_chia_plotter.sh).

b- Moving gnrated plots form ploter server to farmer server [ngd_chia_mv_plots.sh](./ngd_chia_mv_plots.sh). 

c- Partition multiple NGD-SSD drives [ngd_partition.sh](./ngd_partition.sh).

d- Kill a chia plotter task [kill_plotter.sh](./kill_plotter_threads.sh).

e- Other commands [ngd_cmds.sh](./ngd_cmds.sh). 

