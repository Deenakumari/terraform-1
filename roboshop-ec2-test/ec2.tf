module "ec2" {
    source = "../terraform-aws-instance"
    sg_ids = var.sg_ids
    tags = var.tags
}