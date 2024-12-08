## **Deploy** an app using  <span style="color: green;"> _**Python Flask**_   </span> on _Ubuntu_ :
1. Prepare Your App
* Create Python file  
 Example:  
```python
from flask import Flask
# Create the Flask app
app = Flask(__name__)
# Define a simple route
@app.route('/')
def hello_world():
    return 'Hello, World!'
# Run the app
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
# Create the Flask app
app = Flask(__name__)
# Define a simple route
@app.route('/')
def home():
    return "Welcome to the Flask App!"
```
2. Choose a Hosting Platform
- Launch an instance 
    - Choose an AMI and Instance type
    - Create a key pair
    - Launch instance   
  
3. Connect to instance
* Navigate to the Directory with the your-key.pem File 
* Open the Terminal
* Connect to your instance using its Public DNS:  
```
ssh -i username@instance-public-ip your-key.pem
```
4. Clone repository from GitHub (Optional)
* Go to the repository's main page on GitHub
* Click the Code and Copy URL to clipboard
* Open terminal and clone your repository content :  
```
git clone https://github.com/username/repository.git
```
5. Install Python and Flask
```
 sudo apt update 
 sudo apt install python3 python3-pip 
 sudo apt install python3-venv
 sudo apt install python3-flask
```
6. Run app using terminal
* Locate Python app file
* Run app using command:
```
FLASK_APP=app.py flask run --host=0.0.0.0 --port=5000 
```
7. Add a security group 
* Go to Instances -> Security -> Security groups 
* Edit inbound rule
* Add rule: 
    * Type: Custom TCP
    * Protocol: TPC
    * Port range: 5000
    * Source type: Anywhere-IPv4
    * Source: 0.0.0.0/0
* Save rules
##  **Deploy** an app using <span style="color: blue;"> _**Docker**_ </span> on _Ubuntu_ :  
1. Prepare Your App
* Create Python file 
* Create an docker file   
     Example:
```docker     
# Use the official Python image from the Docker Hub
FROM python:3.9-slim
# Set the working directory in the container
WORKDIR /app
# Copy the current directory contents into the container at /app
COPY . /app
# Install the dependencies
RUN pip install flask
# Make port 5000 available to the world outside this container
EXPOSE 5000
# Define the command to run the app
CMD ["python", "app.py"]
```
2. Choose a Hosting Platform
- Launch an instance 
    - Choose an AMI and Instance type
    - Create a key pair
    - Launch instance   
  
3. Connect to instance
* Navigate to the Directory with the your-key.pem File 
* Open the Terminal
* Connect to your instance using its Public DNS:  
```
ssh -i username@instance-public-ip your-key.pem
```
4. Clone repository from GitHub (Optional)
* Go to the repository's main page on GitHub
* Click the Code and Copy URL to clipboard
* Open terminal and clone your repository content :  
```
git clone https://github.com/username/repository.git
```
5. Install Docker
``` 
sudo apt update
sudo apt install -y docker.io
sudo systemctl start docker
sudo systemctl enable docker
```
6. Build and Run the Docker Container  
   Navigate to the directory containing your Dockerfile and app
``` 
sudo docker build -t python-app .
sudo docker run -d -p 5000:5000 python-app
 ```
7. Add a security group 
* Go to Instances -> Security -> Security groups 
* Edit inbound rule
* Add rule: 
    * Type: Custom TCP
    * Protocol: TPC
    * Port range: 5000
    * Source type: Anywhere-IPv4
    * Source: 0.0.0.0/0
* Save rules
 8. Run the Docker Container
``` 
 sudo docker run -d -p 5000:5000 python-app
``` 
