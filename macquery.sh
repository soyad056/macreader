#!/bin/sh
#This is a simple shell script to retrive data from MAC address

#Check the operating system, and dependencies to execute the script. If curl & jq are not installed, the script will automatically install them.
if [ -f /etc/redhat-release ]; then
    which curl &> /dev/null || yum install -y curl
    which curl &> /dev/null || yum install -y jq
elif [ -f /etc/lsb-release ]; then
    which curl &> /dev/null || apt-get install -y curl
    which curl &> /dev/null || apt-get install -y jq
fi

#Check if curl and jq are installed, if not install them
which jq &> /dev/null || sudo apt install jq -y
which curl &> /dev/null || sudo apt install curl -y

# If you can get the API key from https://macaddress.io/ after Sign up and replace the API key in the below line
API_KEY=at_K75y3UuN5GiCoYlamS0WUnUcRUa83 #Replace with your API key
OUTPUT_TYPE=json #json or xml
MAC_ADDRESS=$1 #MAC address to query in the parameter

# Make cURL request to API  hooks

#echo RESPONSE
RESPONSE=$(curl -s -X GET "https://api.macaddress.io/v1?apiKey=$API_KEY&output=$OUTPUT_TYPE&search=$MAC_ADDRESS")

# Parse JSON response
COMPANY_NAME=$(echo $RESPONSE | jq -r '.vendorDetails.companyName')
MAC_ADDRESS=$(echo $RESPONSE | jq -r '.macAddressDetails.searchTerm')
MAC_ADDRESS_VALID=$(echo $RESPONSE | jq -r '.macAddressDetails.isValid')
COUNTRY_CODE=$(echo $RESPONSE | jq -r '.vendorDetails.countryCode')
BLOCK_FOUND=$(echo $RESPONSE | jq -r '.blockDetails.blockFound')

# Print results
echo "Company Name: $COMPANY_NAME"
echo "MAC Address: $MAC_ADDRESS"
echo "MAC Address Vaild: $MAC_ADDRESS_VALID"
echo "Country Code: $COUNTRY_CODE"
echo "Block Found: $BLOCK_FOUND"

# End of script
