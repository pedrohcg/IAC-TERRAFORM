module "dsa_ec2_instances" {
    source = "./modules/ec2-instances"
    instance_count = 2
    ami = "ami-0a0d9cf81c479446a"
    instance_type = "t2.micro"
    subnet_id = "subnet-07e82559b3b37b4a1"
}

module "s3_bucket" {
    source = "./modules/s3-bucket"
    bucket_name = "dsa-bucket-pedro"
    tags = {"Data Science" = "Academy"}
}