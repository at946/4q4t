feature "03_team_members_join_team", type: :system, js: true do

  before :each do 
    @team = Team.create(name: 'ほげほげプロジェクト')
    @in_name = " 名無しの　権兵衛　"
    @out_name = "名無しの　権兵衛"
    @in_answers1 = ["Sample answer1", "サンプルアンサー１", " Sampleアンサー1　"]
    @out_answers1 = ["Sample answer1", "サンプルアンサー１", "Sampleアンサー1"]
    @in_answers2 = ["Sample answer2", "サンプルアンサー２", " Sampleアンサー2　"]
    @out_answers2 = ["Sample answer2", "サンプルアンサー２", "Sampleアンサー2"]
    @in_answers3 = ["Sample answer3", "サンプルアンサー３", " Sampleアンサー3　"]
    @out_answers3 = ["Sample answer3", "サンプルアンサー３", "Sampleアンサー3"]
    @in_answers4 = ["Sample answer4", "サンプルアンサー４", " Sampleアンサー4　"]
    @out_answers4 = ["Sample answer4", "サンプルアンサー４", "Sampleアンサー4"]
  end

  scenario "User can move create member page when user click on 'answer 4 questions' button on show team page." do
    visit team_path @team
    click_on :answer_button
    expect(page).to have_current_path(new_member_path(team: @team))
  end

  scenario "User can input the 'name' on create member page." do
    visit new_member_path(team: @team)
    fill_in :member_name, with: @in_name
    expect(find("#member_name").value).to eq @in_name
  end

  scenario "User can input up to 3 'Q1' on create member page." do
    visit new_member_path(team: @team)
    fill_in :member_ans_q1_1, with: @in_answers1[0]
    fill_in :member_ans_q1_2, with: @in_answers1[1]
    fill_in :member_ans_q1_3, with: @in_answers1[2]
    expect(find("#member_ans_q1_1").value).to eq @in_answers1[0]
    expect(find("#member_ans_q1_2").value).to eq @in_answers1[1]
    expect(find("#member_ans_q1_3").value).to eq @in_answers1[2]
  end

  scenario "User can input up to 3 'Q2' on create member page." do
    visit new_member_path(team: @team)
    fill_in :member_ans_q2_1, with: @in_answers2[0]
    fill_in :member_ans_q2_2, with: @in_answers2[1]
    fill_in :member_ans_q2_3, with: @in_answers2[2]
    expect(find("#member_ans_q2_1").value).to eq @in_answers2[0]
    expect(find("#member_ans_q2_2").value).to eq @in_answers2[1]
    expect(find("#member_ans_q2_3").value).to eq @in_answers2[2]
  end

  scenario "User can input up to 3 'Q3' on create answer page." do
    visit new_member_path(team: @team)
    fill_in :member_ans_q3_1, with: @in_answers3[0]
    fill_in :member_ans_q3_2, with: @in_answers3[1]
    fill_in :member_ans_q3_3, with: @in_answers3[2]
    expect(find("#member_ans_q3_1").value).to eq @in_answers3[0]
    expect(find("#member_ans_q3_2").value).to eq @in_answers3[1]
    expect(find("#member_ans_q3_3").value).to eq @in_answers3[2]
  end

  scenario "User can input up to 3 'Q4' on create answer page." do
    visit new_member_path(team: @team)
    fill_in :member_ans_q4_1, with: @in_answers4[0]
    fill_in :member_ans_q4_2, with: @in_answers4[1]
    fill_in :member_ans_q4_3, with: @in_answers4[2]
    expect(find("#member_ans_q4_1").value).to eq @in_answers4[0]
    expect(find("#member_ans_q4_2").value).to eq @in_answers4[1]
    expect(find("#member_ans_q4_3").value).to eq @in_answers4[2]
  end

  scenario "Member is created and user can move show team page when user clicks on 'answer' button on create member page with input of name and all questions." do
    expect(Member.all.count).to eq 0
    expect(@team.members.count).to eq 0

    visit new_member_path(team: @team)
    fill_in :member_name, with: @in_name
    fill_in :member_ans_q1_1, with: @in_answers1[0]
    fill_in :member_ans_q1_2, with: @in_answers1[1]
    fill_in :member_ans_q1_3, with: @in_answers1[2]
    fill_in :member_ans_q2_1, with: @in_answers2[0]
    fill_in :member_ans_q2_2, with: @in_answers2[1]
    fill_in :member_ans_q2_3, with: @in_answers2[2]
    fill_in :member_ans_q3_1, with: @in_answers3[0]
    fill_in :member_ans_q3_2, with: @in_answers3[1]
    fill_in :member_ans_q3_3, with: @in_answers3[2]
    fill_in :member_ans_q4_1, with: @in_answers4[0]
    fill_in :member_ans_q4_2, with: @in_answers4[1]
    fill_in :member_ans_q4_3, with: @in_answers4[2]
    click_on :create_member_button

    expect(current_path).to eq team_path(@team)
    expect(Member.all.count).to eq 1
    expect(@team.members.count).to eq 1
    member = Member.last
    expect(member.name).to eq @out_name
    expect(member.name).not_to eq @in_name
    expect(member.ans_q1[0]).to eq @out_answers1[0]
    expect(member.ans_q1[1]).to eq @out_answers1[1]
    expect(member.ans_q1[2]).to eq @out_answers1[2]
    expect(member.ans_q2[0]).to eq @out_answers2[0]
    expect(member.ans_q2[1]).to eq @out_answers2[1]
    expect(member.ans_q2[2]).to eq @out_answers2[2]
    expect(member.ans_q3[0]).to eq @out_answers3[0]
    expect(member.ans_q3[1]).to eq @out_answers3[1]
    expect(member.ans_q3[2]).to eq @out_answers3[2]
    expect(member.ans_q4[0]).to eq @out_answers4[0]
    expect(member.ans_q4[1]).to eq @out_answers4[1]
    expect(member.ans_q4[2]).to eq @out_answers4[2]

    expect(page).to have_text @out_name
    expect(page).to have_text @out_answers1[0]
    expect(page).to have_text @out_answers1[1]
    expect(page).to have_text @out_answers1[2]
    expect(page).to have_text @out_answers2[0]
    expect(page).to have_text @out_answers2[1]
    expect(page).to have_text @out_answers2[2]
    expect(page).to have_text @out_answers3[0]
    expect(page).to have_text @out_answers3[1]
    expect(page).to have_text @out_answers3[2]
    expect(page).to have_text @out_answers4[0]
    expect(page).to have_text @out_answers4[1]
    expect(page).to have_text @out_answers4[2]
  end

  scenario "User can find error message on create member page when user clicks on 'answer' button without 'name'." do
    error_message = "Name can't be blank"
    expect(Member.all.count).to eq 0

    visit new_member_path(team: @team)
    fill_in :member_name, with: ""
    fill_in :member_ans_q1_1, with: @in_answers1[0]
    fill_in :member_ans_q1_2, with: @in_answers1[1]
    fill_in :member_ans_q1_3, with: @in_answers1[2]
    fill_in :member_ans_q2_1, with: @in_answers2[0]
    fill_in :member_ans_q2_2, with: @in_answers2[1]
    fill_in :member_ans_q2_3, with: @in_answers2[2]
    fill_in :member_ans_q3_1, with: @in_answers3[0]
    fill_in :member_ans_q3_2, with: @in_answers3[1]
    fill_in :member_ans_q3_3, with: @in_answers3[2]
    fill_in :member_ans_q4_1, with: @in_answers4[0]
    fill_in :member_ans_q4_2, with: @in_answers4[1]
    fill_in :member_ans_q4_3, with: @in_answers4[2]
    click_on :create_member_button

    expect(page).to have_current_path(new_member_path(team: @team))
    expect(Member.all.count).to eq 0
    expect(@team.members.count).to eq 0
    expect(page).to have_text error_message
    expect(find("#member_ans_q1_1").value).to eq @out_answers1[0]
    expect(find("#member_ans_q1_2").value).to eq @out_answers1[1]
    expect(find("#member_ans_q1_3").value).to eq @out_answers1[2]
    expect(find("#member_ans_q2_1").value).to eq @out_answers2[0]
    expect(find("#member_ans_q2_2").value).to eq @out_answers2[1]
    expect(find("#member_ans_q2_3").value).to eq @out_answers2[2]
    expect(find("#member_ans_q3_1").value).to eq @out_answers3[0]
    expect(find("#member_ans_q3_2").value).to eq @out_answers3[1]
    expect(find("#member_ans_q3_3").value).to eq @out_answers3[2]
    expect(find("#member_ans_q4_1").value).to eq @out_answers4[0]
    expect(find("#member_ans_q4_2").value).to eq @out_answers4[1]
    expect(find("#member_ans_q4_3").value).to eq @out_answers4[2]

    fill_in :member_name, with: " 　"
    click_on :create_member_button

    expect(page).to have_current_path(new_member_path(team: @team))
    expect(Member.all.count).to eq 0
    expect(@team.members.count).to eq 0
    expect(page).to have_text error_message
    expect(find("#member_ans_q1_1").value).to eq @out_answers1[0]
    expect(find("#member_ans_q1_2").value).to eq @out_answers1[1]
    expect(find("#member_ans_q1_3").value).to eq @out_answers1[2]
    expect(find("#member_ans_q2_1").value).to eq @out_answers2[0]
    expect(find("#member_ans_q2_2").value).to eq @out_answers2[1]
    expect(find("#member_ans_q2_3").value).to eq @out_answers2[2]
    expect(find("#member_ans_q3_1").value).to eq @out_answers3[0]
    expect(find("#member_ans_q3_2").value).to eq @out_answers3[1]
    expect(find("#member_ans_q3_3").value).to eq @out_answers3[2]
    expect(find("#member_ans_q4_1").value).to eq @out_answers4[0]
    expect(find("#member_ans_q4_2").value).to eq @out_answers4[1]
    expect(find("#member_ans_q4_3").value).to eq @out_answers4[2]
  end

  scenario "Member is created and user moves to show team page when user clicks on 'Answer' button without all answers for q1 on create member page." do
    expect(Member.all.count).to eq 0
    expect(@team.members.count).to eq 0

    visit new_member_path(team: @team)
    fill_in :member_name, with: @in_name
    fill_in :member_ans_q1_1, with: ""
    fill_in :member_ans_q1_2, with: " "
    fill_in :member_ans_q1_3, with: "　"
    fill_in :member_ans_q2_1, with: @in_answers2[0]
    fill_in :member_ans_q2_2, with: @in_answers2[1]
    fill_in :member_ans_q2_3, with: @in_answers2[2]
    fill_in :member_ans_q3_1, with: @in_answers3[0]
    fill_in :member_ans_q3_2, with: @in_answers3[1]
    fill_in :member_ans_q3_3, with: @in_answers3[2]
    fill_in :member_ans_q4_1, with: @in_answers4[0]
    fill_in :member_ans_q4_2, with: @in_answers4[1]
    fill_in :member_ans_q4_3, with: @in_answers4[2]
    click_on :create_member_button

    expect(current_path).to eq team_path(@team)
    expect(Member.all.count).to eq 1
    expect(@team.members.count).to eq 1
    member = Member.last
    expect(member.name).to eq @out_name
    expect(member.ans_q1[0]).to eq nil
    expect(member.ans_q1[1]).to eq nil
    expect(member.ans_q1[2]).to eq nil
    expect(member.ans_q2[0]).to eq @out_answers2[0]
    expect(member.ans_q2[1]).to eq @out_answers2[1]
    expect(member.ans_q2[2]).to eq @out_answers2[2]
    expect(member.ans_q3[0]).to eq @out_answers3[0]
    expect(member.ans_q3[1]).to eq @out_answers3[1]
    expect(member.ans_q3[2]).to eq @out_answers3[2]
    expect(member.ans_q4[0]).to eq @out_answers4[0]
    expect(member.ans_q4[1]).to eq @out_answers4[1]
    expect(member.ans_q4[2]).to eq @out_answers4[2]

    expect(page).to have_text @out_name
    expect(page).not_to have_text @out_answers1[0]
    expect(page).not_to have_text @out_answers1[1]
    expect(page).not_to have_text @out_answers1[2]
    expect(page).to have_text @out_answers2[0]
    expect(page).to have_text @out_answers2[1]
    expect(page).to have_text @out_answers2[2]
    expect(page).to have_text @out_answers3[0]
    expect(page).to have_text @out_answers3[1]
    expect(page).to have_text @out_answers3[2]
    expect(page).to have_text @out_answers4[0]
    expect(page).to have_text @out_answers4[1]
    expect(page).to have_text @out_answers4[2]
  end

  scenario "Member is created and user moves to show team page when user clicks on 'Answer' button without some answers for q1 on create member page." do
    expect(Member.all.count).to eq 0
    expect(@team.members.count).to eq 0

    visit new_member_path(team: @team)
    fill_in :member_name, with: @in_name
    fill_in :member_ans_q1_1, with: ""
    fill_in :member_ans_q1_2, with: @in_answers1[1]
    fill_in :member_ans_q1_3, with: @in_answers1[2]
    fill_in :member_ans_q2_1, with: @in_answers2[0]
    fill_in :member_ans_q2_2, with: @in_answers2[1]
    fill_in :member_ans_q2_3, with: @in_answers2[2]
    fill_in :member_ans_q3_1, with: @in_answers3[0]
    fill_in :member_ans_q3_2, with: @in_answers3[1]
    fill_in :member_ans_q3_3, with: @in_answers3[2]
    fill_in :member_ans_q4_1, with: @in_answers4[0]
    fill_in :member_ans_q4_2, with: @in_answers4[1]
    fill_in :member_ans_q4_3, with: @in_answers4[2]
    click_on :create_member_button

    expect(current_path).to eq team_path(@team)
    expect(Member.all.count).to eq 1
    expect(@team.members.count).to eq 1
    member = Member.last
    expect(member.name).to eq @out_name
    expect(member.ans_q1[0]).to eq @out_answers1[1]
    expect(member.ans_q1[1]).to eq @out_answers1[2]
    expect(member.ans_q1[2]).to eq nil
    expect(member.ans_q2[0]).to eq @out_answers2[0]
    expect(member.ans_q2[1]).to eq @out_answers2[1]
    expect(member.ans_q2[2]).to eq @out_answers2[2]
    expect(member.ans_q3[0]).to eq @out_answers3[0]
    expect(member.ans_q3[1]).to eq @out_answers3[1]
    expect(member.ans_q3[2]).to eq @out_answers3[2]
    expect(member.ans_q4[0]).to eq @out_answers4[0]
    expect(member.ans_q4[1]).to eq @out_answers4[1]
    expect(member.ans_q4[2]).to eq @out_answers4[2]

    expect(page).to have_text @out_name
    expect(page).not_to have_text @out_answers1[0]
    expect(page).to have_text @out_answers1[1]
    expect(page).to have_text @out_answers1[2]
    expect(page).to have_text @out_answers2[0]
    expect(page).to have_text @out_answers2[1]
    expect(page).to have_text @out_answers2[2]
    expect(page).to have_text @out_answers3[0]
    expect(page).to have_text @out_answers3[1]
    expect(page).to have_text @out_answers3[2]
    expect(page).to have_text @out_answers4[0]
    expect(page).to have_text @out_answers4[1]
    expect(page).to have_text @out_answers4[2]
  end

  scenario "Member is created and user moves to show team page when user clicks on 'Answer' button without all answers for q2 on create member page." do
    expect(Member.all.count).to eq 0
    expect(@team.members.count).to eq 0

    visit new_member_path(team: @team)
    fill_in :member_name, with: @in_name
    fill_in :member_ans_q1_1, with: @in_answers1[0]
    fill_in :member_ans_q1_2, with: @in_answers1[1]
    fill_in :member_ans_q1_3, with: @in_answers1[2]
    fill_in :member_ans_q2_1, with: ""
    fill_in :member_ans_q2_2, with: " "
    fill_in :member_ans_q2_3, with: "　"
    fill_in :member_ans_q3_1, with: @in_answers3[0]
    fill_in :member_ans_q3_2, with: @in_answers3[1]
    fill_in :member_ans_q3_3, with: @in_answers3[2]
    fill_in :member_ans_q4_1, with: @in_answers4[0]
    fill_in :member_ans_q4_2, with: @in_answers4[1]
    fill_in :member_ans_q4_3, with: @in_answers4[2]
    click_on :create_member_button

    expect(current_path).to eq team_path(@team)
    expect(Member.all.count).to eq 1
    expect(@team.members.count).to eq 1
    member = Member.last
    expect(member.name).to eq @out_name
    expect(member.ans_q1[0]).to eq @out_answers1[0]
    expect(member.ans_q1[1]).to eq @out_answers1[1]
    expect(member.ans_q1[2]).to eq @out_answers1[2]
    expect(member.ans_q2[0]).to eq nil
    expect(member.ans_q2[1]).to eq nil
    expect(member.ans_q2[2]).to eq nil
    expect(member.ans_q3[0]).to eq @out_answers3[0]
    expect(member.ans_q3[1]).to eq @out_answers3[1]
    expect(member.ans_q3[2]).to eq @out_answers3[2]
    expect(member.ans_q4[0]).to eq @out_answers4[0]
    expect(member.ans_q4[1]).to eq @out_answers4[1]
    expect(member.ans_q4[2]).to eq @out_answers4[2]

    expect(page).to have_text @out_name
    expect(page).to have_text @out_answers1[0]
    expect(page).to have_text @out_answers1[1]
    expect(page).to have_text @out_answers1[2]
    expect(page).not_to have_text @out_answers2[0]
    expect(page).not_to have_text @out_answers2[1]
    expect(page).not_to have_text @out_answers2[2]
    expect(page).to have_text @out_answers3[0]
    expect(page).to have_text @out_answers3[1]
    expect(page).to have_text @out_answers3[2]
    expect(page).to have_text @out_answers4[0]
    expect(page).to have_text @out_answers4[1]
    expect(page).to have_text @out_answers4[2]
  end

  scenario "Member is created and user moves to show team page when user clicks on 'Answer' button without some answers for q2 on create member page." do
    expect(Member.all.count).to eq 0
    expect(@team.members.count).to eq 0

    visit new_member_path(team: @team)
    fill_in :member_name, with: @in_name
    fill_in :member_ans_q1_1, with: @in_answers1[0]
    fill_in :member_ans_q1_2, with: @in_answers1[1]
    fill_in :member_ans_q1_3, with: @in_answers1[2]
    fill_in :member_ans_q2_1, with: ""
    fill_in :member_ans_q2_2, with: @in_answers2[1]
    fill_in :member_ans_q2_3, with: @in_answers2[2]
    fill_in :member_ans_q3_1, with: @in_answers3[0]
    fill_in :member_ans_q3_2, with: @in_answers3[1]
    fill_in :member_ans_q3_3, with: @in_answers3[2]
    fill_in :member_ans_q4_1, with: @in_answers4[0]
    fill_in :member_ans_q4_2, with: @in_answers4[1]
    fill_in :member_ans_q4_3, with: @in_answers4[2]
    click_on :create_member_button

    expect(current_path).to eq team_path(@team)
    expect(Member.all.count).to eq 1
    expect(@team.members.count).to eq 1
    member = Member.last
    expect(member.name).to eq @out_name
    expect(member.ans_q1[0]).to eq @out_answers1[0]
    expect(member.ans_q1[1]).to eq @out_answers1[1]
    expect(member.ans_q1[2]).to eq @out_answers1[2]
    expect(member.ans_q2[0]).to eq @out_answers2[1]
    expect(member.ans_q2[1]).to eq @out_answers2[2]
    expect(member.ans_q2[2]).to eq nil
    expect(member.ans_q3[0]).to eq @out_answers3[0]
    expect(member.ans_q3[1]).to eq @out_answers3[1]
    expect(member.ans_q3[2]).to eq @out_answers3[2]
    expect(member.ans_q4[0]).to eq @out_answers4[0]
    expect(member.ans_q4[1]).to eq @out_answers4[1]
    expect(member.ans_q4[2]).to eq @out_answers4[2]

    expect(page).to have_text @out_name
    expect(page).to have_text @out_answers1[0]
    expect(page).to have_text @out_answers1[1]
    expect(page).to have_text @out_answers1[2]
    expect(page).not_to have_text @out_answers2[0]
    expect(page).to have_text @out_answers2[1]
    expect(page).to have_text @out_answers2[2]
    expect(page).to have_text @out_answers3[0]
    expect(page).to have_text @out_answers3[1]
    expect(page).to have_text @out_answers3[2]
    expect(page).to have_text @out_answers4[0]
    expect(page).to have_text @out_answers4[1]
    expect(page).to have_text @out_answers4[2]
  end

  scenario "Member is created and user moves to show team page when user clicks on 'Answer' button without all answers for q3 on create member page." do
    expect(Member.all.count).to eq 0
    expect(@team.members.count).to eq 0

    visit new_member_path(team: @team)
    fill_in :member_name, with: @in_name
    fill_in :member_ans_q1_1, with: @in_answers1[0]
    fill_in :member_ans_q1_2, with: @in_answers1[1]
    fill_in :member_ans_q1_3, with: @in_answers1[2]
    fill_in :member_ans_q2_1, with: @in_answers2[0]
    fill_in :member_ans_q2_2, with: @in_answers2[1]
    fill_in :member_ans_q2_3, with: @in_answers2[2]
    fill_in :member_ans_q3_1, with: ""
    fill_in :member_ans_q3_2, with: " "
    fill_in :member_ans_q3_3, with: "　"
    fill_in :member_ans_q4_1, with: @in_answers4[0]
    fill_in :member_ans_q4_2, with: @in_answers4[1]
    fill_in :member_ans_q4_3, with: @in_answers4[2]
    click_on :create_member_button

    expect(current_path).to eq team_path(@team)
    expect(Member.all.count).to eq 1
    expect(@team.members.count).to eq 1
    member = Member.last
    expect(member.name).to eq @out_name
    expect(member.ans_q1[0]).to eq @out_answers1[0]
    expect(member.ans_q1[1]).to eq @out_answers1[1]
    expect(member.ans_q1[2]).to eq @out_answers1[2]
    expect(member.ans_q2[0]).to eq @out_answers2[0]
    expect(member.ans_q2[1]).to eq @out_answers2[1]
    expect(member.ans_q2[2]).to eq @out_answers2[2]
    expect(member.ans_q3[0]).to eq nil
    expect(member.ans_q3[1]).to eq nil
    expect(member.ans_q3[2]).to eq nil
    expect(member.ans_q4[0]).to eq @out_answers4[0]
    expect(member.ans_q4[1]).to eq @out_answers4[1]
    expect(member.ans_q4[2]).to eq @out_answers4[2]

    expect(page).to have_text @out_name
    expect(page).to have_text @out_answers1[0]
    expect(page).to have_text @out_answers1[1]
    expect(page).to have_text @out_answers1[2]
    expect(page).to have_text @out_answers2[0]
    expect(page).to have_text @out_answers2[1]
    expect(page).to have_text @out_answers2[2]
    expect(page).not_to have_text @out_answers3[0]
    expect(page).not_to have_text @out_answers3[1]
    expect(page).not_to have_text @out_answers3[2]
    expect(page).to have_text @out_answers4[0]
    expect(page).to have_text @out_answers4[1]
    expect(page).to have_text @out_answers4[2]
  end

  scenario "Member is created and user moves to show team page when user clicks on 'Answer' button without some answers for q3 on create member page." do
    expect(Member.all.count).to eq 0
    expect(@team.members.count).to eq 0

    visit new_member_path(team: @team)
    fill_in :member_name, with: @in_name
    fill_in :member_ans_q1_1, with: @in_answers1[0]
    fill_in :member_ans_q1_2, with: @in_answers1[1]
    fill_in :member_ans_q1_3, with: @in_answers1[2]
    fill_in :member_ans_q2_1, with: @in_answers2[0]
    fill_in :member_ans_q2_2, with: @in_answers2[1]
    fill_in :member_ans_q2_3, with: @in_answers2[2]
    fill_in :member_ans_q3_1, with: " "
    fill_in :member_ans_q3_2, with: @in_answers3[1]
    fill_in :member_ans_q3_3, with: @in_answers3[2]
    fill_in :member_ans_q4_1, with: @in_answers4[0]
    fill_in :member_ans_q4_2, with: @in_answers4[1]
    fill_in :member_ans_q4_3, with: @in_answers4[2]
    click_on :create_member_button

    expect(current_path).to eq team_path(@team)
    expect(Member.all.count).to eq 1
    expect(@team.members.count).to eq 1
    member = Member.last
    expect(member.name).to eq @out_name
    expect(member.ans_q1[0]).to eq @out_answers1[0]
    expect(member.ans_q1[1]).to eq @out_answers1[1]
    expect(member.ans_q1[2]).to eq @out_answers1[2]
    expect(member.ans_q2[0]).to eq @out_answers2[0]
    expect(member.ans_q2[1]).to eq @out_answers2[1]
    expect(member.ans_q2[2]).to eq @out_answers2[2]
    expect(member.ans_q3[0]).to eq @out_answers3[1]
    expect(member.ans_q3[1]).to eq @out_answers3[2]
    expect(member.ans_q3[2]).to eq nil
    expect(member.ans_q4[0]).to eq @out_answers4[0]
    expect(member.ans_q4[1]).to eq @out_answers4[1]
    expect(member.ans_q4[2]).to eq @out_answers4[2]

    expect(page).to have_text @out_name
    expect(page).to have_text @out_answers1[0]
    expect(page).to have_text @out_answers1[1]
    expect(page).to have_text @out_answers1[2]
    expect(page).to have_text @out_answers2[0]
    expect(page).to have_text @out_answers2[1]
    expect(page).to have_text @out_answers2[2]
    expect(page).not_to have_text @out_answers3[0]
    expect(page).to have_text @out_answers3[1]
    expect(page).to have_text @out_answers3[2]
    expect(page).to have_text @out_answers4[0]
    expect(page).to have_text @out_answers4[1]
    expect(page).to have_text @out_answers4[2]
  end

  scenario "Member is created and user moves to show team page when user clicks on 'Answer' button without all answers for q4 on create member page." do
    expect(Member.all.count).to eq 0
    expect(@team.members.count).to eq 0

    visit new_member_path(team: @team)
    fill_in :member_name, with: @in_name
    fill_in :member_ans_q1_1, with: @in_answers1[0]
    fill_in :member_ans_q1_2, with: @in_answers1[1]
    fill_in :member_ans_q1_3, with: @in_answers1[2]
    fill_in :member_ans_q2_1, with: @in_answers2[0]
    fill_in :member_ans_q2_2, with: @in_answers2[1]
    fill_in :member_ans_q2_3, with: @in_answers2[2]
    fill_in :member_ans_q3_1, with: @in_answers3[0]
    fill_in :member_ans_q3_2, with: @in_answers3[1]
    fill_in :member_ans_q3_3, with: @in_answers3[2]
    fill_in :member_ans_q4_1, with: ""
    fill_in :member_ans_q4_2, with: " "
    fill_in :member_ans_q4_3, with: "　"
    click_on :create_member_button

    expect(current_path).to eq team_path(@team)
    expect(Member.all.count).to eq 1
    expect(@team.members.count).to eq 1
    member = Member.last
    expect(member.name).to eq @out_name
    expect(member.ans_q1[0]).to eq @out_answers1[0]
    expect(member.ans_q1[1]).to eq @out_answers1[1]
    expect(member.ans_q1[2]).to eq @out_answers1[2]
    expect(member.ans_q2[0]).to eq @out_answers2[0]
    expect(member.ans_q2[1]).to eq @out_answers2[1]
    expect(member.ans_q2[2]).to eq @out_answers2[2]
    expect(member.ans_q3[0]).to eq @out_answers3[0]
    expect(member.ans_q3[1]).to eq @out_answers3[1]
    expect(member.ans_q3[2]).to eq @out_answers3[2]
    expect(member.ans_q4[0]).to eq nil
    expect(member.ans_q4[1]).to eq nil
    expect(member.ans_q4[2]).to eq nil

    expect(page).to have_text @out_name
    expect(page).to have_text @out_answers1[0]
    expect(page).to have_text @out_answers1[1]
    expect(page).to have_text @out_answers1[2]
    expect(page).to have_text @out_answers2[0]
    expect(page).to have_text @out_answers2[1]
    expect(page).to have_text @out_answers2[2]
    expect(page).to have_text @out_answers3[0]
    expect(page).to have_text @out_answers3[1]
    expect(page).to have_text @out_answers3[2]
    expect(page).not_to have_text @out_answers4[0]
    expect(page).not_to have_text @out_answers4[1]
    expect(page).not_to have_text @out_answers4[2]
  end

  scenario "Member is created and user moves to show team page when user clicks on 'Answer' button without some answers for q4 on create member page." do
    expect(Member.all.count).to eq 0
    expect(@team.members.count).to eq 0

    visit new_member_path(team: @team)
    fill_in :member_name, with: @in_name
    fill_in :member_ans_q1_1, with: @in_answers1[0]
    fill_in :member_ans_q1_2, with: @in_answers1[1]
    fill_in :member_ans_q1_3, with: @in_answers1[2]
    fill_in :member_ans_q2_1, with: @in_answers2[0]
    fill_in :member_ans_q2_2, with: @in_answers2[1]
    fill_in :member_ans_q2_3, with: @in_answers2[2]
    fill_in :member_ans_q3_1, with: @in_answers3[0]
    fill_in :member_ans_q3_2, with: @in_answers3[1]
    fill_in :member_ans_q3_3, with: @in_answers3[2]
    fill_in :member_ans_q4_1, with: ""
    fill_in :member_ans_q4_2, with: @in_answers4[1]
    fill_in :member_ans_q4_3, with: @in_answers4[2]
    click_on :create_member_button

    expect(current_path).to eq team_path(@team)
    expect(Member.all.count).to eq 1
    expect(@team.members.count).to eq 1
    member = Member.last
    expect(member.name).to eq @out_name
    expect(member.ans_q1[0]).to eq @out_answers1[0]
    expect(member.ans_q1[1]).to eq @out_answers1[1]
    expect(member.ans_q1[2]).to eq @out_answers1[2]
    expect(member.ans_q2[0]).to eq @out_answers2[0]
    expect(member.ans_q2[1]).to eq @out_answers2[1]
    expect(member.ans_q2[2]).to eq @out_answers2[2]
    expect(member.ans_q3[0]).to eq @out_answers3[0]
    expect(member.ans_q3[1]).to eq @out_answers3[1]
    expect(member.ans_q3[2]).to eq @out_answers3[2]
    expect(member.ans_q4[0]).to eq @out_answers4[1]
    expect(member.ans_q4[1]).to eq @out_answers4[2]
    expect(member.ans_q4[2]).to eq nil

    expect(page).to have_text @out_name
    expect(page).to have_text @out_answers1[0]
    expect(page).to have_text @out_answers1[1]
    expect(page).to have_text @out_answers1[2]
    expect(page).to have_text @out_answers2[0]
    expect(page).to have_text @out_answers2[1]
    expect(page).to have_text @out_answers2[2]
    expect(page).to have_text @out_answers3[0]
    expect(page).to have_text @out_answers3[1]
    expect(page).to have_text @out_answers3[2]
    expect(page).not_to have_text @out_answers4[0]
    expect(page).to have_text @out_answers4[1]
    expect(page).to have_text @out_answers4[2]
  end

  scenario "User is redirected to team not found page when user tries to access create member page for not existing team." do
    visit new_member_path(team: "dummy_team")
    expect(page).to have_text "The team is not found."
  end

end
