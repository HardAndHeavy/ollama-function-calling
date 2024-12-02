docker-dev-build:
	docker build -t example-function-calling:dev -f ./Dockerfile.dev .

docker-dev-run:
	docker run -it --rm \
		-p 3000:3000 \
		-v .:/app \
		-e PORT=3000 \
		-e HOST=0.0.0.0 \
		example-function-calling:dev bash

start:
	npm start

docker-push:
	docker build -t example-function-calling:$(tag) -f ./Dockerfile.prod .
	docker image tag example-function-calling:$(tag) hardandheavy/example-function-calling:$(tag)
	docker push hardandheavy/example-function-calling:$(tag)
	docker image tag example-function-calling:$(tag) hardandheavy/example-function-calling:latest
	docker push hardandheavy/example-function-calling:latest
