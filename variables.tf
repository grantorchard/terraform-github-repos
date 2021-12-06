variable "template_repository_owner" {
  type = string
  default = "grantorchard"
}

variable "template_repository_name" {
  type = string
  default = ""
}

variable "repository_name" {
  type = string
}

variable "repository_description" {
  type = string
  default = ""
}

variable "repository_branch" {
  type = string
  default = "main"
}

variable "repository_visibility" {
  type = string
  default = "public"
}

variable "create_repo" {
	type = bool
	default = true
}

variable "repo_provider" {
	type = string
	default = "github"
}

variable "project_name" {
	type = string
}

variable "github_project_privacy" {
	type = string
	default = "closed"
}

variable "github_team_members" {
	type = list(string)
	default = []
}

variable "github_connection_name" {
	type = string
}