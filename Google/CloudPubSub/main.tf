resource "google_pubsub_topic" "topic-ht" {
  name = "topic-ht"
}
resource "google_pubsub_subscription" "sub-ht" {
    name = "sub-ht"
    topic = google_pubsub_topic.topic-ht.name
  
}