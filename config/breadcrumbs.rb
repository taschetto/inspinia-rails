crumb :root do
  link "Dashboard", root_path
end

crumb :edit_registration do
  link "Editar perfil", edit_user_registration_path
end

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