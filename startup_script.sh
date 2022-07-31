#!/bin/bash
apt update -y
apt upgrade -y
apt install snapd
snap install kubectl --classic;

