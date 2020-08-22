workflow "New workflow" {
  on = "push"
  resolves = ["GitHub Action for AWS"]
}

action "GitHub Action for AWS" {
  uses = "actions/aws/cli@efb074ae4510f2d12c7801e4461b65bf5e8317e6"
  args = "ec2 describe-instances"
  env = {
    AWS_DEFAULT_REGION = "us-west-2"
    AWS_DEFAULT_OUTPUT = "json"
  }
  secrets = ["AWS_SECRET_ACCESS_KEY", "AWS_ACCESS_KEY_ID"]
}
