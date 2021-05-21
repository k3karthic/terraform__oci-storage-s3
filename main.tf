/*
 * Variables
 */

variable "compartment" {}

variable "bucket_name" {}
variable "bucket_namespace" {}

/*
 * Providers
 */

provider "oci" {}

/*
 * Configuration
 */


//
// Bucket
//

resource "oci_objectstorage_bucket" "bucket" {
  compartment_id = var.compartment
  name           = var.bucket_name
  namespace      = var.bucket_namespace

  auto_tiering = "InfrequentAccess"
}

//
// S3 User
//

resource "oci_identity_user" "s3" {
  compartment_id = var.compartment
  name           = "ipfs-s3-user"
  description    = "Service account to access ${oci_objectstorage_bucket.bucket.name} using the S3 API"
}

resource "oci_identity_group" "s3" {
  compartment_id = var.compartment
  name           = "ipfs-s3-group"
  description    = "Group with acess to ${oci_objectstorage_bucket.bucket.name} bucket"
}

resource "oci_identity_user_group_membership" "s3" {
  group_id = oci_identity_group.s3.id
  user_id  = oci_identity_user.s3.id
}

resource "oci_identity_policy" "s3" {
  compartment_id = var.compartment
  name           = "ipfs-s3-fullaccess"
  description    = "Provide full access to ${oci_objectstorage_bucket.bucket.name} bucket"

  statements = [
    "ALLOW GROUP ${oci_identity_group.s3.name} TO MANAGE objects IN TENANCY where target.bucket.name='${oci_objectstorage_bucket.bucket.name}'"
  ]
}

resource "oci_identity_customer_secret_key" "s3" {
  display_name = "ipfs-s3-csk"
  user_id      = oci_identity_user.s3.id
}
