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
  parent :projects, project.organization
end

crumb :project do |project|
  link project.name, project
  parent :projects, project.organization
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
  parent :tasks, task.project
end

crumb :task do |task|
  link task.name, task
  parent :tasks, task.project
end

# Users Breadcrumbs

crumb :users do
  link "Usuários", user_index_path
end

crumb :user do |user|
  link user.first_name, user
  parent :users
end

crumb :new_user do
  link "Novo Usuário", new_user_path
  parent :users
end

crumb :edit_user do |user|
  link "Editar #{user.first_name}", edit_user_path(user)
  parent :users
end

# Time Entries Breadcrumbs

crumb :time_entries do |user|
  link "Lançamentos", user_time_entry_index_path(user)
end

crumb :time_entry do |time_entry|
  link "Lançamento #{time_entry.id}", time_entry
  parent :time_entries, time_entry.user
end

crumb :new_time_entry do |user|
  link "Novo Lançamento", new_user_time_entry_path(user)
  parent :time_entries, user
end

crumb :edit_time_entry do |time_entry|
  link "Editar Lançamento #{time_entry.id}", edit_time_entry_path(time_entry)
  parent :time_entries, time_entry.user
end