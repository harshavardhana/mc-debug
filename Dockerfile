FROM circleci/php:7.3
COPY minio.sh minio.sh
CMD ./minio.sh
