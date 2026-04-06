import boto3
import json
import os

dynamodb = boto3.resource("dynamodb")
table = dynamodb.Table(os.environ["TABLE_NAME"])

def lambda_handler(event, context):
    print("Received event:", json.dumps(event))

    for record in event["Records"]:
        bucket = record["s3"]["bucket"]["name"]
        key = record["s3"]["object"]["key"]

        item = {
            "id": key,
            "bucket": bucket,
            "event_time": record["eventTime"],
        }

        table.put_item(Item=item)

    return {"status": "success"}