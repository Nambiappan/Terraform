provider "aws" {
  access_key = "${var.acckey}"
  secret_key = "${var.seckey}"
  region     = "${var.awsregion}"
}
