DOCKER_COMPOSE = docker-compose
SERVERLESS 	   = ${DOCKER_COMPOSE} run --rm serverless
NODE 		   = ${DOCKER_COMPOSE} run --rm node

install: node_modules
	cp .env.example .env

start: stop
	${DOCKER_COMPOSE} up -d node

stop:
	${DOCKER_COMPOSE} down

open:
	xdg-open https://${DOMAIN_NAME}

build:
	${NODE} npm run build

ssr: build stop
	${SERVERLESS} offline

node_modules: package.json
	${NODE} npm install

lint:
	${NODE} npm run fix-lint

tests:
	${NODE} npm run test

lokalise:
	${DOCKER_COMPOSE} run --rm lokalise
