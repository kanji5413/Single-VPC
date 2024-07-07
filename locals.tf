locals {
  owners      = var.business_division
  environment = var.environment
  testing      = var.Poc 
  name        = "${var.business_division}-${var.environment}"
  common_tags = {
    Owners      = local.owners
    Environment = local.environment
    Testing     = local.testing
  }
}
