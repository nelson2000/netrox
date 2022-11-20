resource "aws_elastic_beanstalk_application" "netrox-prod" {
  name        = "netrox-prod"
  description = "beanstallk application for netrox-prod instance"

  appversion_lifecycle {
    service_role          = aws_iam_role.beanstalk_service.arn
    max_count             = 128
    delete_source_from_s3 = true
  }
}