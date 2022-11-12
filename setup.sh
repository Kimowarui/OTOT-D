# create local cluster
kind create cluster --name kind-1 --config k8s/kind/cluster-config.yaml

# deploy namespace: kafka
kubectl apply -f .\k8s\kafka-namespace.yaml
kubectl get namespace # Test correctness

# apply zookeeper deployment and zookeeper service
kubectl apply -f ./k8s/zookeeper.yaml
kubectl get services -n kafka # Test correctness

# deploy kafka broker
kubectl apply -f k8s/kafka.yaml
kubectl get pods -n kafka # Test correctness. The Kafka Broker pod might take a minute to move from ContainerCreating status to Running status.

# expose kafka broker
kubectl port-forward <K8S_POD_NAME> 9092 -n kafka