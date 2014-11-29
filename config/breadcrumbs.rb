crumb :root do
  link "Dashboard", root_path
end

crumb :edit_registration do
  link "Editar perfil", edit_user_registration_path
end

# Organization Breadcrumbs

crumb :organizations do
  link "Organizações", organization_index_path
end

crumb :new_organization do
  link "Nova Organização", new_organization_path
  parent :organizations
end

crumb :edit_organization do |organization|
  link "Editar #{organization.name}", edit_organization_path(organization)
  parent :organizations
end

crumb :organization do |organization|
  link organization.name, organization
  parent :organizations
end

# Projects Breadcrumbs

crumb :all_projects do
  link "Projetos", project_index_path
end

crumb :projects do |organization|
  link "Projetos", organization_project_index_path(organization)
  parent :organization, organization
end

crumb :new_project do |organization|
  link "Novo Projeto", new_organization_project_path(organization)
  parent :projects, organization
end

crumb :edit_project do |project|
  link "Editar #{project.name}", edit_project_path(project)
  parent :all_projects
end

crumb :project do |project|
  link project.name, project
  parent :all_projects
end

# Tasks Breadcrumbs

crumb :all_tasks do
  link "Tarefas", task_index_path
end

crumb :tasks do |project|
  link "Tarefas", project_task_index_path(project)
  parent :project, project
end

crumb :new_task do |project|
  link "Nova Tarefa", new_project_task_path(project)
  parent :tasks, project
end

crumb :edit_task do |task|
  link "Editar #{task.name}", edit_task_path(task)
  parent :all_tasks
end

crumb :task do |task|
  link task.name, task
  parent :all_tasks
end