install:
	./scripts/install.sh

models:
	./scripts/pull-models.sh

logs:
	journalctl --user -u ollama -f

restart:
	systemctl --user restart ollama
	systemctl --user restart open-webui

status:
	systemctl --user status ollama
	systemctl --user status open-webui
