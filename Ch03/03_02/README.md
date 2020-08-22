# Use an action from the Marketplace.
Use an action from the Marketplace.

```
workflow "New workflow" {
  resolves = ["Python Syntax Checker"]
  on = "push"
}

action "Python Syntax Checker" {
  uses = "cclauss/Find-Python-syntax-errors-action@0.1.2"
}
```
