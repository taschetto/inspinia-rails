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

crumb :organization do |organization|
  link organization.name, organization
  parent :organizations
end

crumb :edit_organization do |organization|
  link "Editar #{organization.name}", edit_organization_path(organization)
  parent :organizations
end

crumb :new_organization do
  link "Nova Organização", new_organization_path
  parent :organizations
end

# Projects Breadcrumbs

crumb :projects do
  link "Projetos", project_index_path
end

crumb :project do |project|
  link project.name, project
  parent :projects
end

crumb :edit_project do |project|
  link "Editar #{project.name}", edit_project_path(project)
  parent :projects
end

crumb :new_project do
  link "Novo Projeto", new_project_path
  parent :projects
end