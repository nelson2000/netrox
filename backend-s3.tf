terraform {
    backend "s3" {
        bucket = "terra-netrox-state"
        key = "terraform/backend"
        region = "us-west-2"
    }

}