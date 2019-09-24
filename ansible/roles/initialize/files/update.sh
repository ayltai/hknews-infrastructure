#!/usr/bin/env bash

yes | apt update && yes | apt upgrade && yes | apt dist-upgrade && apt autoremove && apt autoclean && apt-get clean
