# Workshop content for Summit 2017

```
docker run -ti --rm -p 8080:8080 -e CONTENT_URL_PREFIX="https://raw.githubusercontent.com/openshift-evangelists/workshop-summit/master" osevg/workshopper
```

```
oc new-app osevg/workshopper -e CONTENT_URL_PREFIX="https://raw.githubusercontent.com/openshift-evangelists/workshop-summit/master"
```
