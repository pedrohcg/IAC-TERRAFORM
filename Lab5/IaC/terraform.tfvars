project_name = "dsa-lab5"
env = "dsa-env"
vpc_cidr_block = "10.0.0.0/16"
avail_zone_1 = "us-east-2a"
avail_zone_2 = "us-east-2b"
public_subnet_1_cidr_block = "10.0.1.0/24"
public_subnet_2_cidr_block = "10.0.2.0/24"
private_subnet_1_cidr_block = "10.0.3.0/24"
alb_sg_port = "80"
container_port = "80"
awslogs_region = "us-east-2"
docker_image_name = "nginx:latest"
cpu = "256"
memory = "512"
#Caminho ate um buckets3 com um arquivo de variaveis
s3_env_vars_file_arn = "arn:aws:s3:::lab5-dsa-391218393304/vars.env"
health_check_path = "/"