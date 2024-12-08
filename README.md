## Learn DevOps 

### **Deploy** an app using _python flask_ on _Ubuntu_ :

1. Prepare Your App

2. Choose a Hosting Platform

- Launch an instance 

    - Choose an AMI and Instance type
    - Create a key pair
    - Launch instance   
  
3. Connect to instance

* Locate your private key file
* Open the terminal there
* Connect to your instance using its Public DNS: **_ssh -i username@instance-public-ip your-key.pem_**  

4. Clone repository from GitHub

* Go to the repository's main page on GitHub
* Click the Code and Copy URL to clipboard
* Open terminal and type: **git clone _your-repository-url_**

5. Install Python and Flask

* sudo apt update 
* sudo apt install python3 python3-pip 
* sudo apt install python3-venv
* sudo apt install python3-flask

6. Run app

* Locate Python app file
* FLASK_APP=app.py flask run --host=0.0.0.0 --port=5000 

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
