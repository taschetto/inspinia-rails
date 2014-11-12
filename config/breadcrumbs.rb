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