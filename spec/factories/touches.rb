FactoryBot.define do
  factory :touch do
    email false
    phone false
    postcard false
    social_media false
    in_person false
    letter false
    description "MyText"
    contact nil
  end
end
