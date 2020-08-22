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
