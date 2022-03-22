resource "aws_ecr_repository" "flaskapp" {
  name                 = "flaskapp"
  image_tag_mutability = "MUTABLE"
}