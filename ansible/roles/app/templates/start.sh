#!/usr/bin/env bash

export SSL_KEY={{ ssl_key }}
cd {{ project_path }}
pm2 start ecosystem.json
