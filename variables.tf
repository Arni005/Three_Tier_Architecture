variable "db_username" {
  type = string
}

variable "db_password" {
  type      = string
  sensitive = true
}

variable "key_name" {
  description = "Name of the existing AWS EC2 Key Pair for SSH access"
  type        = string
}