FactoryBot.define do
  factory :user do
    id(1)
    email('user@user.com')
    password('password')
  end

  factory(:admin, class: User) do
    email('admin@admin.com')
    password('adminpassword')
    admin(true)
  end
end
