# Terraform - Create an Oracle Object Storage Bucket with S3

Create an Object Storage Bucket in Oracle Cloud with a user and associated Customer Secret Key having full access to the bucket using the S3 API.

## Input Variables

Create a file to store the input variables using the sample file `india.tfvars.sample`. The file should be called `india.tfvars` or edit `bin/plan.sh` with the appropriate file name.

## Deployment

### Step 1

Create a Terraform plan by running plan.sh; the script will read input variables from the file india.tfvars

```
./bin/plan.sh
```

To avoid fetching the latest state of resources from OCI, run the following command.

```
./bin/plan.sh --refresh=false
```

### Step 2

Review the generated plan

```
./bin/view.sh
```

### Step 3

Run the verified plan

```
./bin/apply.sh
```

## Encryption

Sensitive files like the input variables (india.tfvars) and Terraform state files are encrypted before being stored in the repository. 

You must add the unencrypted file paths to `.gitignore`.

Use the following command to decrypt the files after cloning the repository,

```
./bin/decrypt.sh
```

Use the following command after running terraform to update the encrypted files,

```
./bin/encrypt.sh <gpg key id>
```
