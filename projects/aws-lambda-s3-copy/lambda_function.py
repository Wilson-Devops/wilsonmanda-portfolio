
**`lambda_function.py`**
```python
import boto3
import json

def lambda_handler(event, context):
    s3 = boto3.client('s3')
    print("Received event:", json.dumps(event))

    source_bucket = event['Records'][0]['s3']['bucket']['name']
    key = event['Records'][0]['s3']['object']['key']
    dest_bucket = "target-bucket-name"

    copy_source = {'Bucket': source_bucket, 'Key': key}
    s3.copy_object(CopySource=copy_source, Bucket=dest_bucket, Key=key)

    return {'statusCode': 200, 'body': f'File {key} copied to {dest_bucket}'}
