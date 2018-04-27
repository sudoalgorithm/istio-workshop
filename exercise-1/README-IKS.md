# Exercise 1 - Accessing a Kubernetes cluster with IBM Cloud Container Service

Your IBM Cloud account and your Kubernetes cluster have been pre-provisioned for you. Here are the steps to access your cluster:

### Install IBM Cloud Container Service command line utilities

1. Install the IBM Cloud [command line interface](https://clis.ng.bluemix.net/ui/home.html).

2. Log in to the IBM Cloud CLI with the provided IBM API key:   
   `bx login -u ibmlabxx@us.ibm.com --apikey xxxx`      

3. Install the IBM Cloud Container Service plug-in with `bx plugin install container-service -r Bluemix`.

4. To verify that the plug-in is installed properly, run `bx plugin list`. The Container Service plug-in is displayed in the results as `container-service`.

5. Initialize the Container Service plug-in and point the endpoint to us-east.   
   `bx cs region-set us-east`

6. Install the Kubernetes CLI if necessary. Go to the [Kubernetes page](https://kubernetes.io/docs/tasks/tools/install-kubectl/#install-kubectl-binary-via-curl) to install the CLI and follow the steps.


### Access your cluster

1. Set the context for your cluster in your CLI. These commands are used to set the path to the cluster's configuration file as a session variable. The Kubernetes CLI uses this variable to find a local configuration file and certificates that are necessary to connect with the cluster in IBM Cloud.

    a. List the available clusters. You should see the cluster `guestbook`.
    
    ```bash
    bx cs clusters
    ```
    
    b. Download the configuration file and certificates for your `guestbook` cluster using the `cluster-config` command.
    
    ```bash
    bx cs cluster-config guestbook
    ```
    
    c. Copy and paste the output command from the previous step to set the `KUBECONFIG` environment variable and configure your CLI to run `kubectl` commands against your cluster.

2. View details of your cluster.
    ```
    bx cs cluster-get guestbook
    ```

3. Verify the worker nodes in the cluster.   
    ```
    bx cs workers guestbook
    ```
    ```
    bx cs worker-get [worker name]
    ```
    
4. Access the Kubernetes Dashboard.

    a. In a browser, go to http://bluemix.net to access the IBM Cloud console. Log in using the user name and password from your lab proctor.

    b. Click on the _hamburger_ icon in the upper left corner and select *Containers*.

    c. Click on *Clusters* and change the "Location" filter to *US East*.

    d. Click on your *guestbook* cluster and click on the *Kubernetes Dashboard* button.


### Clone the lab repo

From your command line, run:
   
```    
git clone https://github.com/dcberg/istio-workshop

cd istio-workshop
```

This is the working directory for the lab.

### Next step
directly go into Istio topics:
#### [Continue to Exercise 5 - Installing Istio](../exercise-5/README.md)
OR go through the Kubenetes basics
#### [Continue to Exercise 2 - Deploying a microservice to Kubernetes](../exercise-2/README.md)

