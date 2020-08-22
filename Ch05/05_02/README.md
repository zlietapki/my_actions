# Use Case: Continuous Integration
Demonstrating continuous integration with GitHub Actions

Files include:

- Python web app and requirements.txt
- Dockerfile for creating a container for the app
- Workflow for calling Actions on push
- Local action for linting and testing

```
workflow "Continuous Integration" {
  on = "push"
  resolves = ["GitHub Action for Docker"]
}

action "Check" {
  uses = "./.github/action-check"
}

action "GitHub Action for Docker" {
  uses = "actions/docker/cli@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  needs = ["Check"]
  args = "build ."
}
```
