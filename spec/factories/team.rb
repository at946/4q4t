FactoryBot.define do

  factory :team do
    name  { "ほげほげプロジェクト" }
  end

  factory :team_space, class: Team do
    name  { " ほげほげプロジェクト　" }
  end

end