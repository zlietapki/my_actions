# Use Case: Pull Requests
Exploring a use case for Pull Requests with GitHub Actions.

```
workflow "Pull Request Manager" {
  resolves = ["Auto Merge"]
  on = "pull_request"
}

action "Filter Actor" {
  uses = "actions/bin/filter@3c98a2679187369a2116d4f311568596d3725740"
  args = ["actor", "managedkaos", "octocat"]
}

action "Run Pylint" {
  uses = "cclauss/GitHub-Action-for-pylint@master"
  args = "pip install -r requirements.txt ; pylint app.py"
}

action "Auto Approve" {
  needs = [
      "Filter Actor",
      "Run Pylint"
  ]
  uses = "hmarr/auto-approve-action@master"
  secrets = ["GITHUB_TOKEN"]
}

action "Auto Merge" {
  uses = "./.github/merge-pull-request"
  needs = ["Auto Approve"]
  secrets = ["GITHUB_TOKEN"]
}
```
