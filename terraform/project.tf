terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 3.53"
    }
  }
}

provider "google" {
  project = var.project
}

resource "google_project_service" "run" {
  service = "run.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "iam" {
  service = "iam.googleapis.com"
  disable_on_destroy = false
}

resource "google_service_account" "github_deploy" {
  account_id   = "github-deploy"
  display_name = "GitHub deploy account"
}

resource "google_project_iam_binding" "service_permissions" {
  for_each = toset([
    "run.invoker"
  ])

  role       = "roles/${each.key}"
  members    = [local.github_deploy_sa]
  depends_on = [google_service_account.github_deploy]
}

locals {
  service_name   = "gin-app"
  deployment_name = "github_deploy"
  github_deploy_sa  = "serviceAccount:${google_service_account.github_deploy.email}"
}