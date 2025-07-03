# Building and Installing Orchestrator-flavored RHDH

This is a partial guide to install Orchestrator-flavored RHDH via the backstage Helm Chart.
This guide is for developing and testing of pre-released versions of orchestrator plugins. This is for cases where the official releases of the backstage chart cannot be used yet, and a local version built from source is needed.

For the official releases, please visit [here](https://github.com/redhat-developer/rhdh-chart)

## To locally build and run Orchestrator via the backstage chart:

For the full documentation, please visit the official backstage Helm Chart [README](https://github.com/redhat-developer/rhdh-chart/blob/main/charts/backstage/README.md).

1. Have an admin install the orchestrator-infra helm chart, which will install the pre-requisites required to install RHDH flavored Orchestrator. This proccess will include installing cluster-wide resources, so should be done with admin privileges
```
helm install <release_name> charts/orchestrator-infra
```

2. Manually approve the Install Plans created by the chart, and wait for the Openshift Serverless and Openshift Serverless Logic Operators to be deployed. To do so, follow the post-install notes given by the chart, or see them [here](https://github.com/redhat-developer/rhdh-chart/blob/main/charts/orchestrator-infra/templates/NOTES.txt)
3. Make any necessary changes to the default values.yaml file. e.g, add your host, authentication providers etc. 
4. Install backstage chart with helm, setting orchestrator to be enabled:

```
helm install <release_name> charts/backstage \
  --set orchestrator.enabled=true \
  --set orchestrator.serverlessLogicOperator.enabled=true \
  --set orchestrator.serverlessOperator.enabled=true
```


## Changing the plugin version or scope

To experiment and test different plugin version, you can make changes to the charts/backstage/templates/_partials.tpl file. 
Change the scope, integrity and packages of the plugins according to the internal release version you intend on using and testing. 



