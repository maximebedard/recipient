FactoryGirl.define do
  factory :user do
    email 'bob@bob.com'
    password 'StrongPassword'
    password_confirmation 'StrongPassword'

    factory :henry do
      email 'henry@henry.com'
    end
  end
end
