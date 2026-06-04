resource "google_storage_bucket" "frontend" {
  project                     = var.project_id
  name                        = var.frontend_bucket
  location                    = var.region
  uniform_bucket_level_access = true
  labels                      = var.labels
  force_destroy               = var.environment == "staging" ? true : false

  website {
    main_page_suffix = var.website_index
    not_found_page   = var.website_index
  }

  cors {
    origin          = var.cors_origins
    method          = var.cors_methods
    response_header = var.cors_headers
    max_age_seconds = var.cors_max_age
  }
}

resource "google_storage_bucket_iam_member" "frontend_public" {
  bucket = google_storage_bucket.frontend.name
  role   = "roles/storage.objectViewer"
  member = "allUsers"
}