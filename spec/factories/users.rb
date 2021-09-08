FactoryBot.define do
  factory :user do
    nickname              { 'daisuke' }
    email                 { "test@sample.com" }
    password              { 'password1' }
    password_confirmation { password }
    first_name            { '大輔' }
    last_name             { '金津' }
    first_name_kana       { 'ダイスケ' }
    last_name_kana        { 'カナズ' }
    birthday              { '1999-01-01' }
  end
end
