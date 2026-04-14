output "security_audit_role_arn" {
    description = " The ARN of the SecurityAuditRole in the WorkloadAccount"
    value = aws_iam_role.security_audit_role.arn
}

output "external_id" {
    description = "The ExternalId required to assume the role"
    value = "security-audit-2026"
}
