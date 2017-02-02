FactoryGirl.define do
  factory :chat_group do
    team 'サンプルチャットグループ'

    after(:build) do |chat_group|
      chat_group.users << build(:user)
    end
  end
end
