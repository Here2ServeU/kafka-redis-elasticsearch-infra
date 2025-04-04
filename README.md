# Kafka, Redis, and Elasticsearch Infrastructure with Terraform & Ansible

This project sets up Kafka (for message streaming), Redis (for caching), and Elasticsearch (for search) on AWS EC2 instances using Terraform for infrastructure provisioning and Ansible for software configuration.

## Components

- Terraform – Provisions EC2 instances and networking
- Ansible – Installs and configures Kafka, Redis, and Elasticsearch

## Use Cases

This infrastructure is ideal for:

1. Real-time data processing platforms using Kafka for event streaming.
2. High-performance web applications that require Redis to cache data and reduce latency.
3. Applications that require full-text search functionality with Elasticsearch, such as e-commerce platforms, logging systems, or analytics dashboards.
4. Distributed microservices environments where Kafka is used for asynchronous communication, Redis for session and state management, and Elasticsearch for storing and querying logs or structured documents.

## Project Structure

```
kafka-redis-elasticsearch-infra/
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── terraform.tfvars
│   └── outputs.tf
├── ansible/
│   ├── inventories/
│   │   └── prod.ini
│   ├── playbooks/
│   │   ├── kafka.yml
│   │   ├── redis.yml
│   │   └── elasticsearch.yml
│   └── roles/
│       ├── kafka/
│       │   └── tasks/main.yml
│       ├── redis/
│       │   └── tasks/main.yml
│       └── elasticsearch/
│           └── tasks/main.yml
```

## Prerequisites

- AWS account with access key configured using `aws configure`
- Terraform installed
- Ansible installed
- SSH key pair created in AWS and stored locally

## Deployment Steps

1. Clone the repository and navigate into the Terraform directory.

```
git clone https://github.com/your-username/kafka-redis-elasticsearch-infra.git
cd kafka-redis-elasticsearch-infra/terraform
```

2. Edit `terraform.tfvars` and replace values as needed:

```
region         = "us-east-1"
ami            = "ami-0c02fb55956c7d316"
instance_type  = "t2.micro"
key_name       = "your-key-name"
subnet_id      = "subnet-xxxxxxxx"
vpc_id         = "vpc-xxxxxxxx"
```

3. Initialize and apply Terraform:

```
terraform init
terraform apply
```

4. Copy the public IPs from the Terraform output and edit `ansible/inventories/prod.ini` with those IPs.

5. Navigate to the Ansible folder and run the playbooks:

```
cd ../ansible
ansible-playbook -i inventories/prod.ini playbooks/kafka.yml
ansible-playbook -i inventories/prod.ini playbooks/redis.yml
ansible-playbook -i inventories/prod.ini playbooks/elasticsearch.yml
```

## Validation

- Kafka: Connect to the instance and run `kafka-console-producer.sh` and `kafka-console-consumer.sh`
- Redis: Run `redis-cli ping` and expect a `PONG`
- Elasticsearch: Use `curl http://<elasticsearch-ip>:9200` to confirm the service is up

## Teardown

To destroy the infrastructure when done:

```
cd terraform
terraform destroy
```

---

## <div align="center">About the Author</div>

<div align="center">
  <img src="assets/emmanuel-naweji.jpg" alt="Emmanuel Naweji" width="120" style="border-radius: 50%;">
</div>

**Emmanuel Naweji** is a seasoned Cloud and DevOps Engineer with years of experience helping companies architect and deploy secure, scalable infrastructure. He is the founder of initiatives that train and mentor individuals seeking careers in IT and has helped hundreds transition into Cloud, DevOps, and Infrastructure roles.

- Book a free consultation: [https://here4you.setmore.com](https://here4you.setmore.com)
- Connect on LinkedIn: [https://www.linkedin.com/in/ready2assist/](https://www.linkedin.com/in/ready2assist/)

Let's connect and discuss how I can help you build reliable, automated infrastructure the right way.
