#!/bin/bash
echo 'request Bitcoin price';
x=$(curl https://min-api.cryptocompare.com/data/price?fsym=BTC\&tsyms=CAD)
echo 'removing all non digit from the response'
x=${x//[^0-9\.]/}
echo 'Bitcoin price is CA$ '"$x"
echo 'removing decimals from the price'
x=${x%.*}
echo 'checking if the price within the defined range'
    if [ "$x" -ge 10000 -a "$x" -lt 14000 ]; then 
        echo 'price is within range, will post an alert'
        curl -i -X POST https://putsreq.com/wkDdMQWhaOyalisaIe49 --data 'price='"$x"
  
    else echo 'Price is not within range, no alert posted this time'
fi
