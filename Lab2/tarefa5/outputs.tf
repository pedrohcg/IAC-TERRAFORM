output "instance_ids" {
    value = module.dsa_ec2_instances.instance_ids
}

output "bucket_id" {
    value = module.s3_bucket.bucket_id
}