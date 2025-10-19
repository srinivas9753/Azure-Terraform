# 🌩️ Terraform Azure Infrastructure

This repository contains **Terraform configurations** for provisioning a complete **Azure infrastructure** — including Resource Groups, Virtual Networks, Subnets, Network Interfaces, Public IPs, Virtual Machines, and Load Balancers — all managed through Infrastructure as Code (IaC).

---

## 📘 Overview

The goal of this project is to automate the deployment of a fully functional Azure environment using **Terraform**.  
This setup can be used for development, testing, or production environments and serves as a baseline for scalable Azure infrastructure.

---

## 🧱 Azure Resources Created

This Terraform configuration provisions the following Azure resources:

- **Resource Group**
- **Virtual Network (VNet)**
- **Subnets**
- **Network Security Groups (NSG)**
- **Public IP Addresses**
- **Network Interfaces (NICs)**
- **Virtual Machines (VMs)**
- **Load Balancer (Public/Private)**
- **Availability Set** (optional)
- **Storage Account** (for boot diagnostics or remote backend)

---

## 🧰 Prerequisites

Ensure you have the following installed and configured:

| Tool | Version | Installation |
|------|----------|---------------|
| [Terraform](https://developer.hashicorp.com/terraform/downloads) | >= 1.6.0 | `brew install terraform` or download from HashiCorp |
| [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli) | >= 2.50.0 | `az login` to authenticate |
| [Git](https://git-scm.com/downloads) | Latest | For cloning the repository |

Also ensure:
- You have an **Azure Subscription**.
- You have access to create resources and storage accounts.

---

## ⚙️ Authentication

Authenticate with Azure before running Terraform:

```bash
az login
```

For automation (CI/CD or Service Principal use), create and export credentials:

```bash
az ad sp create-for-rbac --name "terraform-sp" --role="Contributor"   --scopes="/subscriptions/<SUBSCRIPTION_ID>"   --sdk-auth
```

Export environment variables:

```bash
export ARM_CLIENT_ID="<appId>"
export ARM_CLIENT_SECRET="<password>"
export ARM_SUBSCRIPTION_ID="<subscriptionId>"
export ARM_TENANT_ID="<tenant>"
```

---

## 🗄️ Remote Backend Configuration (Azure Storage)

Terraform state is stored remotely in an **Azure Storage Account** for team collaboration and state consistency.

Example backend configuration (`backend.tf`):

```hcl
terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "tfstatestorageacct"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}
```

> 💡 Make sure you create the storage account and container **before** running `terraform init`.

---

## 📁 Repository Structure

```
terraform/
├── main.tf              # Core infrastructure (Azure resources)
├── variables.tf         # Input variables
├── outputs.tf           # Output values
├── providers.tf         # Provider configuration
├── backend.tf           # Remote backend (Azure Storage)
├── terraform.tfvars     # Custom variable values
└── README.md            # Project documentation
```

---

## 🚀 Usage

Follow these steps to deploy your Azure infrastructure.

### 1️⃣ Clone the Repository
```bash
git clone https://github.com/<your-username>/terraform.git
cd terraform
```

### 2️⃣ Initialize Terraform
```bash
terraform init
```

### 3️⃣ Validate Configuration
```bash
terraform validate
```

### 4️⃣ Preview Changes
```bash
terraform plan
```

### 5️⃣ Apply the Configuration
```bash
terraform apply
```

### 6️⃣ Destroy Resources (Optional)
```bash
terraform destroy
```

---

## 🌍 Input Variables

| Name | Description | Type | Default |
|------|--------------|------|----------|
| `resource_group_name` | Name of the Azure Resource Group | string | `terraform-rg` |
| `location` | Azure region | string | `eastus` |
| `vnet_name` | Name of the Virtual Network | string | `terraform-vnet` |
| `address_space` | Address space for the VNet | list(string) | `["10.0.0.0/16"]` |
| `subnet_prefix` | Subnet address prefix | list(string) | `["10.0.1.0/24"]` |
| `vm_count` | Number of VMs to create | number | `2` |
| `admin_username` | Admin username for the VM | string | `azureuser` |
| `admin_password` | Admin password for the VM | string | n/a |

---

## 📤 Outputs

| Name | Description |
|------|--------------|
| `vnet_id` | ID of the created Virtual Network |
| `public_ip` | Public IP address of the Load Balancer |
| `vm_names` | Names of created Virtual Machines |
| `resource_group_name` | Resource Group name |

---

## 🧹 Best Practices

- Always use **remote backend** for state management.
- Use **variables.tf** for configurable parameters.
- Never hardcode sensitive values (use environment variables or Azure Key Vault).
- Apply consistent **naming conventions** for Azure resources.
- Run `terraform fmt` to maintain consistent formatting.
