# How to Install Prometheus and Grafana

#### Prerequisite
+ Name: Prometheus-Grafana-Server
+ AMI:  Ubuntu 22.04 
+ Instance type:  T2.Meduim  4GB of RAM.
+ Security Group: 22, 3000 and 9090 
+ Storage : 8 gb
+ User Data: [jenkins-ubuntu-user-data](./jenkins-user-data.sh)

1. **Create a user for Prometheus**:
   ```bash
   sudo useradd --no-create-home --shell /bin/false prometheus
   ```

2. **Create necessary directories**:
   ```bash
   sudo mkdir /etc/prometheus
   sudo mkdir /var/lib/prometheus
   ```

3. **Assign ownership to Prometheus user**:
   ```bash
   sudo chown prometheus:prometheus /etc/prometheus
   sudo chown prometheus:prometheus /var/lib/prometheus
   ```

4. **Download Prometheus**:
   ```bash
   cd /tmp
   wget https://github.com/prometheus/prometheus/releases/download/v2.32.0/prometheus-2.32.0.linux-amd64.tar.gz
   tar xvf prometheus-2.32.0.linux-amd64.tar.gz
   ```

5. **Move Prometheus binaries**:
   ```bash
   sudo cp prometheus-2.32.0.linux-amd64/prometheus /usr/local/bin/
   sudo cp prometheus-2.32.0.linux-amd64/promtool /usr/local/bin/
   ```

6. **Change ownership of binaries**:
   ```bash
   sudo chown prometheus:prometheus /usr/local/bin/prometheus
   sudo chown prometheus:prometheus /usr/local/bin/promtool
   ```

7. **Copy consoles and console_libraries**:
   ```bash
   sudo cp -r prometheus-2.32.0.linux-amd64/consoles /etc/prometheus
   sudo cp -r prometheus-2.32.0.linux-amd64/console_libraries /etc/prometheus
   ```

8. **Change ownership of consoles and console_libraries**:
   ```bash
   sudo chown -R prometheus:prometheus /etc/prometheus/consoles
   sudo chown -R prometheus:prometheus /etc/prometheus/console_libraries
   ```

9. **Create Prometheus configuration file**:
   ```bash
   sudo vi /etc/prometheus/prometheus.yml
   ```

10. **Edit the configuration file**:
    Paste the following configuration:
    ```yaml
    global:
      scrape_interval: 15s

    scrape_configs:
      - job_name: 'prometheus'
        static_configs:
          - targets: ['localhost:9090']
    ```
    Save and exit.

11. **Change ownership of the configuration file**:
    ```bash
    sudo chown prometheus:prometheus /etc/prometheus/prometheus.yml
    ```

12. **Create a systemd service file for Prometheus**:
    ```bash
    sudo vi /etc/systemd/system/prometheus.service
    ```

13. **Edit the systemd service file**:
    Paste the following configuration:
    ```ini
    [Unit]
    Description=Prometheus
    Wants=network-online.target
    After=network-online.target

    [Service]
    User=prometheus
    Group=prometheus
    Type=simple
    ExecStart=/usr/local/bin/prometheus \
      --config.file /etc/prometheus/prometheus.yml \
      --storage.tsdb.path /var/lib/prometheus/ \
      --web.console.templates=/etc/prometheus/consoles \
      --web.console.libraries=/etc/prometheus/console_libraries

    [Install]
    WantedBy=multi-user.target
    ```
    Save and exit.

14. **Reload systemd**:
    ```bash
    sudo systemctl daemon-reload
    ```

15. **Start Prometheus**:
    ```bash
    sudo systemctl start prometheus
    ```

16. **Enable Prometheus to start on boot**:
    ```bash
    sudo systemctl enable prometheus
    ```

### Install Grafana

1. **Install Grafana**:
   ```bash
   sudo apt-get install -y software-properties-common
   sudo add-apt-repository "deb https://packages.grafana.com/oss/deb stable main"
   sudo wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -
   sudo apt-get update
   sudo apt-get install grafana
   ```

2. **Start Grafana**:
   ```bash
   sudo systemctl start grafana-server
   ```

3. **Enable Grafana to start on boot**:
   ```bash
   sudo systemctl enable grafana-server
   ```

After these steps, you should have Prometheus running on port 9090 and Grafana running on port 3000 on your server.