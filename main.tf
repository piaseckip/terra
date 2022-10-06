module "Compute" {
  source = "./Modules/Compute"
  depends_on = [module.Network]
  region = var.region
  zoneA = var.zoneA
  zoneB = var.zoneB
  micro = var.micro
  ami-ubuntu = var.ami-ubuntu
  ssh-key = var.ssh-key
  docker-config-file = var.docker-config-file
  name = var.name
  bootcamp = var.bootcamp
  ec2_name = var.ec2_name
  tags = var.tags

  
}
module "Network" {
  source = "./Modules/Network"
  region = var.region
  zoneA = var.zoneA
  zoneB = var.zoneB
  micro = var.micro
  ami-ubuntu = var.ami-ubuntu
  ssh-key = var.ssh-key
  docker-config-file = var.docker-config-file
  name = var.name
  bootcamp = var.bootcamp
  ec2_name = var.ec2_name
  tags = var.tags
}