module "rg" {
  source = "../../module/01_rg"
  rgs    = var.rgs
}

module "vnet" {
  depends_on = [module.rg]
  source     = "../../module/02_vnet"
  vnets      = var.vnets
}

module "subnet" {
  depends_on = [module.vnet]
  source     = "../../module/03_subnet"
  subnets    = var.subnets
}

module "pip" {
  depends_on = [module.rg]
  source     = "../../module/04_pip"
  pips       = var.pips
}

module "net" {
  depends_on = [module.subnet, module.pip]
  source     = "../../module/05_network"
  nets       = var.nets
}
module "nsg" {
  depends_on = [module.rg]
  source     = "../../module/06_nsg"
  nsgs       = var.nsgs
   rule       = var.rule
}
module "association" {
  depends_on = [module.net, module.nsg]
  source     = "../../module/06_nsg"
  nsgs       = var.nsgs
  rule       = var.rule
}
module "vm" {
  depends_on = [module.net, module.rg]
  source     = "../../module/08_vm"
  vms        = var.vms
}
module "store" {
  depends_on = [module.rg]
  source     = "../../module/09_storage"
  stores     = var.stores
}
module "count" {
  depends_on = [module.store]
  source     = "../../module/10_container"
  conts      = var.conts
}
module "bastion" {
  depends_on = [module.subnet, module.pip]
  source     = "../../module/11_bastion"
  bastions   = var.bastions
}
module "peering" {
  depends_on = [module.vnet]
  source     = "../../module/12_vnet_peering"
  peerings   = var.peerings
}