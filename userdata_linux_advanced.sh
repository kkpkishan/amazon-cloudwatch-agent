#!/usr/bin/env bash
# comment out the appropriate linux version for install

# Amazon Linux x86-64
wget https://s3.amazonaws.com/amazoncloudwatch-agent/amazon_linux/amd64/latest/amazon-cloudwatch-agent.rpm -O /tmp/cwagent.rpm
# Amazon Linux ARM64
# wget https://s3.amazonaws.com/amazoncloudwatch-agent/amazon_linux/arm64/latest/amazon-cloudwatch-agent.rpm -O /tmp/cwagent.rpm

# Redhat x86-64
# curl -o /tmp/cwagent.rpm https://s3.amazonaws.com/amazoncloudwatch-agent/redhat/amd64/latest/amazon-cloudwatch-agent.rpm
# Redhat ARM64
# curl -o /tmp/cwagent.rpm https://s3.amazonaws.com/amazoncloudwatch-agent/redhat/arm64/latest/amazon-cloudwatch-agent.rpm

# SUSE x86-64
# wget https://s3.amazonaws.com/amazoncloudwatch-agent/suse/amd64/latest/amazon-cloudwatch-agent.rpm -O /tmp/cwagent.rpm
# SUSE ARM64
# wget https://s3.amazonaws.com/amazoncloudwatch-agent/suse/arm64/latest/amazon-cloudwatch-agent.rpm -O /tmp/cwagent.rpm

# Debian x86-64
# wget https://s3.amazonaws.com/amazoncloudwatch-agent/debian/amd64/latest/amazon-cloudwatch-agent.deb -O /tmp/cwagent.deb
# Debian ARM64
# wget https://s3.amazonaws.com/amazoncloudwatch-agent/debian/arm64/latest/amazon-cloudwatch-agent.deb -O /tmp/cwagent.deb

# Ubuntu x86-64
# curl -o /tmp/cwagent.deb https://s3.amazonaws.com/amazoncloudwatch-agent/ubuntu/amd64/latest/amazon-cloudwatch-agent.deb
# Ubuntu ARM64
# curl -o /tmp/cwagent.deb https://s3.amazonaws.com/amazoncloudwatch-agent/ubuntu/arm64/latest/amazon-cloudwatch-agent.deb

# For RPM install, uncoment next line
rpm -U /tmp/cwagent.rpm

# For Debian package install, uncoment next line
# dpkg -i -E /tmp/cwagent.deb


cat > /tmp/cwconfig.json <<"EOL"
{
	"agent": {
		"metrics_collection_interval": 60,
		"run_as_user": "root"
	},
	"metrics": {
		"append_dimensions": {
			"AutoScalingGroupName": "${aws:AutoScalingGroupName}",
			"ImageId": "${aws:ImageId}",
			"InstanceId": "${aws:InstanceId}",
			"InstanceType": "${aws:InstanceType}"
		},
		"metrics_collected": {
			"cpu": {
				"measurement": [
					"cpu_usage_idle",
					"cpu_usage_iowait",
					"cpu_usage_user",
					"cpu_usage_system"
				],
				"metrics_collection_interval": 60,
				"totalcpu": true
			},
			"disk": {
				"measurement": [
					"used_percent",
					"inodes_free"
				],
				"metrics_collection_interval": 60,
				"resources": [
					"*"
				]
			},
			"diskio": {
				"measurement": [
					"io_time",
					"write_bytes",
					"read_bytes",
					"writes",
					"reads"
				],
				"metrics_collection_interval": 60,
				"resources": [
					"*"
				]
			},
			"mem": {
				"measurement": [
					"mem_used_percent"
				],
				"metrics_collection_interval": 60
			},
			"netstat": {
				"measurement": [
					"tcp_established",
					"tcp_time_wait"
				],
				"metrics_collection_interval": 60
			},
			"swap": {
				"measurement": [
					"swap_used_percent"
				],
				"metrics_collection_interval": 60
			}
		}
	}
}
EOL
echo "Configuring CloudWatch agent with file /tmp/cwconfig.json: "
cat /tmp/cwconfig.json
echo "starting cloudwatch agent"
/opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a fetch-config -m ec2 -c file:/tmp/cwconfig.json -s
