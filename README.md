#Author:
Soyad Ahmmed, SDET Eng
Version 1.0, CURL, SHELL, REST
12/03/2022

# Sccript Overview:

This is simple shell script which can be run in any linux distribution to retrive company name and some other useful information from any MAC address. I have used Shell Programming language to write this script and it has some dependencies which is cURL & JQ.

- cURL - It has been used to request/GET data using JSON format from REST API
- JQ - It has been used to parse data from JSON output.

# How to run this script:

First of all, you can spin up any linux machine, it can be Debian, Ubuntu, CentOS, Redhat or any linux machine. It can also be a phsyical VM or even a dockerised container. This script will automatically check for the dependencies like curl or jq installed on your machine. If is not found on the system then, it will automatically try to install but you will need to run the script as a ROOT user. However, if you would like to install it manually, then please run the following code as an example for Debian/Ubuntu

```
apt-get install curl jq -y
```

for CentOS / Red-Hat

```
yum install curl jq -y
```

Once your dependecies are installed you can clone the repository and make the script executable. You can use the command below to do that

```
git clone https://github.com/soyad056/macreader.git
cd macreader
chmod +x macquery.sh
```

Then you can run the program using following command ( I have used 44:38:39:ff:ef:57 this mac address as an example)

```
./macquery.sh 44:38:39:ff:ef:57
```

OUTPUT:


```
Company Name: Cumulus Networks, Inc
MAC Address: 44:38:39:ff:ef:57
MAC Address Vaild: true
Country Code: US
Block Found: tr
```
# Security details:

I have taken care of the security measure by NOT using any additional library or 3rd party application to make this program or to POST any logs outside of the server.
