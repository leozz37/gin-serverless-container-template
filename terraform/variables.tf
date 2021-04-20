variable "project" {
  type        = string
  description = "Google Cloud Platform Project ID"
}

variable "region" {
  default = "us-central1"
  type    = string
}

variable "docker_image" {
  type        = string
  description = "Docker image URL"
}