workflow "New workflow" {
  on = "push"
  resolves = ["Second Action"]
}

action "First Action" {
  uses = "actions/npm@59b64a598378f31e49cb76f27d6f3312b582f680"
}

action "Third Action" {
  uses = "actions/npm@59b64a598378f31e49cb76f27d6f3312b582f680"
}

action "Second Action" {
  needs = ["First Action", "Third Action"]
  uses = "actions/npm@59b64a598378f31e49cb76f27d6f3312b582f680"
}
