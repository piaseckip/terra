module "Compute" {
  source             = "./Modules/Compute"
  depends_on         = [module.Network]
  region             = var.region
  zoneA              = var.zoneA
  zoneB              = var.zoneB
  micro              = var.micro
  ami_ubuntu         = var.ami_ubuntu
  ssh_key            = var.ssh_key
  docker_config_file = var.docker_config_file
  name               = var.name
  bootcamp           = var.bootcamp
  ec2_name           = var.ec2_name
  tags               = var.tags
  subnets_id         = module.Network.subnets_list
  vpc_id             = module.Network.vpc_id
  sg_id              = module.Network.sg_group_id


}
module "Network" {
  source   = "./Modules/Network"
  region   = var.region
  zoneA    = var.zoneA
  zoneB    = var.zoneB
  name     = var.name
  bootcamp = var.bootcamp
  tags     = var.tags
}