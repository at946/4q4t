FactoryBot.define do

  factory :member, class: Member do
    team
    name    { "John Smith" }
    role    { "Product Owner" }
    ans_q1  { ["ANS-Q1-A1", "ANS-Q1-A2", "ANS-Q1-A3"] }
    ans_q2  { ["ANS-Q2-A1", "ANS-Q2-A2", "ANS-Q2-A3"] }
    ans_q3  { ["ANS-Q3-A1", "ANS-Q3-A2", "ANS-Q3-A3"] }
    ans_q4  { ["ANS-Q4-A1", "ANS-Q4-A2", "ANS-Q4-A3"] }
  end

  factory :member_space, class: Member do
    team
    name    { " John Smith　" }
    role    { "　Product Owner " }
    ans_q1  { [" ANS-Q1-A1 ", "　ANS-Q1-A2　", " ANS-Q1-A3　"] }
    ans_q2  { [" ANS-Q2-A1 ", "　ANS-Q2-A2　", " ANS-Q2-A3　"] }
    ans_q3  { [" ANS-Q3-A1 ", "　ANS-Q3-A2　", " ANS-Q3-A3　"] }
    ans_q4  { [" ANS-Q4-A1 ", "　ANS-Q4-A2　", " ANS-Q4-A3　"] }
  end

  factory :member2, class: Member do
    team
    name    { "やまだ　たろう" }
    role    { "スクラムマスター" }
    ans_q1  { ["回答-Q1-A1", "回答-Q1-A2", "回答-Q1-A3"] }
    ans_q2  { ["回答-Q2-A1", "回答-Q2-A2", "回答-Q2-A3"] }
    ans_q3  { ["回答-Q3-A1", "回答-Q3-A2", "回答-Q3-A3"] }
    ans_q4  { ["回答-Q4-A1", "回答-Q4-A2", "回答-Q4-A3"] }
  end

  factory :member2_space, class: Member do
    team
    name    { " やまだ　たろう　" }
    role    { "　スクラムマスター " }
    ans_q1  { [" 回答-Q1-A1 ", "　回答-Q1-A2　", " 回答-Q1-A3　"] }
    ans_q2  { [" 回答-Q2-A1 ", "　回答-Q2-A2　", " 回答-Q2-A3　"] }
    ans_q3  { [" 回答-Q3-A1 ", "　回答-Q3-A2　", " 回答-Q3-A3　"] }
    ans_q4  { [" 回答-Q4-A1 ", "　回答-Q4-A2　", " 回答-Q4-A3　"] }
  end

end