# Kubernetes Database Backup Helm Chart

Backup database to S3 with auto rotate backup in hourly, daily, weekly, monthly and yearly

- PostgreSQL
- MySQL
- MongoDB

## Installation

Requirements

- Helm CLI v3+ (https://helm.sh/docs/intro/install/)

```bash
git clone https://github.com/raniellyferreira/kubernetes-database-backup.git
cd kubernetes-database-backup/
helm upgrade --install my-database-backup chart/
```

## Configuration

```yaml
# PostgreSQL
extraEnv:
- name: PGSQL_BACKUP
  value: "1"
- name: PGSQL_S3_BUCKET_PATH
  value: database/postgresql
- name: PGSQL_HOST
  value: 
- name: PGSQL_USERNAME
  value:
- name: PGSQL_PASSWORD
  valueFrom:
    secretKeyRef:
      name: 
      key: 
- name: PGSQL_IGNORE_DATABASES
  value: postgresql postgres rdsadmin

# MySQL
extraEnv:
- name: MYSQL_BACKUP
  value: "1"
- name: MYSQL_S3_BUCKET_PATH
  value: database/mysql
- name: MYSQL_IGNORE_DATABASES
  value: "information_schema performance_schema mysql sys"
- name: MYSQL_HOST
  valueFrom:
    secretKeyRef:
      name: 
      key: 
- name: MYSQL_ROOT_PASSWORD
  valueFrom:
    secretKeyRef:
      name: 
      key: 
- name: MYSQL_ROOT_USERNAME
  value: root

# MongoDB
extraEnv:
- name: MONGODB_BACKUP
  value: "1"
- name: MONGODB_S3_BUCKET_PATH
  value: database/mongodb
- name: MONGODB_USERNAME
  valueFrom:
    secretKeyRef:
      name: 
      key: 
- name: MONGODB_PASSWORD
  valueFrom:
    secretKeyRef:
      name: 
      key: 
- name: MONGODB_HOST
  valueFrom:
    secretKeyRef:
      name:
      key:
- name: MONGODB_PORT
  value: "27017"
- name: MONGODB_AUTH_DB
  value: admin
  # OR
- name: MONGODB_URI
  value: "mongodb://$(MONGODB_USERNAME):$(MONGODB_PASSWORD)@$(MONGODB_HOST)"
```

---

### Backup rotation with

https://github.com/raniellyferreira/rotate-files
