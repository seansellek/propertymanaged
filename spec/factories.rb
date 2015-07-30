FactoryGirl.define do
  factory :invite do
    email "test@test.com"
    property
    landlord 
    tenant
    token "MyString"
  end

  factory :property do
    address1 "42 Wallaby Way"
    city 'Sydney'
    state 'Australia'
    zip '33130'
  end

  factory :property_tenant do
    property
    tenant
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
