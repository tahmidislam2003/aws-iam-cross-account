data "aws_caller_identity" "security" {
    provider = aws.security
}
resource "aws_iam_role" "security_audit_role" {
    provider = aws.workload
    name = "SecurityAuditRole"
    assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
        {
            Effect = "Allow"
            Principal = {
                AWS = "arn:aws:iam::${data.aws_caller_identity.security.account_id}:root"
            }
            Action = "sts:AssumeRole"
            Condition = {
                StringEquals = {
                    "sts:ExternalId" = "security-audit-2026"
                }
                Bool = {
                    "aws:MultiFactorAuthPresent" = "true"
                }
            }
        }
    ]
})

tags = {
    Project     = "IAM-Cross-Account-Access"
    Environment = "Lab"
    ManagedBy   = "Terraform"
  }
}
resource "aws_iam_role_policy_attachment" "security_audit_policy" {
    provider = aws.workload
    role = aws_iam_role.security_audit_role.name
    policy_arn ="arn:aws:iam::aws:policy/SecurityAudit"
}