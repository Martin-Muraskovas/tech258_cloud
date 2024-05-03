# AWS S3 & boto 3 to use the CRUD methods

## What is AWS S3
- Simple Storage Service (S3)
- Data should be accessible anytime anywhere and any amount
- Can be used to host a static website on the Cloud
- Data is stored with no structure.
- Blobs need to be stored inside of a bucket.
- Default setting is that everything is private.
- If blobs are public, then you will have a URL or endpoint to access the blobs from anywhere.
- Built from the ground up so that there is redundancy built-in
- Access from AWS console, AWS CLI for automation, Python boto3

## Using awscli commands within an EC-2 instance
Check python version <br>
`python3 --version`<br>
If there is no installed version of python<br>
`sudo apt-get install python3`<br>
Shorten python3 to python using<br>
`alias python=python3`<br>

Install pip<br>
`sudo apt-get install python3-pip -y`<br>

Install aws cli using pip<br>
`sudo pip install awscli`<br>

Check awscli is installed<br>
`aws --version`<br>
AWS cli commands always start with aws<br>

install boto3 using pip<br>
`sudo pip install boto3`<br>

Authenticate using access key<br>
`aws configure`<br>
    Enter access key ID: enter your own<br>
    Enter secret access key: enter your own<br>
    Enter default region name: `eu-west-1`<br>
    Enter default output format: `json`<br>

To view buckets<br>
`aws s3 ls`<br>

To get help with s3<br>
`aws s3 help`<br>

To make a bucket<br>
`aws s3 mb s3://tech258-martin-first-bucket`<br>

To show the content of a bucket<br>
`aws s3 ls s3://tech258-martin-first-bucket`<br>

Upload a file to the bucket<br>
`echo this is some text > test.txt`<br>
`aws s3 cp test.txt s3://tech258-martin-first-bucket`<br>
`echo this is some text part 2 > test2.txt`<br>
`aws s3 cp test2.txt s3://tech258-martin-first-bucket`<br>

Download the contents of a bucket to the present working directory.<br>
`aws s3 sync s3://tech258-martin-first-bucket .`<br>

:warning: Warning! Will delete without confirmation!<br>
Remove a file<br>
`aws s3 rm s3://tech258-martin-first-bucket/test.txt`<br>

Remove all the files from a bucket<br>
:boom: Warning! Will delete without confirmation!<br>
`aws s3 rm s3://tech258-martin-first-bucket --recursive`<br>

Remove a bucket<br>
You cannot remove a bucket that is not empty unless you add `--force`<br>
`aws s3 rb s3://tech258-martin-first-bucket`<br>
or<br>
:boom: Warning! This command is extremely dangerous!<br>
`aws s3 rb s3://tech258-martin-first-bucket --force`<br>




Python script equivelants:

List all buckets:
```
import boto3

s3 = boto3.client('s3')

response = s3.list_buckets()

for bucket in response['Buckets']:
    print(bucket['Name'])
```

Create an S3 bucket:
```
import boto3

s3 = boto3.client('s3')

bucket_name = 'tech258-martin-test-boto3'

s3.create_bucket(Bucket=bucket_name)
```

Upload data/file to the S3 bucket:
```
import boto3

s3 = boto3.client('s3')

bucket_name = 'tech258-martin-test-boto3'
file_path = 'path_to_your_file'

s3.upload_file(file_path, bucket_name, 'file_name_in_bucket')
```

Download/retrieve content/file from the S3 bucket:
```
import boto3

s3 = boto3.client('s3')

bucket_name = 'tech258-martin-test-boto3'
file_path = 'path_to_save_downloaded_file'

s3.download_file(bucket_name, 'file_name_in_bucket', file_path)
```

Delete content/file from the S3 bucket:
```
import boto3

s3 = boto3.client('s3')

bucket_name = 'tech258-martin-test-boto3'

s3.delete_object(Bucket=bucket_name, Key='file_name_in_bucket')
```

Delete the bucket:
```
import boto3

s3 = boto3.resource('s3')

bucket_name = 'tech258-martin-test-boto3'

bucket = s3.Bucket(bucket_name)
for key in bucket.objects.all():
    key.delete()
bucket.delete()
```