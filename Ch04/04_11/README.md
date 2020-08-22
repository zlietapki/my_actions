# Test keyword releaser
Testing the keyword releaser action.

Commit to this repo with a message that includes the keyword `FIXED`.

Then check the `Releases` page for this repo to see the release created by the action.

_If you created your own custom action and would prefer to use that one, update the workflow to call the action from the location where your custom action is stored._

```
workflow "keyword-monitor" {
  on = "push"
  resolves = [ "keyword-releaser" ]
}

action "keyword-releaser" {
  uses = "./.github/keyword-releaser"
  secrets = ["GITHUB_TOKEN"]
  args = "FIXED"
}
```
