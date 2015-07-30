FactoryGirl.define do  factory :invite do
    email "MyString"
property nil
landlord nil
tenant nil
token "MyString"
  end

  factory :landlord do
    email 'xajler@gmail.com'
    password 'x1234567'
    password_confirmation 'x1234567'
    name 'Kornelije Sajler'
  end

  factory :tenant do
    email 'jack@tenants.com'
    password 'x1234567'
    password_confirmation 'x1234567'
    name 'Jack Tenant'
  end
end
