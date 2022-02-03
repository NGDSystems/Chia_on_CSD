# Chia_on_CSD

## 1- Install instructions for Ubuntu/Debian

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

Here is the senario as under: 

![image](https://user-images.githubusercontent.com/31414094/152073443-c90b9353-3d1b-41d4-80eb-de39f3186357.png)

In the above scenario, we assumed that Full and Farmer nodes are working on the Host, and CSDs are harvesting on their local plots. The architecture comprises one host server that runs the farmer, full node, and wallet and CSDs that run only the harvester. Only the host server will connect to the Chia network.

We run the following commands on the host server, which its IP address is "10.1.1.1".


```
ngd@node1:~$ cd chia-blockchain
ngd@node1:~/chia-blockchain$ . ./activate
(venv) ngd@node1:~/chia-blockchain$ chia plots create -k 32 -b 5120 -u 128 -r 1 -n 1 -t /media/newport/temp/ -d /media/newport/plots/ -f Farmer_Public_Key -p Pool_Public_Key

```
