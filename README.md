# custodian-stack

This is an example of using [Cloud Custodian](https://github.com/cloud-custodian/cloud-custodian) to enfore a policy preventing public, unecrypted SageMaker Notebooks from being deployed. It contains the Custodian policy itself, a Mailer configuration for notifications and a CodePipeline stack to manage deployment.

It is described in detail in a [blog post](https://kzn.io/blog/2019/07/10/cloud-custodian/) on the KZN website.
