# Building and Installing Orchestrator-flavored RHDH

This is a partial guide to install Orchestrator-flavored RHDH via the backstage Helm Chart.
This guide is for developing and testing of pre-released versions of orchestrator plugins. This is for cases where the official releases of the backstage chart cannot be used yet, and a local version built from source is needed.

For the official releases, please visit [here](https://github.com/redhat-developer/rhdh-chart)

## To locally build and run Orchestrator via the backstage chart:

For the full documentation, please visit the official backstage Helm Chart [README](https://github.com/redhat-developer/rhdh-chart/blob/main/charts/backstage/README.md).

1. Clone this repository. All steps should be run on the rhdh-chart/ level of the directory.
1. With Cluster Admin privileges, install the orchestrator-infra helm chart. This Helm Chart is included in this repository, and can be build from source. This Chart will install the prerequisites required to install RHDH-flavored Orchestrator. This proccess will include installing cluster-wide resources, so should be done with admin privileges.
Run `helm install <release_name> charts/orchestrator-infra`. Please note we are using the local route, "charts/", and not the official released-chart route. 

1. After installing the chart, you will be prompted to manually approve the Install Plans created by the chart, and wait for the Openshift Serverless and Openshift Serverless Logic Operators to be deployed. To do so, follow the post-install notes given by the chart, or see them [here](https://github.com/redhat-developer/rhdh-chart/blob/main/charts/orchestrator-infra/templates/NOTES.txt).

1. Create a new namespace on the OpenShift cluster where you have installed the orchestrator-infra chart. 
1. Run `helm dependency build charts/backstage`. This will locally build the dependency charts needed for backstage.
* This step may fail and will require you to remove and re-add the helm repo dependencies.
1. Make any necessary changes to the default values.yaml file. e.g, add your host, authentication providers etc. 
1. Install backstage chart with helm, setting orchestrator to be enabled:

```
helm install <release_name> charts/backstage \
  --set orchestrator.enabled=true \
  --set orchestrator.serverlessLogicOperator.enabled=true \
  --set orchestrator.serverlessOperator.enabled=true
```


## Changing the plugin version or scope

To experiment and test different plugin version, you can make changes to the charts/backstage/templates/_partials.tpl file. 
Change the scope, integrity and packages of the plugins according to the internal release version you intend on using and testing. 



