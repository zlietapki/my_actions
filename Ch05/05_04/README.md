# Use Case: Deploying a web application

This lesson demonstratres deploying a web application running in AWS Elastic Beanstalk.  The Actions called by the script have been configured to run successfully without interacting with AWS.

_NOTE: When the workflow is loaded initially, you will see an `Invalid Workflow` error._

Values for the secrets `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`, and `AWS_DEFAULT_REGION` need to be entered.

Edit the workflow and enter any values for these secrets.  Commit the changes and check the next run of the workflow.

```
workflow "Pipeline" {
  on = "push"
  resolves = [
    "Test Production",
  ]
}

action "Filter Branch" {
  uses = "actions/bin/filter@3c98a2679187369a2116d4f311568596d3725740"
  args = "branch master"
}

action "Check" {
  uses = "./.github/action-check"
}

action "Build" {
  needs = ["Check", "Filter Branch"]
  uses = "./.github/action-build"
  secrets = [
    "AWS_ACCESS_KEY_ID",
    "AWS_SECRET_ACCESS_KEY",
    "AWS_DEFAULT_REGION",
  ]
}

action "Deploy Production" {
  needs = "Build"
  uses = "./.github/action-deploy"
  args = "production"
  secrets = [
    "AWS_ACCESS_KEY_ID",
    "AWS_SECRET_ACCESS_KEY",
    "AWS_DEFAULT_REGION",
  ]
}

action "Test Production" {
  needs = "Deploy Production"
  uses = "./.github/action-test"
  args = "production"
}
```

If you would like to use this example for deploying to Elastic Beanstalk, customize the following files to work with your application already running in EB:

- `deploy-new-version.sh`
- `test-environment.sh`
- `upload-new-version.sh`
- `Dockerrun.aws.json`
