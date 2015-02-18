FactoryGirl.define do
  factory :user do
    email 'bob@bob.com'
    password 'StrongPassword'
    password_confirmation 'StrongPassword'
  end
end
