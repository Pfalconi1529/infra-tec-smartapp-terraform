resource "aws_vpc" "terraform_vpc" {

  cidr_block = "192.168.1.0/24"

  tags = merge(
    var.common_tags,
    {
      Name = format(
        "%s-%s-%s-%s",
        var.out_name,
        var.resource_name,
        var.env,
        var.region
      )
    }
  )
}