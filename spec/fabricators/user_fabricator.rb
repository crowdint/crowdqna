Fabricator(:user) do
  name  { Faker::Name.name }
  email { Faker::Internet.email }
end

Fabricator(:admin, :from => :user) do
  email { User::ADMIN_USERS.first }
end
