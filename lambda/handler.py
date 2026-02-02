import json

def handler(event, context):
    print("Event received:", event)

    return {
        "statusCode": 200,
        "body": json.dumps({
            "message": "Lambda created successfully!",
        })
    }
