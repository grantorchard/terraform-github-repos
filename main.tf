# Creates a repository if var.create_repo is true.
resource "github_repository" "this" {
  count       = var.create_repo == true ? 1 : 0
  name        = var.repository_name
	
  description = var.repository_description

  visibility = var.repository_visibility

  dynamic "template" {
		for_each = var.template_repository_name != "" ? [0] : []
		content {
			owner = var.template_repository_owner
			repository = var.template_repository_name
		}
  }
}

# resource "github_branch_default" "this" {
# 	branch = "main"
# 	repository = var.create_repo == true ? github_repository.this[0].id : data.github_repository.this[0].id
# }

# Sources an existing repository if var.create_repo is false.
data "github_repository" "this" {
  count = var.create_repo == false ? 1 : 0
  #name = var.repository_name
	full_name = format("%s%s%s", var.github_connection_name, "/", var.repository_name)
}

resource "github_team" "this" {
	count       = length(var.github_team_members) != 0 ? 1 : 0
  name        = var.project_name
  description = "Team for project ${var.project_name}"
  privacy     = var.github_project_privacy

}

resource "github_team_membership" "this" {
  for_each = toset(var.github_team_members)
	team_id  = github_team.this[0].id
  username = each.value
  role     = "maintainer"
}

resource "github_team_repository" "this" {
	count = length(var.github_team_members) != 0 ? 1 : 0
	team_id    = github_team.this[0].id
  repository = var.create_repo == true ? github_repository.this[0].id : data.github_repository.this[0].id
  permission = "push"
}