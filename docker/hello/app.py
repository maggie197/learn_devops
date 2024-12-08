# app.py
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
