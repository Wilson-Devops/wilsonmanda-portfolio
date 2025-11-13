# Cloud Monitoring Setup

### Overview
Configured centralized logging and monitoring for AWS EC2 instances using:
- **Splunk Forwarder** for log ingestion
- **Grafana** for metrics visualization
- **CloudWatch** for performance data

### Steps
1. Install Splunk Universal Forwarder  
2. Forward `/var/log/` to Splunk indexer  
3. Configure Grafana data source (CloudWatch)  
4. Build CPU/Memory/Disk dashboards

**Tech:** Splunk | Grafana | CloudWatch
