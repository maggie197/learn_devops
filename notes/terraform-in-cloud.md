# Deploy Terraform script in Google Cloud
## 1. Install Terraform
## 2. Set Up Google Cloud (GCP)
### Install Google Cloud SDK
  1. Verify installation:
```
gcloud version
```
  2. Authenticate with GCP
  Log in and authenticate Terraform with your Google Cloud account:
```
gcloud auth application-default login
```
  3. Set Up a GCP Project
  Create a project if you don’t have one:
```
gcloud projects create my-terraform-project
```
  Set the active project:
```
gcloud config set project my-terraform-project
```
  Enable required APIs:
```
gcloud services enable compute.googleapis.com
```
  Create a service account for Terraform:
```
gcloud iam service-accounts create terraform-sa --display-name "Terraform Service Account"
```
  Grant permissions:
```
  gcloud projects add-iam-policy-binding my-terraform-project \
  --member="serviceAccount:terraform-sa@my-terraform-project.iam.gserviceaccount.com" \
  --role="roles/editor"
```
  Generate and download a JSON key:
```
gcloud iam service-accounts keys create credentials.json \
  --iam-account=terraform-sa@my-terraform-project.iam.gserviceaccount.com
```

## 3. Write Your Terraform Script
### Create a Terraform configuration file (main.tf).
```
provider "google" {
  credentials = file("credentials.json") # Use the downloaded key
  project     = "my-terraform-project"    # project name 
  region      = "us-central1"   # Your desired region
}

resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
  machine_type = "e2-medium"
  zone         = "us-central1-a"    # Your desired region

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
    access_config {
    }
  }
}

```
### Generate and Download the JSON Key
* Click on the service account name.
* Go to the "Keys" tab.
* Click "Add Key" > "Create new key".
* Choose JSON as the key type.
* Click Create – the JSON key will be automatically downloaded.
* Place the downloaded JSON file in your Terraform working directory.

## 4. Initialize Terraform
Run the following commands in the directory where main.tf is saved:
```
terraform init
```
## 5. Plan and Apply Terraform Configuration
Preview changes:
```
terraform plan
```
Apply the configuration:
```
terraform apply
```
Type yes when prompted.

## 6. Verify the Deployment
* Check the instance in the Google Cloud Console: Compute Engine
* Alternatively, list the instances using:
```
gcloud compute instances list
```
## 7. Clean Up Resources
When you're done, destroy the resources to avoid charges:
```
terraform destroy
```
Type yes when prompted.
