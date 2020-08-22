workflow "keyword-monitor" {
  on = "push"
  resolves = [ "keyword-releaser" ]
}

action "keyword-releaser" {
  uses = "./.github/keyword-releaser"
  secrets = ["GITHUB_TOKEN"]
  args = "FIXED"
}
