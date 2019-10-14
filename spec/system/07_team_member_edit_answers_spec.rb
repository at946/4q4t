feature "07_team_member_edit_answers", type: :system, js: true do

  before :each do
    @team = Team.create(name: "ほげほげプロジェクト")
    @member = @team.members.create(
      name: "John Smith",
      ans_q1: ["A1-Q1", "A2-Q1", "A3-Q1"],
      ans_q2: ["A1-Q2", "A2-Q2", "A3-Q2"],
      ans_q3: ["A1-Q3", "A2-Q3", "A3-Q3"],
      ans_q4: ["A1-Q4", "A2-Q4", "A3-Q4"],
    )
    @new_answers = ["NEW-A1", "NEW-A2", "NEW-A3"]
  end

  scenario "Answer for Q1 is filled in on edit member page." do
    visit edit_member_path @member
    expect(find("#member_ans_q1_1").value).to eq @member.ans_q1[0]
    expect(find("#member_ans_q1_2").value).to eq @member.ans_q1[1]
    expect(find("#member_ans_q1_3").value).to eq @member.ans_q1[2]
  end

  scenario "Answer for Q2 is filled in on edit member page." do
    visit edit_member_path @member
    expect(find("#member_ans_q2_1").value).to eq @member.ans_q2[0]
    expect(find("#member_ans_q2_2").value).to eq @member.ans_q2[1]
    expect(find("#member_ans_q2_3").value).to eq @member.ans_q2[2]
  end

  scenario "Answer for Q3 is filled in on edit member page." do
    visit edit_member_path @member
    expect(find("#member_ans_q3_1").value).to eq @member.ans_q3[0]
    expect(find("#member_ans_q3_2").value).to eq @member.ans_q3[1]
    expect(find("#member_ans_q3_3").value).to eq @member.ans_q3[2]
  end

  scenario "Answer for Q4 is filled in on edit member page." do
    visit edit_member_path @member
    expect(find("#member_ans_q4_1").value).to eq @member.ans_q4[0]
    expect(find("#member_ans_q4_2").value).to eq @member.ans_q4[1]
    expect(find("#member_ans_q4_3").value).to eq @member.ans_q4[2]
  end

  scenario "Answer for Q1 is updated and user moves to team page when user input all answers for Q1 to blank and clicks on 'update' button on edit member page." do
    visit edit_member_path @member
    fill_in :member_ans_q1_1, with: ""
    fill_in :member_ans_q1_2, with: " "
    fill_in :member_ans_q1_3, with: "　"
    click_on :update_member_button

    expect(current_path).to eq team_path @team
    @member.ans_q1.each do |ans|
      expect(page).not_to have_text ans
    end
    expect(page).to have_text "No answer."
  end

  scenario "Answer for Q1 is updated and user moves to team page when user input some answers for Q1 to blank and clicks on 'update' button on edit member page." do
    visit edit_member_path @member
    fill_in :member_ans_q1_1, with: ""
    click_on :update_member_button

    expect(current_path).to eq team_path @team
    expect(page).not_to have_text @member.ans_q1[0]
    expect(page).to have_text @member.ans_q1[1]
    expect(page).to have_text @member.ans_q1[2]
    expect(page).not_to have_text "No answer."
  end

  scenario "Answer for Q1 is updated and user moves to team page when user input all answers for Q1 and clicks on 'update' button on edit member page." do
    visit edit_member_path @member
    fill_in :member_ans_q1_1, with: @new_answers[0]
    fill_in :member_ans_q1_2, with: " " + @new_answers[1]
    fill_in :member_ans_q1_3, with: @new_answers[2] + "　"
    click_on :update_member_button

    expect(current_path).to eq team_path @team
    expect(page).to have_text @new_answers[0]
    expect(page).to have_text @new_answers[1]
    expect(page).to have_text @new_answers[2]
    expect(page).not_to have_text "No answer."
  end

  scenario "Answer for Q2 is updated and user moves to team page when user input all answers for Q2 to blank and clicks on 'update' button on edit member page." do
    visit edit_member_path @member
    fill_in :member_ans_q2_1, with: ""
    fill_in :member_ans_q2_2, with: " "
    fill_in :member_ans_q2_3, with: "　"
    click_on :update_member_button

    expect(current_path).to eq team_path @team
    @member.ans_q2.each do |ans|
      expect(page).not_to have_text ans
    end
    expect(page).to have_text "No answer."
  end

  scenario "Answer for Q2 is updated and user moves to team page when user input some answers for Q2 to blank and clicks on 'update' button on edit member page." do
    visit edit_member_path @member
    fill_in :member_ans_q2_1, with: ""
    click_on :update_member_button

    expect(current_path).to eq team_path @team
    expect(page).not_to have_text @member.ans_q2[0]
    expect(page).to have_text @member.ans_q2[1]
    expect(page).to have_text @member.ans_q2[2]
    expect(page).not_to have_text "No answer."
  end

  scenario "Answer for Q2 is updated and user moves to team page when user input all answers for Q2 and clicks on 'update' button on edit member page." do
    visit edit_member_path @member
    fill_in :member_ans_q2_1, with: @new_answers[0]
    fill_in :member_ans_q2_2, with: " " + @new_answers[1]
    fill_in :member_ans_q2_3, with: @new_answers[2] + "　"
    click_on :update_member_button

    expect(current_path).to eq team_path @team
    expect(page).to have_text @new_answers[0]
    expect(page).to have_text @new_answers[1]
    expect(page).to have_text @new_answers[2]
    expect(page).not_to have_text "No answer."
  end

  scenario "Answer for Q3 is updated and user moves to team page when user input all answers for Q3 to blank and clicks on 'update' button on edit member page." do
    visit edit_member_path @member
    fill_in :member_ans_q3_1, with: ""
    fill_in :member_ans_q3_2, with: " "
    fill_in :member_ans_q3_3, with: "　"
    click_on :update_member_button

    expect(current_path).to eq team_path @team
    @member.ans_q3.each do |ans|
      expect(page).not_to have_text ans
    end
    expect(page).to have_text "No answer."
  end

  scenario "Answer for Q3 is updated and user moves to team page when user input some answers for Q3 to blank and clicks on 'update' button on edit member page." do
    visit edit_member_path @member
    fill_in :member_ans_q3_1, with: ""
    click_on :update_member_button

    expect(current_path).to eq team_path @team
    expect(page).not_to have_text @member.ans_q3[0]
    expect(page).to have_text @member.ans_q3[1]
    expect(page).to have_text @member.ans_q3[2]
    expect(page).not_to have_text "No answer."
  end

  scenario "Answer for Q3 is updated and user moves to team page when user input all answers for Q3 and clicks on 'update' button on edit member page." do
    visit edit_member_path @member
    fill_in :member_ans_q3_1, with: @new_answers[0]
    fill_in :member_ans_q3_2, with: " " + @new_answers[1]
    fill_in :member_ans_q3_3, with: @new_answers[2] + "　"
    click_on :update_member_button

    expect(current_path).to eq team_path @team
    expect(page).to have_text @new_answers[0]
    expect(page).to have_text @new_answers[1]
    expect(page).to have_text @new_answers[2]
    expect(page).not_to have_text "No answer."
  end

  scenario "Answer for Q4 is updated and user moves to team page when user input all answers for Q4 to blank and clicks on 'update' button on edit member page." do
    visit edit_member_path @member
    fill_in :member_ans_q4_1, with: ""
    fill_in :member_ans_q4_2, with: " "
    fill_in :member_ans_q4_3, with: "　"
    click_on :update_member_button

    expect(current_path).to eq team_path @team
    @member.ans_q4.each do |ans|
      expect(page).not_to have_text ans
    end
    expect(page).to have_text "No answer."
  end

  scenario "Answer for Q4 is updated and user moves to team page when user input some answers for Q4 to blank and clicks on 'update' button on edit member page." do
    visit edit_member_path @member
    fill_in :member_ans_q4_1, with: ""
    click_on :update_member_button

    expect(current_path).to eq team_path @team
    expect(page).not_to have_text @member.ans_q4[0]
    expect(page).to have_text @member.ans_q4[1]
    expect(page).to have_text @member.ans_q4[2]
    expect(page).not_to have_text "No answer."
  end

  scenario "Answer for Q4 is updated and user moves to team page when user input all answers for Q4 and clicks on 'update' button on edit member page." do
    visit edit_member_path @member
    fill_in :member_ans_q4_1, with: @new_answers[0]
    fill_in :member_ans_q4_2, with: " " + @new_answers[1]
    fill_in :member_ans_q4_3, with: @new_answers[2] + "　"
    click_on :update_member_button

    expect(current_path).to eq team_path @team
    expect(page).to have_text @new_answers[0]
    expect(page).to have_text @new_answers[1]
    expect(page).to have_text @new_answers[2]
    expect(page).not_to have_text "No answer."
  end

end