# Terraform — Create an Oracle Object Storage Bucket with S3

Create an Object Storage Bucket in Oracle Cloud and a Customer Master Key having full access to the bucket using the S3 API.

## Code Mirrors

* GitHub: [github.com/k3karthic/terraform__oci-storage-s3](https://github.com/k3karthic/terraform__oci-storage-s3/)
* Codeberg: [codeberg.org/k3karthic/terraform__oci-storage-s3](https://codeberg.org/k3karthic/terraform__oci-storage-s3)

## Configuration

Create a file to store the [Terraform input variables](https://www.terraform.io/docs/language/values/variables.html). Use `india.tfvars.sample` as a reference. Keep `india.tfvars` as the filename or change the name in the following files,

* `bin/plan.sh`

## Deployment

**Step 1:** Use the following command to create a [Terraform plan](https://www.terraform.io/docs/cli/run/index.html#planning),
```
$ ./bin/plan.sh
```

To avoid fetching the latest state of resources, use the following command,
```
$ ./bin/plan.sh -refresh=false
```

**Step 2:** Review the plan using the following command,
```
$ ./bin/view.sh
```

**Step 3:** [Apply](https://www.terraform.io/docs/cli/run/index.html#applying) the plan using the following command,
```
$ ./bin/apply.sh
```

## Encryption

Encrypt sensitive files (Terraform state) before saving them. `.gitignore` must contain the unencrypted file paths.

Use the following command to decrypt the files after cloning the repository,

```
$ ./bin/decrypt.sh
```

Use the following command after running terraform to update the encrypted files,

```
$ ./bin/encrypt.sh <gpg key id>
```
