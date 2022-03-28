resource "aws_ecr_repository" "flask"{
  name = "flaskapp"
  image_tag_mutability = "MUTABLE"
}
