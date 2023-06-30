Certainly! Here's an updated `README.md` file that includes the provided information for each file:

---

# Amazon CloudWatch Agent

This repository contains files related to the Amazon CloudWatch Agent and its associated functionality. Below is a list of the files available in this repository:

- CloudWatchAutoAlarms.yaml
- EC2Tagger.yaml
- amazon-cloudwatch-agent-basic-gpu.json
- amazon-cloudwatch-agent-basic.json
- ssm-cloudwatch-instance-role.yaml
- userdata_linux_advanced.sh
- userdata_linux_basic.sh
- userdata_linux_standard.sh

Feel free to explore the files and utilize them as needed for your project.

## File Descriptions

### CloudWatchAutoAlarms.yaml

The CloudWatchAutoAlarms AWS Lambda function enables you to quickly and automatically create a standard set of CloudWatch alarms for your Amazon EC2 instances or AWS Lambda functions using tags. It prevents errors that may occur by manually creating alarms, reduces the time required to deploy alarms, and reduces the skills gap required in order to create and manage alarms. It can be especially useful during a large migration to AWS where many resources may be migrated into your AWS account at once.

### EC2Tagger.yaml

**ALARM_TAG**: Create_Auto_Alarms

The CloudWatchAutoAlarms Lambda function will only create alarms for instances that are tagged with this name tag. The default tag name is Create_Auto_Alarms. If you want to use a different name, change the value of the ALARM_TAG environment variable.

### ssm-cloudwatch-instance-role.yaml

This CloudFormation template can be used to deploy an IAM Role and Instance Profile with AWS managed policies for Amazon CloudWatch and AWS Systems Manager.

### userdata_linux_advanced.sh

This script provides an example of user data for advanced Linux instances. It includes instructions for downloading and installing the Amazon CloudWatch Agent, as well as a sample configuration file for collecting metrics such as CPU usage, disk usage, memory usage, network statistics, and swap usage.

### userdata_linux_basic.sh

This script provides an example of user data for basic Linux instances. It includes instructions for downloading and installing the Amazon CloudWatch Agent, as well as a sample configuration file for collecting metrics such as disk usage and memory usage.

### userdata_linux_standard.sh

This script provides an example of user data for standard Linux instances. It includes instructions for downloading and installing the Amazon CloudWatch Agent, as well as a sample configuration file for collecting metrics such as CPU usage, disk usage, memory usage, and swap usage.

## Getting Started

To get started, make sure you have the necessary permissions and dependencies in place to utilize the files provided. It's recommended to review the documentation and instructions associated with each file for a better understanding of their purpose and how to use them effectively.

## Contributing

Contributions to this repository are welcome! If you would like to contribute, please follow the guidelines outlined in the `CONTRIBUTING.md` file. By contributing, you agree to abide by the code of conduct specified in the `CODE_OF_CONDUCT.md` file.

## License

This project is licensed under the [Apache License 2.0](LICENSE).

---

Please note that the above `README.md` file is a generic template with the provided information. Feel free to customize it further, adding additional sections or details specific to your project.
