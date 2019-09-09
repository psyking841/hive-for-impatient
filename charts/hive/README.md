# Apache Hive

## Summary
This Charts manifest provisions a Hive instance with MySQL db as metastore.

[Apache Hive](https://hive.apache.org/) is an open source data warehouse software.

Reference:
https://blog.csdn.net/chenleiking/article/details/82492282

## Hive Docker image
* Version 3.1.2
* Prebuild image: [psyking841/hive:3.1.2](https://cloud.docker.com/u/psyking841/repository/docker/psyking841/hive)

## To run with Minikube
* Prerequesits
    * [Install Helm](https://helm.sh/docs/using_helm/)
* Provision Hive using following command:
```$bash
helm install hive -n my-hive
```