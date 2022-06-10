#!bin/bash
sudo yum install -y gcc-c++ make
curl -sL https://rpm.nodesource.com/setup_14.x | sudo -E bash -
sudo  yum install nodejs -y
sudo yum install git -y
git clone https://github.com/trulymittal/demo_express.git
cd demo_express
npm install
nohup npm start &

