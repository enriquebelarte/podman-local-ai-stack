# My local AI stack 

A local AI stack powered by Podman, Quadlet, Ollama, and Open WebUI.

## Features

- Rootless Podman containers
- systemd + Quadlet orchestration
- Ollama model serving
- Open WebUI chat interface
- Persistent local model storage
- Simple shell-based management

## Stack

- Ollama
- Open WebUI
- Podman
- Quadlet
- systemd

## Requirements

- Linux
- Podman
- systemd user services enabled

Enable lingering:

```bash
loginctl enable-linger $USER
```

---

## Repository Structure

```text
.
├── quadlets/
│   ├── ollama.container
│   └── open-webui.container
├── scripts/
│   ├── install.sh
│   ├── pull-models.sh
│   ├── update.sh
│   ├── logs.sh
│   ├── status.sh
│   ├── reset.sh
│   └── uninstall.sh
├── .env.example
├── Makefile
└── README.md
```

---

## Installation

Clone the repository:

```bash
git clone <repo-url>
cd podman-local-ai-stack
```

Install services:

```bash
make install
```

Pull models:

```bash
make models
```

Access the UI at:

```text
http://localhost:3000
```

---

## Configure Models

Create a `.env` file:

```env
OLLAMA_MODELS="qwen2.5:1.5b llama3.2"
```

Then pull models:

```bash
make models
```

---

## Useful Commands

Check status:

```bash
make status
```

View logs:

```bash
make logs
```

View Open WebUI logs:

```bash
./scripts/logs.sh open-webui
```

Update containers:

```bash
make update
```

Reset local data:

```bash
make reset
```

Uninstall stack:

```bash
make uninstall
```

---

## Notes

Containers run as rootless user services via systemd.

Persistent data is stored in:

```text
~/containers/
```

---


