elife:
    sidecars:
        containers:
            localstack:
                name: localstack
                image: localstack/localstack  # 700 MB!
                tag: 0.9.0
                ports:
                    # S3
                    - "4572:4572"
                environment: 
                    - "SERVICES=s3" 
                    - "DATA_DIR=/tmp/localstack"
                volumes:
                    - "/tmp/localstack:/tmp/localstack"
                healthcheck: "bash -c 'AWS_ACCESS_KEY_ID=fake AWS_SECRET_ACCESS_KEY=fake aws --endpoint-url=http://localhost:4572 s3 ls'"
                enabled: true
