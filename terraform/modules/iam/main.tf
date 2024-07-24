resource "aws_iam_role" "eb_role" {
  name = "aws-elasticbeanstalk-ec2-roles"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })

  managed_policy_arns = [
    "arn:aws:iam::aws:policy/AWSElasticBeanstalkWebTier",
    "arn:aws:iam::aws:policy/AWSElasticBeanstalkMulticontainerDocker",
    "arn:aws:iam::aws:policy/AWSElasticBeanstalkWorkerTier",
    "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  ]
}

resource "aws_iam_instance_profile" "eb_profile" {
  name = "elastic-beanstalk-ec2-roles"
  role = aws_iam_role.eb_role.name
}




















# resource "aws_iam_role" "this" {
#   name = "prashansa_iam_role"
#   assume_role_policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Action = "sts:AssumeRole"
#         Effect = "Allow"
#         Principal = {
#           Service = "ec2.amazonaws.com"
#         }
#       }
#     ]
#   })
# }

# data "aws_iam_policy" "aws_managed_policy" {
#   arn = "arn:aws:iam::aws:policy/AmazonSSMFullAccess"
# }

# # data "aws_iam_policy" "codedeploy_managed_policy" {
# #   arn = "arn:aws:iam::aws:policy/AWSCodeDeployFullAccess"
# # }

# data "aws_iam_policy" "s3_read_only_access" {
#   arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
# }

# resource "aws_iam_role_policy_attachment" "role_policy_attachment_SSM" {
#   role       = aws_iam_role.this.name
#   policy_arn = data.aws_iam_policy.aws_managed_policy.arn
# }

# # resource "aws_iam_role_policy_attachment" "role_policy_attachment_CodeDeploy" {
# #   role       = aws_iam_role.this.name
# #   policy_arn = data.aws_iam_policy.codedeploy_managed_policy.arn
# # }

# resource "aws_iam_role_policy_attachment" "attach_s3_read_only_access" {
#   role       = aws_iam_role.this.name
#   policy_arn = data.aws_iam_policy.s3_read_only_access.arn
# }

# resource "aws_iam_instance_profile" "this" {
#   name = "prashansa_iam_aws_instance"
#   role = aws_iam_role.this.name
# }