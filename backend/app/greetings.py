import json
import os
import boto3

ddb = boto3.resource('dynamodb')
tbl = ddb.Table(os.environ['TBL_GREETINGS'])


def fetch_greetings(event, context):
    return {
        "statusCode": 200,
        "headers": {
            "Access-Control-Allow-Origin": "*"
        },
        "body": json.dumps({
            "greetings": tbl.scan()['Items']
        })
    }
