resource "aws_iam_openid_connect_provider" "tfc" {
  url = "https://app.terraform.io"
  client_id_list = [
    "aws.workload.identity"
  ]
  thumbprint_list = [
    "9e99a48a9960b14926bb7f3b02e22da2b0ab7280"
  ]
}

data "aws_iam_policy_document" "tfc_assume_role" {
  statement {
    effect = "Allow"
    actions = [
      "sts:AssumeRoleWithWebIdentity"
    ]
    principals {
      type = "Federated"
      identifiers = [
        aws_iam_openid_connect_provider.tfc.arn
      ]
    }

    condition {
      test = "StringEquals"
      variable = "app.terraform.io:aud"
      values = [
        "aws.workload.identity"
      ]
    }

    condition {
      test = "StringLike"
      variable = "app.terraform.io:sub"
      values = [
        "organization:${var.tfc_organization_name}:project:${var.tfc_project_name}:workspace:${var.tfc_workspace_name}:run_phase:*"
      ]
    }
  }
}

resource "aws_iam_role" "tfc_role" {
  name = var.role_name
  assume_role_policy = data.aws_iam_policy_document.tfc_assume_role.json
}

resource "aws_iam_role_policy_attachment" "policy" {
  role = aws_iam_role.tfc_role.name
  policy_arn = var.permissions_policy_arn
}