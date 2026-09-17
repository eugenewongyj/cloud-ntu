# Purpose of the Lambda Execution Role
* An IAM identity-based role that the AWS Lambda service assumes whenever it runs your code.
* Grants the function runtime permissions to interact with other AWS resources (for example, reading objects from S3, writing logs to CloudWatch Logs, or putting records into DynamoDB).