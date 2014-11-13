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