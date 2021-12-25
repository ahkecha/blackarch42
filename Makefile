# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ahkecha <ahkecha@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/12/25 16:48:11 by ahkecha           #+#    #+#              #
#    Updated: 2021/12/25 18:37:49 by ahkecha          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


# define standard colors
ifneq (,$(findstring xterm,${TERM}))
	BLACK        := $(shell tput -Txterm setaf 0)
	RED          := $(shell tput -Txterm setaf 1)
	GREEN        := $(shell tput -Txterm setaf 2)
	YELLOW       := $(shell tput -Txterm setaf 3)
	LIGHTPURPLE  := $(shell tput -Txterm setaf 4)
	PURPLE       := $(shell tput -Txterm setaf 5)
	BLUE         := $(shell tput -Txterm setaf 6)
	WHITE        := $(shell tput -Txterm setaf 7)
	RESET := $(shell tput -Txterm sgr0)
else
	BLACK        := ""
	RED          := ""
	GREEN        := ""
	YELLOW       := ""
	LIGHTPURPLE  := ""
	PURPLE       := ""
	BLUE         := ""
	WHITE        := ""
	RESET        := ""
endif

#docker files path
DOCKER_DIR = "../blackarch42"
DOCKER_FILE = "./"

# change these settings accordingly
TAG = blackarch42
CONTAINER_NAME = blackarch-42
DEDICATED_MEMORY = 3096M
HOSTNAME = blackarch

DIR1 = ~/Library/Containers/com.docker.docker
DIR2= ~/.docker
DIR3 = /goinfre/$${USER}/docker
DIR4 = /goinfre/$${USER}/agent

CMD1	=	$(GREEN)[Docker Image successfuly built ✅]$(RESET)
CMD2	= $(PURPLE)[Docker successfuly moved to ~/goinfree ✅]$(RESET)
CMD3	= $(YELLOW)[Running your blackarch container ⌛️]$(RESET)

SHELL = /bin/bash
RM =	rm -rf
MKDIR = mkdir -p
LINK = ln -s

#Intialzing docker directories, this will remove docker files on your local session,make new ones on goinfree then it will link them
init:
	@echo "${RED}[Removing old dockerfiles and moving them to goinfree]${RESET}"
	$(RM) $(DIR1) $(DIR2) $(DIR3) $(DIR4)
	$(MKDIR) $(DIR3) $(DIR4)
	$(LINK) $(DIR4) $(DIR1)
	$(LINK) $(DIR3) $(DIR2)

build:
	@echo "${GREEN}[Building docker image...this will take ~10min]${RESET}"
	docker build --rm --force-rm --tag $(TAG)/$(HOSTNAME) .
	@printf "$(CMD1)"


run:
	@printf "$(CMD3)\n"
	docker run --rm -it --memory $(DEDICATED_MEMORY) --hostname $(HOSTNAME) --name $(CONTAINER_NAME) $(TAG)/$(HOSTNAME)


.PHONY: init build run test
