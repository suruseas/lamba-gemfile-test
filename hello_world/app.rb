require 'json'
require 'aws-sdk'

def lambda_handler(event:, context:)
  region = ENV['TARGET_REGION']
  instance_id = ENV['TARGET_EC2_INSTANCE_ID']
  
  ec2 = Aws::EC2::Resource.new(region: region)
  instance = ec2.instance(instance_id)

  {
    statusCode: 200,
    body: {
      message: instance.instance_type,
    }.to_json
  }
end
