#!/usr/bin/env bash

service mongod start && service prometheus start && service prometheus-mongod-exporter start && service grafana-server start
