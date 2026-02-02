resource "aws_iam_role" "lambda_exec_role" {
  name = "org-burnout-lambda-exec-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "lambda.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })
}

# 2. IAM POLICY (WHAT it can do)
resource "aws_iam_policy" "lambda_policy" {
  name = "org-burnout-lambda-policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Action = [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents",
        "s3:PutObject",
        "s3:GetObject"
      ]
      Resource = "*"
    }]
  })
}

# 3. ATTACH POLICY TO ROLE (CONNECT WHO + WHAT)
resource "aws_iam_role_policy_attachment" "lambda_policy_attach" {
  role       = aws_iam_role.lambda_exec_role.name
  policy_arn = aws_iam_policy.lambda_policy.arn
}
