[![Docker Repository on Quay](https://quay.io/repository/ukhomeofficedigital/dq-aws-cli-docker/status "Docker Repository on Quay")](https://quay.io/repository/ukhomeofficedigital/dq-aws-cli-docker)

# dq-aws-cli-docker

Docker container with AWS CLI.

## Dependencies

- Alpine3.8
- AWS CLI
- AWS keypair
- Docker

## Build container

```
docker build -t aws/cli --rm .
```

## Usage

```
docker run \
-e AWS_ACCESS_KEY_ID='foo' \
-e AWS_SECRET_ACCESS_KEY='bar' \
-e AWS_DEFAULT_REGION='eu-west-2' \
--name aws \
-v /local/path/docker-mount:/workdir \
-d aws/cli \
s3 cp --no-progress /workdir/test.file s3://s3-bucket-name/
```
