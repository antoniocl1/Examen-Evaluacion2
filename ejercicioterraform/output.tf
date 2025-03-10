output "instance_id" {
  description = "El ID de la instancia"
  value       = aws_instance.instancia_ejercicio_2.id
}

output "public_ip" {
  description = "La IP pública de la instancia"
  value       = aws_instance.instancia_ejercicio_2.public_ip
}

output "security_group_id" {
  description = "El ID del grupo de seguridad"
  value       = aws_security_group.grupo_seguridad_ejercicio_2.id
}
