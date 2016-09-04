.PHONY: all

all: Dockerfile startup.sh ros.sh
	docker build -t kunaltyagi/robosub:indigo --rm=true .
