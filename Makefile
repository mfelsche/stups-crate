build:
	./generate-scm-source.sh
	docker build -t $(DOCKER_IMAGE) .

.PHONY:
	build
