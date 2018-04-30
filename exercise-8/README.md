## Exercise 8 - Telemetry

### Generate Guestbook Telemetry data

Generate a small load to the application.

```sh
while sleep 0.5; do curl http://$INGRESS_IP/hello/world; done
```
### Grafana
Establish port forward from local port 3000 to the Grafana instance:
```sh
kubectl -n istio-system port-forward $(kubectl -n istio-system get pod -l app=grafana \
  -o jsonpath='{.items[0].metadata.name}') 3000:3000
```

Browse to http://localhost:3000 and navigate to Istio Dashboard.

## Optional Activities
### Prometheus
```sh
kubectl -n istio-system port-forward \
  $(kubectl -n istio-system get pod -l app=prometheus -o jsonpath='{.items[0].metadata.name}') \
  9090:9090
```

Browse to http://localhost:9090/graph and in the “Expression” input box enter: `istio_request_count`. Click **Execute**.

### Service Graph

```sh
kubectl -n istio-system port-forward \
  $(kubectl -n istio-system get pod -l app=servicegraph -o jsonpath='{.items[0].metadata.name}') \
  8088:8088
```

Browse to http://localhost:8088/dotviz

#### [Continue to Exercise 8a - Additional Telemetry and Log](../exercise-8a/README.md)
