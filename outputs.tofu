# Output Values
# https://opentofu.org/docs/language/values/outputs

output "name" {
  description = "The network name"
  value       = google_compute_network.this.name
}

output "self_link" {
  description = "The URI of the created resource"
  value       = google_compute_network.this.self_link
}
