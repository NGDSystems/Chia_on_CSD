# Chia_on_CSD
## 1- Using CSDs as a Chia plotter
Chia blockchain recommends SSD as a temp drive which makes plotting faster.

## Chia blockchain Install instructions for Ubuntu/Debian

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
(venv) ngd@node1:~/chia-blockchain$ chia plots create -k 32 -b 5120 -u 128 -r 1 -n 1 -t /media/newport/temp/ -d /media/newport/plots/ -f Farmer_Public_Key -p Pool_Public_Key

```
