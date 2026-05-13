output "tfc_role_arn" {
  value = aws_iam_role.tfc_role.arn
}

output "tfc_role_name" {
  value = aws_iam_role.tfc_role.name
}

output "oidc_provider_arn" {
  value = aws_iam_openid_connect_provider.tfc.arn
}