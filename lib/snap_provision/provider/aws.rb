class SnapProvision::Provider::AWS < Clamp::Command

  require 'snap_Provision/provider/aws/ops_works'
  require 'snap_Provision/provider/aws/elastic_beanstalk'

  SnapProvision::CLI.subcommand           'aws',      'Perform AWS environment provisioning',     self
  SnapProvision::Provider::AWS.subcommand 'opsworks', 'provision opsworks environments', SnapProvision::Provider::AWS::OpsWorks
  SnapProvision::Provider::AWS.subcommand 'eb',       'manage elastic beanstalk deployments',       SnapProvision::Provider::AWS::ElasticBeanstalk


  def execute
    help
  end

end
