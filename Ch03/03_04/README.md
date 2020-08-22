# Using environment variables

Using environment variables.

_NOTE: THIS WORKFLOW IS FOR DEMONSTRATION PURPOSES.  When the workflow is loaded initially, the workflow will complete with a `Failure` status.  This is because the example action, "Github Action for AWS" requires additional configuration to run successfully._

You can safely ignore this error.

```
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
}
```
