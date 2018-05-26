variable "aws_region" {
  description = "The AWS region to create things in."
  default     = "us-east-1"
}

variable "vpc_fullcidr" {
  description = "CIDR for VPC"
  default     = "10.0.0.0/16"
}

variable "enable_dns_support" {
  description = "Whether dns is enabled"
  default     = true
}

variable "enable_dns_hostnames" {
  description = "dns hostnames"
  default     = true
}

variable "DnsZoneName" {
  description = "Internal DNS name"
  default     = "myxingfu.net"
}

variable "DNSNameServers" {
  description = "Domain name servers"
  default     = "AmazonProvidedDNS"
}

variable "tenancy" {
  default = "shared"
  description = "Shared or dedicated tenancy"
}

variable "public_subnet1_cidr" {
  description = "CIDR for public subnet 1"
  default     = "10.0.1.0/25"
}

variable "public_subnet2_cidr" {
  description = "CIDR for public subnet 2"
  default     = "10.0.1.128/25"
}

variable "private_web_subnet1_cidr" {
  description = "CIDR for web subnet 1"
  default     = "10.0.2.0/25"
}

variable "private_web_subnet2_cidr" {
  description = "CIDR for web subnet 2"
  default     = "10.0.2.128/25"
}

variable "private_rds_subnet1_cidr" {
  description = "CIDR for RDS subnet 1"
  default     = "10.0.3.0/25"
}

variable "private_rds_subnet2_cidr" {
  description = "CIDR for rds subnet 2"
  default     = "10.0.3.128/25"
}

variable "public_subnet1_az" {
  description = "AZ for public subnet 1"
  default     = "us-east-1a"
}

variable "public_subnet2_az" {
  description = "AZ for public subnet 2"
  default     = "us-east-1b"
}

variable "private_subnet1_az" {
  description = "AZ for private subnet 1"
  default     = "us-east-1a"
}

variable "private_subnet2_az" {
  description = "AZ for private subnet 2"
  default     = "us-east-1b"
}

variable "map_public_ip_on_launch" {
  description = "Attach public IP or not"
  default     = false
}

variable "source-cidr" {
  description = "Source IP for secure traffic"
  default     = ""
}
