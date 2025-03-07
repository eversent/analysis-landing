resource "aws_s3_bucket" "app" {
  bucket = "${local.project}-${local.app}-${local.env}-app"
}

resource "aws_s3_bucket_public_access_block" "app_public_access" {
  bucket = aws_s3_bucket.app.id
}

resource "aws_s3_bucket_policy" "app_policy" {
  depends_on = [aws_s3_bucket.app, aws_s3_bucket_public_access_block.app_public_access]
  bucket = aws_s3_bucket.app.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.app.arn}/*"
      }
    ]
  })
}


resource "aws_s3_bucket_website_configuration" "console_config" {
  bucket = aws_s3_bucket.app.id
  index_document {
    suffix = "index.html"
  }
}

locals {
  mime_types = {
    ".html" = "text/html"
    ".png"  = "image/png"
    ".svg"  = "image/svg+xml"
    ".jpg"  = "image/jpeg"
    ".gif"  = "image/gif"
    ".css"  = "text/css"
    ".js"   = "application/javascript"
  }
}

resource "aws_s3_object" "build" {
  for_each = fileset("../dist/", "**")
  bucket = aws_s3_bucket.app.id
  key    = each.value
  source = "../dist/${each.value}"
  etag = filemd5("../dist/${each.value}")
  content_type = lookup(local.mime_types, regex("\\.[^.]+$", each.key), null)
}