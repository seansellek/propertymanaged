FactoryGirl.define do
  factory :invite do
    email "me@seansellek.com"
    token 'd76770d7af781d25166df6cd3b120ee734893fd2'
  end

  factory :property do
    address1 "42 Wallaby Way"
    city 'Sydney'
    state 'Australia'
    zip '33130'
    landlord
  end

  factory :property_tenant do
    property
    tenant
    rate 100000
  end
  factory :invoice do

  end

  factory :ticket do
    title 'Broken hose'
    description 'Fix it please'
    property_tenant
  end

  factory :landlord do
    sequence(:email) { |n| "landlord#{n}@people.com" }
    password 'x1234567'
    password_confirmation 'x1234567'
    name 'Kornelije Sajler'
  end

  factory :tenant do
    sequence(:email) { |n| "tenant#{n}@people.com" }
    password 'x1234567'
    password_confirmation 'x1234567'
    name 'Jack Tenant'
  end
end
