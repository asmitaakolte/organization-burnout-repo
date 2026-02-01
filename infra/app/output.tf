output "github_actions_role_arn" {
  value = aws_iam_role.github_actions_role.arn
}
output "s3_bucket_name" {
  value = aws_s3_bucket.project_bucket.bucket
}
