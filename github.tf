/**
 * # Github Repository
 *
 * The Terraform configuration needs to update Github Action Variable 
 * This way we can manage secret and inventory automatically
 */
data "github_repository" "repo" {
  full_name = var.repo_name
}
resource "github_repository_environment" "dev_repo" {
  #repository  = data.github_repository.repo.name
  repository = var.repo_name
  environment = "dev"
}
resource "github_actions_environment_secret" "test_secret" {
  #repository      = data.github_repository.repo.name
  repository = var.repo_name
  environment     = github_repository_environment.dev_repo.environment
  secret_name     = "test_secret_name"
  encrypted_value = "dHVsbGJhbGwxMjM0dHVsbGJhbGwxMjM0Cg=="
}

