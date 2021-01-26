#!/bin/bash

if [ -x "$( command -v exercism)" ];then
echo "removing exercism ..."
sudo snap remove exercism
else "exercism is not installed."
fi
