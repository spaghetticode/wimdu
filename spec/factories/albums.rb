# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence :title do |n|
    "title n. #{n}"
  end

  factory :album do
    title
    author 'Belle and Sebastian'
  end
end
