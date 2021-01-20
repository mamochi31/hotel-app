FactoryBot.define do
  factory :room_type do
    code { 's' }
    name { 'シングル' }
    capacity { 1 }
  end
end