# Deploy to EKS: Quick Start Guide

This guide will walk you through deploying a sample application to an Amazon EKS (Elastic Kubernetes Service) cluster using Terraform. **If you are deploying from scratch, you must create the EKS cluster before deploying any Kubernetes workloads.**

---

## Deployment via Github action

This is the easiest way! Simply run [`terraform-deploy`](../.github/workflows/terraform-deploy.yml) action in the repo, and it will apply the current version of the main branch to the AWS account.

This workflow also runs upon anything is merged to the `main` branch, so every new pull request will auto-trigger it upon merge.

If you'd like to deploy to another AWS account, configure a new terraform backend, update the AWS credential secrets in the repo, and you should be good to go!

#### To provision a new Kubernetes service in the existing cluster;
- Create a new branch, add your new service to [`services` here](../terraform/envs/dev/locals.tf#L14).
- Create a PR and merge to main.
- The github action [`terraform-deploy`](../.github/workflows/terraform-deploy.yml) will auto-run to apply terraform. 

#### To provision a new EKS cluster;
- Add your cluster features under [`clusters` here](../terraform/envs/dev/locals.tf#L14).
- Configure a new kubernetes provider, as you'll be deploying to a new EKS cluster now.
- Create a PR and merge to main.
- The github action [`terraform-deploy`](../.github/workflows/terraform-deploy.yml) will auto-run to apply terraform. 

## Terraform architecture

In this project, we use the `locals.tf` file to define our infrastructure resources in a flexible and centralized way. Under `locals.tf`, you'll find maps such as `clusters` and `services`. Each entry in these maps represents a resource configuration, such as an EKS cluster or a Kubernetes service.

For example, the `clusters` local contains definitions for each EKS cluster you want to manage, specifying properties like role names and scaling configurations. Similarly, the `services` local can be used to define multiple Kubernetes services, each with its own deployment and service parameters.

These locals are then referenced in our Terraform modules using `for_each`. For instance, in `kube-service.tf`, we use `for_each = local.services` to iterate over each service defined in `locals.tf`, automatically creating a module instance for each one. This pattern allows you to add, modify, or remove resources simply by editing the `locals.tf` file, and Terraform will handle the rest during the next apply.

This approach makes it easy to scale your infrastructure and keep your configurations DRY (Don't Repeat Yourself), as you don't need to manually duplicate module blocks for each resource.










