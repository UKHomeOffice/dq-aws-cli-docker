[![Docker Repository on Quay](https://quay.io/repository/ukhomeofficedigital/dq-aws-cli-docker/status "Docker Repository on Quay")](https://quay.io/repository/ukhomeofficedigital/dq-aws-cli-docker)

# dq-aws-cli-docker

Docker container with AWS CLI.

## Dependencies

- Alpine3.8
- AWS CLI
- AWS keypair
- Docker

## Build container

The container takes a couple of build time variables to accommodate mounting volumes eg. in a Kubernetes deployment.

| Variable | Value | Default |
| :--- | :---: | ---: |
| BUILD_VOLUME | /workdir | True |
| BUILD_DIR | test | True |

Using default values

```
docker build -t aws/cli --rm .
```

Passing in build time variables

```
docker build --rm \
-t aws/cli \
--build-arg BUILD_VOLUME=/volume \
--build-arg BUILD_DIR=test
```

## Run container

Upon runtime the container will need 3 (three) variables supplied so that it can connect to AWS services.

| Variable | Value | Required |
| :--- | :---: | ---: |
| AWS_ACCESS_KEY_ID | ABCB | True |
| AWS_SECRET_ACCESS_KEY | ABCD1234 | True |
| AWS_DEFAULT_REGION | eu-west-2 | True |

```
docker run \
-e AWS_ACCESS_KEY_ID='foo' \
-e AWS_SECRET_ACCESS_KEY='bar' \
-e AWS_DEFAULT_REGION='eu-west-2' \
--name aws \
-v /local/path/docker-mount:/workdir \
-d aws/cli \
s3 cp --no-progress /workdir/test/test.file s3://s3-bucket-name/
```
