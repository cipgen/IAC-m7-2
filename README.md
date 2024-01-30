- **Creating initial IAC (Infrastructure as Code) code.**  
- **Testing and estimating infrastructure costs.**  
- **Infrastructure deployment.**  
- **Checking operability.**  
- **Additional settings.**  

------

- **Creating Initial IAC Code:**
  - Initialize GCP configuration:
    ```bash
    gcloud init
    ```
  - List authenticated accounts:
    ```bash
    gcloud auth list
    ```
  - Display Google Cloud SDK information:
    ```bash
    gcloud info
    ```

- **In the `main.tf` file, add the following code block:**
  - This block creates a GKE cluster module with specified settings:
    ```hcl
    module "gke_cluster" {
      source         = "github.com/vit-um/tf-google-gke-cluster"
      GOOGLE_REGION  = var.GOOGLE_REGION
      GOOGLE_PROJECT = var.GOOGLE_PROJECT
      GKE_NUM_NODES  = 2
    }
    ```

- **The `vars.tfvars` file stores sensitive Terraform configurations as variables and will be excluded in `.gitignore`.**

  - Example variable definition in `variables.tf`:
    ```hcl
    variable "GOOGLE_PROJECT" {
      type        = string
      default     = "smiling-rhythm-404620"
      description = "GCP project to use"
    }
    ```

- **Testing and Operational Check:**
  - Initialize Terraform:
    ```bash
    tf init
    ```
  - Format Terraform files:
    ```bash
    tf fmt
    ```
  - Validate Terraform configuration:
    ```bash
    tf validate
    ```
  - Log in to Google Cloud:
    ```bash
    gcloud auth login
    ```
  - Use default login for applications:
    ```bash
    gcloud auth application-default login
    ```
  - Plan deployment with specific variables:
    ```bash
    tf plan -var-file=vars.tfvars
    ```

- **Infrastructure Cost Estimation:**
  - Estimate costs with Infracost:
    ```bash
    infracost breakdown --path .
    ```

- **Deploying Infrastructure:**
  - Apply Terraform configuration with variable file:
    ```bash
    tf apply -var-file=vars.tfvars
    ```

- **Operational Check:**
  - Show Terraform state:
    ```bash
    terraform show 
    ```

- **Additional Settings:**
  - Set up Terraform to use Google Cloud Storage as the backend:
    ```hcl
    terraform {
      backend "gcs" {
        bucket = "cipgen"
        prefix = "terraform/state"
      }
    }
    ```

- **Destroy Cluster:**
  - Remove all resources created by Terraform:
    ```bash
    tf destroy -var-file=vars.tfvars
    ```
