 # Deploy a Jupyter Notebook using kubernetes

## 1. Install Kubernetes & kubectl
<br>

1. Make sure you have a working Kubernetes cluster and that kubectl is configured properly.
<br>

You can check this by running in terminal:
```
kubectl get nodes
```
2. Create a .kube folder in which to store the configuration files.

## 2. Deploy Jupyter Notebook on Kubernetes
<br>

### Create a Deployment and Service for Jupyter

* Create a YAML file (e.g., jupyter-deployment.yaml):

```
code: apiVersion: apps/v1
kind: Deployment
metadata:
  name: jupyter-notebook
spec:
  replicas: 1
  selector:
    matchLabels:
      app: jupyter
  template:
    metadata:
      labels:
        app: jupyter
    spec:
      containers:
      - name: jupyter
        image: jupyter/minimal-notebook  # Official Jupyter Docker image
        ports:
        - containerPort: 8888
        env:
        - name: JUPYTER_TOKEN
          value: "mysecurepassword"  # Change this to your desired password
        - name: JUPYTER_ENABLE_LAB
          value: "yes"
        volumeMounts:
        - name: notebook-storage
          mountPath: /home/jovyan/work
      volumes:
      - name: notebook-storage
        emptyDir: {}
---
apiVersion: v1
kind: Service
metadata:
  name: jupyter-service
spec:
  selector:
    app: jupyter
  ports:
    - protocol: TCP
      port: 80
      targetPort: 8888
  type: LoadBalancer  # Use NodePort if LoadBalancer is not available
```
<br>

3. Create Kubernetes cluster

1. Create cluster using cloud computing platform, example, DigitalOcean.
2. Download config file.
3. Save and rename the file to config and move to .kube file. 

## 4. Deploy to Kubernetes
<br>

Run:
```
kubectl apply -f jupyter-deployment.yaml
```
Check if the pod is running:
```
kubectl get pods
```
## 5. Access Jupyter Notebook
<br>

1. You can use the following kubectl port-forward command to access the Jupyter Notebook running in your Kubernetes cluster:
```
kubectl port-forward svc/jupyter-service 8888:80
```
2. After running this, you can access Jupyter Notebook in your browser at:
```
http://localhost:8888
```
## 6. Login to Jupyter Notebook
<br>

Enter the password, which is found in jupyter-deployment.yaml file. 
```
env:
        - name: JUPYTER_TOKEN
          value: "mysecurepassword"  # Change this to your desired password
```