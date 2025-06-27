# Zabbix Docker Environment for Orange Pi

This project provides a ready-to-use Docker-based environment for deploying **Zabbix** on an **Orange Pi** single-board computer.

It includes:

- Zabbix Server (MySQL backend)
- Zabbix Web Interface (via Nginx and PHP)
- MariaDB (for data storage)
- Support for custom scripts and SSH-based monitoring
- Persistent data stored in the `./data` directory

---

## 📌 Why Orange Pi?

This setup is optimized for low-resource devices like **Orange Pi**, making it ideal for home labs, network monitoring appliances, or portable monitoring stations.

---

## 🧰 Components

| Service         | Description                                      |
|----------------|--------------------------------------------------|
| `mysql-server` | MariaDB 11.4 for Zabbix database                 |
| `zabbix-server`| Core monitoring engine                           |
| `zabbix-web`   | Web frontend served via Nginx + PHP              |

---

## 📁 Project Structure

```
.
├── docker-compose.yml          # Compose file for the full stack
├── start.sh                    # Shell script to start the environment
├── .env                        # Environment variables
├── LICENSE                     # MIT License file
├── README.md                   # This documentation
└── data/                       # Persistent volumes
    ├── mysql-server/           # MariaDB database storage
    └── zabbix-server/
        ├── alertscripts/       # Custom alert scripts
        ├── externalscripts/    # External scripts used in items/triggers
        ├── ssh_keys/           # SSH keys for remote checks (optional)
        └── zabbix-web/         # Web server SSL/extra configs (optional)
```

---

## 🚀 Getting Started

### ✅ Prerequisites

- Orange Pi running Armbian or Debian-based OS
- Docker
- Docker Compose

Install Docker on Orange Pi:
```bash
curl -fsSL https://get.docker.com | sh
```

Install Docker Compose:
```bash
sudo apt install docker-compose -y
```

---

### 🧪 Launch the Environment

1. **Clone this repository**:
```bash
git clone https://github.com/yourusername/zabbix-orange-pi.git
cd zabbix-orange-pi
```

2. **Make the script executable**:
```bash
chmod +x start.sh
```

3. **Start the environment**:
```bash
./start.sh
```

4. **Access Zabbix Web Interface**:
Open your browser at:
```
http://<your-orange-pi-ip>:8080
```

---

## ⚙️ Configuration & Customization

### 🔧 Environment Variables

All variables are defined in `.env`:
```env
MYSQL_USER=zabbix
MYSQL_PASSWORD=zabbix
ZBX_SERVER_HOST=zabbix-server
...
```

### 🛠️ Custom Scripts

To use alert or external scripts in Zabbix:

- Put your custom alert scripts in:
  ```
  ./data/zabbix-server/alertscripts/
  ```

- Put external scripts in:
  ```
  ./data/zabbix-server/externalscripts/
  ```

Make sure all scripts are executable:
```bash
chmod +x alertscripts/*.sh externalscripts/*.sh
```

### 🔐 SSH Keys (Optional)

If you're monitoring remote machines via SSH:

- Store your private keys in:
  ```
  ./data/zabbix-server/ssh_keys/
  ```

---

## 📦 Volumes & Data Persistence

All data is stored locally inside the `./data/` directory so nothing is lost when containers are stopped or restarted.

---

## 📜 License

This project is licensed under the [MIT License](LICENSE).

---

## 🙋 Author

**Cleberson Souza**  
📧 cleberson.brasil@gmail.com  
💡 Built and tested for Orange Pi

---
