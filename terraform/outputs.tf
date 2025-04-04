output "kafka_ip" {
  value = aws_instance.kafka.public_ip
}

output "redis_ip" {
  value = aws_instance.redis.public_ip
}

output "elasticsearch_ip" {
  value = aws_instance.elasticsearch.public_ip
}