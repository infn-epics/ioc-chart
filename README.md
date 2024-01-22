Helm chart to generate IOC instance deploy 
==================================================

This chart is derived :

see: [EPICS Containers  Repository](https://github.com/epics-containers).

## Example
To install a ioc that have a configuration on a git repo:

```
helm install dt-plc-dlsioc ioc-chart -n dafne --set iocGitRepoConfig.url="https://baltig.infn.it/lnf-da-control/dafne-config.git" --set image="baltig.infn.it:4567/epics-containers/infn-epics-ioc:1.0" --set beamline="dafne" --set iocGitRepoConfig.path="dt-lnf-ioc/config" --set iocGitRepoConfig.enable=true

```

