variable "region" {
  description = "Región de AWS donde se creará la instancia"
  type        = string
  default     = "us-east-1"
}

variable "sg_description" {
  description = "Descripción del grupo de seguridad"
  type        = string
  default     = "SG examen"
}

variable "ami_id" {
  description = "ID de AMI"
  type        = string
  default     = "ami-04b4f1a9cf54c11d0"  
}

variable "instance_type" {
  description = "Instancia"
  type        = string
  default     = "t2.medium"
}

variable "key_name" {
  description = "Clave"
  type        = string
  default     = "vockey"
}
