# Make file with rules to automatic install the environment


# defines the shell to the make application
SHELL := /bin/bash


# get the user name
USER_NAME := $(shell whoami)


# get the user home directory
USER_HOME := $(shell getent passwd ${USER_NAME} | cut -d: -f6)


BASH_DIR := bash
GIT_DIR := git
VIM_DIR := vim
THIRD_DIR := third-party
PYTHON_DIR := python
SUBLIME_DIR := sublime


# Colors to messages during execution
BROWN=\e[0;33m
BLUE=\e[1;34m
END_COLOR=\e[0m


# make variables public to other make files
export USER_NAME USER_HOME BROWN BLUE END_COLOR



############# ### ## #
# TARGETS

install: greetings shell versioning python-req third sublime bye


greetings: clear
	@echo -e "\n\n${BROWN}-- PANFILES --"
	@echo -e "Setting up the development environment$(END_COLOR)\n"


shell: ${BASH_DIR}/Makefile
	make install -C ${BASH_DIR}


versioning: ${GIT_DIR}/Makefile
	make install -C ${GIT_DIR}


editor: ${VIM_DIR}/Makefile
	make install -C ${VIM_DIR}


third: ${THIRD_DIR}/Makefile
	make install -C ${THIRD_DIR}


python-req: ${PYTHON_DIR}
	${PYTHON_DIR/profile.sh}

sublime: ${SUBLIME_DIR}
	${SUBLIME_DIR/sublime2t.sh}

bye:
	@echo -e "\n$(BROWN)open your mind, happy coding :D$(END_COLOR)\n"


server: greetings shell versioning editor bye


services: greetings mysqldb uwsgi bye

clear:
	clear
