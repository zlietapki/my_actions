# Add actions to a workflow

Add actions to a workflow.

```
workflow "New workflow" {
  on = "push"
  resolves = ["First Action", "Second Action"]
}

action "First Action" {
  uses = "actions/npm@59b64a598378f31e49cb76f27d6f3312b582f680"
}

action "Second Action" {
  uses = "actions/npm@59b64a598378f31e49cb76f27d6f3312b582f680"
}
```
