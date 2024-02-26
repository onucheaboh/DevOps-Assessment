Part I 

Helm Repository on Azure Blob Storage

This assessment aims to create a Helm repository using Azure Blob Storage with Terraform. Once the Azure Blob Storage is set up, example charts will be pushed into the repository.

A Helm repository is a collection of packaged Helm charts that can be used to deploy applications on Kubernetes clusters. Azure Blob Storage provides a scalable and durable storage solution for hosting Helm charts.

Setup Instructions

These steps are to set up the Helm repository using Azure Blob Storage:
Ensure to configure the storage account with the necessary settings such as access level and replication.


Part II 
Azure Blob Storage HTTP App

This part consists of a simple HTTP app that retrieves the contents of Azure Blob Storage in JSON format upon query. Additionally, it includes a Dockerfile for containerizing the application.

Overview

The HTTP app is designed to run on any Kubernetes cluster and communicate with Azure Blob Storage to retrieve data. It returns the contents of Azure Blob Storage in JSON format when queried.

Setup Instructions

These are the steps to set up the HTTP app and Dockerfile:

Create the HTTP App:
I decided to go with Python as my programming language. Below are the steps:

Create the Dockerfile:
Write a Dockerfile to containerize the HTTP app.
Ensure the Dockerfile includes all necessary dependencies and configurations for the app to run.


Part III

Azure Kubernetes Service (AKS) simplifies the deployment, management, and scaling of containerized applications using Kubernetes. Additionally, Azure SQL Database provides a managed database service for relational databases.

Setup Instructions:

 These steps are to set up the AKS cluster and Azure SQL Database using Terraform:

Define Variables:
Define variables for Azure configuration, AKS cluster, and SQL Database settings in your Terraform configuration file.

Create Resource Group:
Define a resource group where the AKS cluster and SQL Database will be deployed.

Create Virtual Network:
Define a new Azure Virtual Network for the AKS cluster.

Create AKS Cluster:
Define the AKS cluster configuration within the virtual network.

Create Azure SQL Database:
Define the Azure SQL Database configuration.

Output Configuration:
Output the AKS cluster and SQL Database details for reference.


Part IV

Helm Chart GitHub Action

This part sets up a GitHub action that automatically packages the application's Helm chart and pushes it to an S3 repository upon merge to a certain branch.

The Helm Chart GitHub Action automates the process of packaging the Helm chart for your application and uploading it to an S3 repository. This allows for streamlined deployment and distribution of Helm charts.

Setup Instructions

These are the steps to set up the Helm Chart GitHub Action:

Define Workflow:
-Create a YAML file in the github/workflows directory of your GitHub repository
-Define the workflow trigger to run upon merge to a certain branch.
Configure Job Steps:
-Configure the job steps to package the Helm chart and push it to the S3 repository.
-Ensure to set up proper authentication and permissions for accessing the S3 repository.
