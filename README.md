The Swift-DevOps-Pipeline is a tool designed to enable organizations to construct a loosely coupled deployment system without getting into small details of deploying various types of applications. It manages the deployment cycle, allowing your organization to manage all deployments in one centralized place. The centralized approach increases control, consistency and clarity across different projects making it easier to track. The system is capable of handling different application types, including web and native applications. When build deployment system from the starting can be resource consuming, the pipeline facilitates creation of deployment system designed to the organization's need in few minutes. 

Swift-DevOps-Pipeline system offers a flexible way to manage and deploy diverse applications without the need for extensive manual intervention. This system is useful for organizations that are looking to streamline their deployment process, maintaining consistency and adapting different application types. 

![Swift-DevOps-Pipeline](https://github.com/ManishPaneri/Swift-DevOps-Pipeline/assets/22714758/53774688-591d-42ae-b2c1-3397504f039d)


## Features
- Centralized Deployment Management:
  - Manage all deployments in one unified location.
- Intuitive Deployment Shell:
  - Provides an intuitive shell to deploy a specific reference (branch, SHA, tag) easily.
- Event-Driven Deployment System:
  - Build an event-driven deployment system for loosely coupled tooling.
- Continuous Delivery and Continuous Deployment:
  - Offers support for both continuous delivery and continuous deployment strategies.
- Advanced Deployment Features:
  - Rollback: Easily revert to a previous version.
  - Backup: Secure your deployments with a backup mechanism.
  - Freeze Window: Control deployment activities by freezing certain windows.
- DevOps Metrics:
  - Provides metrics to facilitate monitoring and optimization of the DevOps process

## Goals
- Manual deployment	✅
- Rollback feature	✅
- Deployment Safety Measure	✅
- Private repositories for teams plan ✅


## Getting Started
To install Pipeline on your server or virtual machine, follow the step below:

1. Fork the repository on GitHub
2. Clone the forked repository to your machine
3. Install necessary development tools using the provided setup script.:
    ```sh
    bash /opt/bin/setup.sh
    ```
4. Set up your development environment: refer to [preparing for development](doc/setup.md) for the detailed document.
5. Explore the services directory for more elaborate example applications.
6. No specific mocks are needed for testing; every element is decoupled and atomic.

## Building and Debugging

Core build flow is Shell-based; find more details in the documentation attached. 
Before creating a build pipeline make sure your service has file called `Makefile` to create application build

If you want to build the `build.tar` file swiftly, run: 

```sh
bash /opt/bin/build.sh {{service name}}
```

The TAR file can be found in `/opt/build/{{service name}}/build.tar`.
(Optional) If you have multiple instance, this path `/opt/build/` can be used as a single mount point.
After that, you can start the release the build using `release.sh`

```sh
bash /opt/bin/release.sh {{service name}}
```

If you want to launch the service in the single instance, the `quick-build` and `build-release` execute using `deployment.sh`

To build and release available with deploy script:
```sh
bash /opt/bin/deploy.sh {{service name}}
```

If you want to roll back the last release, it can be done using rollback script:
```sh
bash /opt/bin/rollback.sh {{service name}}
```

### deployment tests
To check if the service is up and running or the port is occupied, run both the scripts
```sh
ps -p $(cat "/opt/app/{{service name}}/pid.file")
```

OR

```sh
lsof -i: {{service port}}
```

## Continuous Integration

Using these script you can setup jenkins pipeline and same can be used in azure. After selecting shell script task to create a pipeline,  

## Contribution:
- Interested in contributing? Start with issues in the Pipeline issue tracker.
- The project embraces a decoupled and atomic design, making it easy to contribute and extend.
