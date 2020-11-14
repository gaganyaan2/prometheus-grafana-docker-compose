
if [ ! -f /etc/systemd/system/node_exporter.service ]
then

echo "Downloading node_exporter..."
wget https://github.com/prometheus/node_exporter/releases/download/v1.0.1/node_exporter-1.0.1.linux-amd64.tar.gz

tar -xf node_exporter-1.0.1.linux-amd64.tar.gz

mv node_exporter-1.0.1.linux-amd64/node_exporter /usr/local/bin/node_exporter

rm -rf node_exporter-1.0.1.linux-amd64
rm -rf node_exporter-1.0.1.linux-amd64.tar.gz

echo '
[Unit]
Description=Node Exporter
Wants=network-online.target
After=network-online.target

[Service]
User=root
Group=root
Type=simple
ExecStart=/usr/local/bin/node_exporter

[Install]
WantedBy=multi-user.target' > /etc/systemd/system/node_exporter.service

systemctl daemon-reload
systemctl start node_exporter
systemctl enable node_exporter
systemctl status node_exporter

else
echo "node_exporter is already installed /etc/systemd/system/node_exporter.service"
fi
