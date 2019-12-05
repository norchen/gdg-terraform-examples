provider "aws" {
  region = "us-east-1"
}

variable "project" {
  type = string
}

variable "stage" {
  type = string
}

variable "region" {
  type = string
}


resource "aws_s3_bucket" "website" {
  bucket = join("-", [
    var.project,
    var.stage,
    var.region,
    "fe"])
  acl = "public-read"
  force_destroy = true

  website {
    error_document = "error.html"
    index_document = "index.html"
  }

  tags = {
    project = var.project,
    stage = var.stage,
    region = var.region,
  }

}

resource "aws_s3_bucket_policy" "s3-policy" {
  bucket = aws_s3_bucket.website.id

  policy = data.aws_iam_policy_document.s3-policy.json
}

data "aws_iam_policy_document" "s3-policy" {
  version = "2012-10-17"
  statement {
    sid = "PublicReadGetObject"
    effect = "Allow"

    actions = [
      "s3:GetObject"
    ]

    resources = [
      "${aws_s3_bucket.website.arn}/*"
    ]

    principals {
      type        = "*"
      identifiers = [
        "*"
      ]
    }
  }
}

resource "aws_s3_bucket_object" "index" {
  bucket = aws_s3_bucket.website.id
  key    = "index.html"
  source = "./files/index.html"
  acl = "public-read"
  content_type="text/html"
}

resource "aws_s3_bucket_object" "error" {
  bucket = aws_s3_bucket.website.id
  key    = "error.html"
  source = "./files/error.html"
  acl = "public-read"
}