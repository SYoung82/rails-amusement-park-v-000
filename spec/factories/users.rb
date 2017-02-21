FactoryGirl.define do
  factory :user do
    name "MyString"
    password_digest "MyString"
    happiness 1
    nausea ""
    tickets 1
    admin false
  end
end
