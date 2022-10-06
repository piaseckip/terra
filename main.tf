module "Compute" {
  source = "./Modules/Compute"
  depends_on = [module.Network]

  
}
module "Network" {
  source = "./Modules/Network"
}