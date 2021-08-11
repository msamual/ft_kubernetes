influxd && sleep 5

influx -execute "CREATE DATABASE grafana; CREATE USER msamual WITH PASSWORD '3347'"

["usr/bin/supervisord"]