docker_build: 
	./generate-scm-source.sh
	docker build -t $DOCKER_IMAGE .

.PHONY:
	docker_build
