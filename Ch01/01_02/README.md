# my-first-action

_NOTE: THIS WORKFLOW IS FOR DEMONSTRATION PURPOSES.  When the workflow is loaded initially, you will see an `Invalid Workflow` error._

If you'd like to get some experience debugging, try to fix the error yourself.  You can do it!

For some direction on fixing the error.  Take a look at this [Solution](SOLUTION.md)

```
workflow "New workflow" {
  on = "push"
  resolves = ["My First Action"]
}

action "My First Action" {
  uses = "actions/docker/cli@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  args = "run hello-world"
  secrets = ["GITHUB_TOKEN", "API_KEY"]
  env = {
    PLANET = "earth"
  }
}
```
