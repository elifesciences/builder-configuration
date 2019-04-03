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
                enabled: true
