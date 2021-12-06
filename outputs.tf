output "github_repository_full_name" {
	value = var.create_repo == true ? github_repository.this[0].full_name : data.github_repository.this[0].full_name
}

output "github_repository_default_branch" {
	value = var.create_repo == true ? github_repository.this[0].default_branch : data.github_repository.this[0].default_branch
}