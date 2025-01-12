#!/bin/bash
echo "System time and date:"
timedatectl

if [ ! -d "./.juneogo/configs" ]; then
  mkdir -p ./.juneogo/configs
fi

# Check if the folder /.juneogo./configs/chains exists, if not create the chains folder
if [ ! -d "./.juneogo/configs/chains" ]; then
  mkdir -p ./.juneogo/configs/chains
fi

if [ ! -d "./.juneogo/chainData" ]; then
  mkdir -p ./.juneogo/chainData
fi
# Check if the file .juneogo/staking/staker.crt exists
if [ -f ".juneogo/staking/staker.crt" ]; then
  # Check if the lines "staking-tls-cert-file" and "staking-tls-key-file" exist in the file .juneogo/config.json
  if grep -q '"staking-tls-cert-file"' .juneogo/config.json && grep -q '"staking-tls-key-file"' .juneogo/config.json; then
    # Do nothing
    echo "Lines already present in the file"
    :
  else
    # Add missing lines to the file .juneogo/config.json
     echo "add line into the file"
     sed -i '1r config.txt' .juneogo/config.json
            sed -i '1a\' .juneogo/config.json

    
  fi
else
  # Remove the lines "staking-tls-cert-file" and "staking-tls-key-file" from the file .juneogo/config.json
  sed -i '/^\s*"staking-tls-cert-file"/d' .juneogo/config.json
  sed -i '/^\s*"staking-tls-key-file"/d' .juneogo/config.json
fi
