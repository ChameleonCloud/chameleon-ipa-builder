DOCKER_IMAGE ?= chameleon/ipa-builder

.PHONY: docker
docker: bindep.txt
	docker build -t $(DOCKER_IMAGE) .

bindep.txt:
	wget https://raw.githubusercontent.com/openstack/diskimage-builder/master/bindep.txt
