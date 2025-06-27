# 🧠 Zabbix Docker for Orange Pi 🍊🐧

Welcome to the world of **Zabbix monitoring on Orange Pi** — because even your router deserves attention! This project helps you deploy a full monitoring stack using Docker on your low-powered (but mighty) Orange Pi.

---

## 🛠️ What’s Inside?

| Service        | Role                                    |
|----------------|------------------------------------------|
| 🐬 `mysql-server` | MariaDB 11.4 for Zabbix database         |
| 🧠 `zabbix-server` | Core brain of Zabbix – handles checks     |
| 🌐 `zabbix-web`    | Web interface served via Nginx + PHP    |

And yes... it's all Dockerized 😎

---

## 📦 Directory Structure

```bash
.
├── docker-compose.yml       # Docker stack definition
├── start.sh                 # Main control script (start/stop/restart)
├── .env                     # Environment configs
├── LICENSE                  # MIT license (do cool stuff, just credit)
├── README.md                # You're reading it 👋
└── data/                    # Persistent volumes
    ├── mysql-server/            # MariaDB storage
    └── zabbix-server/
        ├── alertscripts/        # Custom Zabbix alert scripts
        ├── externalscripts/     # Scripts triggered by Zabbix
        ├── ssh_keys/            # Optional SSH key storage
        └── zabbix-web/          # Web-related files (e.g. SSL)
```

---

## 🚀 Getting Started

### ✅ Requirements

- 🧡 Orange Pi (tested on Orange Pi 5 / PC)
- 🐧 Armbian or Debian-based OS
- 🐳 Docker
- ⚙️ Docker Compose

### 🐳 Install Docker (in 1 line):

```bash
curl -fsSL https://get.docker.com | sh
```

### ➕ Install Docker Compose:

```bash
sudo apt install docker-compose -y
```

---

## 🔌 Start It Up!

```bash
chmod +x start.sh
./start.sh start
```

Available commands:

| Command           | What it does                       |
|------------------|------------------------------------|
| `./start.sh start`   | 🟢 Creates folders & runs the stack |
| `./start.sh stop`    | 🔴 Stops and removes containers     |
| `./start.sh restart` | ♻️ Restarts the full environment    |

Then access the web UI at:

```bash
http://<your-orange-pi-ip>:8080
```

---

## ⚙️ Customization

### 🔧 Environment Variables (`.env`)

Configure all your secrets and ports in `.env`:

```env
ZBX_SERVER=zabbix-server
MYSQL_DATABASE=zabbix
MYSQL_USER=zabbix
MYSQL_PASSWORD=zabbix
MYSQL_ROOT_PASSWORD=zabbix_root
```

### 🧪 Add Your Own Scripts

- Alert scripts → `./data/zabbix-server/alertscripts/`
- External scripts → `./data/zabbix-server/externalscripts/`

Make them executable! 🧙
```bash
chmod +x alertscripts/*.sh externalscripts/*.sh
```

### 🔐 Optional SSH Keys

Want to monitor remote servers over SSH? Drop your keys here:
```bash
./data/zabbix-server/ssh_keys/
```

---

## 🔄 Data Persistence

All the data lives in the `./data` directory.  
No worries about container crashes — your data stays safe and happy. 💾

---

## 🧑‍💻 Author

Made with ☕, 🍊 and a little bit of insomnia by:

**Cleberson Souza**  
📧 cleberson.brasil@gmail.com  
💡 Built, tested and dockerized specifically for **Orange Pi**

---

## 📄 License

MIT License – use it, break it, improve it, just don’t forget to give credit.  
See [`LICENSE`](LICENSE) for the full text.

---

## 🧯 Bonus Tip

If your Orange Pi gets hot running all this stuff, it's just happy to be useful 😅
