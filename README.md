# A sample terraform configuration to demonstrate creation of resources in two regions simultaneously 

### Prerequisites
- Git
- Terraform CLI
- AWS credentials

### Use Case
Creation of two ec2 instances in two different regions `us-west-2` and `us-east-1`.

### Instructions
1. We need two provider blocks for the two different regions. Create alias for the second region.
```
provider "aws" {
  region = "us-west-2"
}

provider "aws" {
  alias  = "east"
  region = "us-east-1"
}
```
2. We need two resource blocks for each ec2 region and in the second one to point the provider to the alias. (The first one will take the default provider value from the first provider block.)
```
provider      = aws.east
```
### How to use
1. Clone repo https://github.com/GitHuberkata/resources-two-regions.git
2. Navigate to the folder `resources-two-regions`:
``` 
cd resources-two-regions
```
3. Execute the following commands in your terminal:
- `terraform init`
- `terraform apply`
