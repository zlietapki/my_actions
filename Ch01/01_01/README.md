# my-first-action
This is my first action.

```
workflow "New workflow" {
  on = "push"
  resolves = ["My First Action"]
}

action "My First Action" {
  uses = "actions/docker/cli@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  args = "run hello-world"
}
```
