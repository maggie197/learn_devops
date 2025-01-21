# Kubernetes
## What is K8s?
Open-source container orchestration tool.
Developed by Google
Helps you manage containerized applications in different deployment environments (physical, virtual, cloud).

## What problems does it solve?

The need for a container orchestration tool
* Trend from Monolith to Microservices
* Increased usage of containers
* Demand for a proper way of managing hundreds of containers

## What features do orchestration tools offer?
* High availability or no downtime
* Scalability or high performance
* Disaster recovery: backup and restore

## K8s cluster

Kubernetes (K8s) cluster is a set of nodes (physical or virtual machines) that run containerized applications. It is the fundamental unit of deployment in Kubernetes and provides a platform for managing and orchestrating containerized applications at scale. A Kubernetes cluster includes multiple components that work together to ensure the cluster's health, performance, and availability.

## Node 

Node is a physical or virtual machine in a Kubernetes cluster that runs applications in the form of Pods.

## Main K8s components 
  
  <table>
  <tr>
    <td style="width: 35%; vertical-align: top;">
      
#### Pod 
* Smallest unit of K8s
* Abstraction over container
* Usually 1 app per Pod
* Each Pod gets its own IP address
* New IP address on recreation
  
    </td>
    <td style="width: 35%; vertical-align: top;">
#### Service

* Permanent IP address
* Lifecycle of Pod and Service NOT connected

#### ConfigMap
* external configuration of the app
  
    </td>
        <td style="width: 35%; vertical-align: top;">
#### Secret 
* used to store secret data
* Base64 encoded
  
    </td>
  </tr>
</table>

## Volume 
Volume is a way to store data that is accessible to Pods. It provides persistent storage for containers, allowing them to retain data across restarts and failures. Volumes can be used for different purposes like caching, sharing data between containers, and persisting stateful application data.

## Deployment
Deployment is a higher-level abstraction that manages the lifecycle of Pods. It provides declarative updates to applications, ensuring that the desired number of replicas of a pod are always running and maintained. If a pod crashes, the Deployment automatically creates a new one to replace it.

## StatefulSet
StatefulSet is a workload API object used to manage stateful applications. Unlike a Deployment, which is designed for stateless applications (where Pods can be interchangeable), a StatefulSet is specifically for applications that require stable, persistent storage and unique network identities across pod restarts.

Stateful applications typically maintain state or data, such as databases (e.g., MySQL, PostgreSQL), messaging systems (e.g., Kafka), or any service that requires persistent storage or predictable network identity.
  ![image](https://github.com/user-attachments/assets/b7eb6fef-8b57-451e-9be0-892308cf0eb0)
