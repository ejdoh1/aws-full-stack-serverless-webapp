include env.list
IMAGE ?= ejdoh1/slsclient:1648690002
ENV_SH ?= /work/scripts/env.sh
RUN ?= docker run -it --rm --volume $$(pwd):/work --env-file env.list -p 3000:3000 ${IMAGE} bash -c "source ${ENV_SH} &&
AMPLIFY_PUBLISH ?= ${RUN} cd frontend && amplify publish --yes"

push-image: build-image
	d=$$(date +%s); \
	docker tag slsclient:latest ejdoh1/slsclient:$$d; \
	docker push ejdoh1/slsclient:$$d; \
	docker push ejdoh1/slsclient:latest

first-deploy: init-frontend deploy-frontend deploy-backend deploy-frontend-again seed-database frontend-status

build-image:
	cd docker-image && docker build . -t slsclient

destroy: remove-backend remove-frontend remove-backend

deploy: deploy-frontend deploy-backend

seed-database:
	${RUN} cd backend && npm i && sls dynamodb seed --online --region ${AWS_DEFAULT_REGION}"

deploy-backend:
	${RUN} cd backend && npm i && sls deploy"

remove-backend:
	${RUN} cd backend && npm i && sls remove"

remove-frontend:
	${RUN} cd frontend && amplify delete --force"

init-frontend:
	${RUN} /work/scripts/amplify-init.sh && cd /work/frontend && yes '' | amplify add hosting && yes '' | amplify add auth"
	
deploy-frontend:
	${AMPLIFY_PUBLISH}

deploy-frontend-again:
	${AMPLIFY_PUBLISH}

frontend-status:
	${RUN} cd /work/frontend && amplify status"

start-frontend:
	${RUN} cd frontend && npm start"