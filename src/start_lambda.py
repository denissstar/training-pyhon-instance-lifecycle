import boto3

region = "us-west-1"
ec2_client = boto3.client("ec2", region_name=region)


def get_instance_ids(): # TODO put this in shared lambda layer
    response = ec2_client.describe_instances()
    instance_ids = []
    for reservation in response["Reservations"]:
        instance_ids.extend([instance["InstanceId"] for instance in reservation["Instances"]])
    return instance_ids


def lambda_handler(event, context):
    instances = get_instance_ids()
    ec2_client.start_instances(InstanceIds=instances)
    print(f"started your instances: {instances}")
