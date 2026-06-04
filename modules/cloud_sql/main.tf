resource "random_password" "db" {
  length           = var.password_length
  special          = var.password_special
  override_special = var.password_override
}

resource "google_sql_database_instance" "pg" {
  project             = var.project_id
  name                = var.name
  database_version    = var.db_version
  region              = var.region
  deletion_protection = var.deletion_protection

  settings {
    tier              = var.tier
    availability_type = var.availability_type
    disk_autoresize   = true
    disk_type         = var.disk_type

    ip_configuration {
      ipv4_enabled                                  = false
      private_network                               = var.vpc_self_link
      allocated_ip_range                            = var.psa_range_name
      enable_private_path_for_google_cloud_services = true
    }

    backup_configuration { # first 100% it was free then next it will charge 
      enabled                        = true
      start_time                     = var.backup_start_time
      point_in_time_recovery_enabled = true
      transaction_log_retention_days = var.transaction_log_days
      backup_retention_settings {
        retained_backups = var.retained_backups
        retention_unit   = "COUNT"
      }
    }

    maintenance_window { # updates happen anytime best to mention is better to avoid surprices as well no cost for it 
      day          = var.maintenance_day
      hour         = var.maintenance_hour
      update_track = var.maintenance_update_track
    }

    # insights_config { Query Analysis cost 
    #   query_insights_enabled  = true
    #   query_string_length     = var.query_string_length
    #   record_application_tags = true
    #   record_client_address   = false
    # }

    user_labels = var.labels
  }
}

resource "google_sql_database" "db" {
  project  = var.project_id
  instance = google_sql_database_instance.pg.name
  name     = var.db_name
}

resource "google_sql_user" "user" {
  project  = var.project_id
  instance = google_sql_database_instance.pg.name
  name     = var.db_user
  password = random_password.db.result
}