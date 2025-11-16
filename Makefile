.PHONY: install uninstall
.DEFAULT_GOAL := help

NAMESPACE := tomdewildt
NAME := minimal-plymouth-theme

THEME_NAME := minimal
THEME_DIR := /usr/share/plymouth/themes/

help: ## Show this help
	@echo "${NAMESPACE}/${NAME}"
	@echo
	@fgrep -h "##" $(MAKEFILE_LIST) | \
	fgrep -v fgrep | sed -e 's/## */##/' | column -t -s##

##

install: ## Install theme
	@echo "INFO: Copying '${THEME_NAME}' to '${THEME_DIR}'"
	@sudo mkdir -p ${THEME_DIR}
	@sudo rm -rf ${THEME_DIR}/${THEME_NAME}
	@sudo cp -rf ./${THEME_NAME} ${THEME_DIR}

	@echo "INFO: Updating plymouth"
	@sudo plymouth-set-default-theme -R minimal

uninstall: ## Uninstall theme
	@echo "INFO: Updating plymouth"
	@sudo plymouth-set-default-theme -r

	@echo "INFO: Removing '${THEME_NAME}' from '${THEME_DIR}'"
	@sudo rm -rf ${THEME_DIR}/${THEME_NAME}
