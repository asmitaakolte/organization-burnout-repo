output "lambda_name" {
  value = aws_lambda_function.burnout_lambda.function_name
}

output "s3_bucket" {
  value = aws_s3_bucket.project_bucket.bucket
}
