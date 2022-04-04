# Full Stack Serverless React Webapp with Serverless Framework and AWS Amplify

Click [here](https://github.com/ejdoh1/aws-full-stack-serverless-webapp/generate) to use this repo as a template.

Perform the first deployment from your PC and commit the amplify files generated in the frontend directory.

```sh
# start docker

export AWS_ACCESS_KEY_ID=REPLACE_ME
export AWS_SECRET_ACCESS_KEY=REPLACE_ME

# deploy dev
export ENV_NAME=dev
envsubst < env.list.template > env.list
make deploy

# deploy prod
export ENV_NAME=prod
envsubst < env.list.template > env.list
make deploy
```

Github actions automatically deploy develop branch changes to the dev environment, and main branch changes to the prod environment, see .github/workflows/main.yml. You will need to create a develop branch.

See https://melbournesoftware.xyz/posts/full-stack-serverless-webapp-react-aws-amplify/
