locals {
    final_name =  "${var.project}-${var.environment}-${var.component}" 
    ec2_tags = merge(
        {
            environment = "dev"
            version = "1.0"
        }
    )
}


