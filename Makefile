.PHONY: dev

PROJECT?=active_ext

dev:
	docker-compose run $(PROJECT) /bin/bash
