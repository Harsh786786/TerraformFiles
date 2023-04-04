resource "google_sql_database_instance" "htsql" {
  name = "htsql"
  deletion_protection = false
  region = "us-central1"
  settings {
    tier = "db-f1-micro"
  }
  database_version = "MYSQL_5_6"
}

resource "google_sql_user" "user_creation" {
  name = "Harsh"
  password = "Harsh@123"
  instance = google_sql_database_instance.htsql.name
  
}