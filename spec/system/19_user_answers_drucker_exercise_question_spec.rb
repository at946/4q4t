feature "19_users_answer_drucker_exercise_question", type: :system, js: true do
  before :each do
    @team = create(:team)
    @member = create(:new_member, team: @team)    
    @member_ans = build(:member)
    @member_ans_space = build(:member_space)
  end

  scenario "When a user clicks on the drucker answers card on the druckers page, the user moves to the edit drucker answers page." do
    visit druckers_path @team
    all(".member-card").first.click

    expect(page).to have_current_path edit_drucker_path @member
  end

  scenario "When a user clicks on the back icon on the edit drucker page, the user moves to the druckers page." do
    visit edit_drucker_path @member
    click_on :return_icon

    expect(page).to have_current_path druckers_path @team
  end

  scenario "User can input up to 3 'Q1' on edit drucker page." do
    visit edit_drucker_path @member
    fill_in :member_ans_q1_1, with: @member_ans.ans_q1[0]
    fill_in :member_ans_q1_2, with: @member_ans.ans_q1[1]
    fill_in :member_ans_q1_3, with: @member_ans.ans_q1[2]
    expect(find("#member_ans_q1_1").value).to eq @member_ans.ans_q1[0]
    expect(find("#member_ans_q1_2").value).to eq @member_ans.ans_q1[1]
    expect(find("#member_ans_q1_3").value).to eq @member_ans.ans_q1[2]
  end

  scenario "User can input up to 3 'Q2' on create member page." do
    visit edit_drucker_path @member
    fill_in :member_ans_q2_1, with: @member_ans.ans_q2[0]
    fill_in :member_ans_q2_2, with: @member_ans.ans_q2[1]
    fill_in :member_ans_q2_3, with: @member_ans.ans_q2[2]
    expect(find("#member_ans_q2_1").value).to eq @member_ans.ans_q2[0]
    expect(find("#member_ans_q2_2").value).to eq @member_ans.ans_q2[1]
    expect(find("#member_ans_q2_3").value).to eq @member_ans.ans_q2[2]
  end

  scenario "User can input up to 3 'Q3' on create answer page." do
    visit edit_drucker_path @member
    fill_in :member_ans_q3_1, with: @member_ans.ans_q3[0]
    fill_in :member_ans_q3_2, with: @member_ans.ans_q3[1]
    fill_in :member_ans_q3_3, with: @member_ans.ans_q3[2]
    expect(find("#member_ans_q3_1").value).to eq @member_ans.ans_q3[0]
    expect(find("#member_ans_q3_2").value).to eq @member_ans.ans_q3[1]
    expect(find("#member_ans_q3_3").value).to eq @member_ans.ans_q3[2]
  end

  scenario "User can input up to 3 'Q4' on create answer page." do
    visit edit_drucker_path @member
    fill_in :member_ans_q4_1, with: @member_ans.ans_q4[0]
    fill_in :member_ans_q4_2, with: @member_ans.ans_q4[1]
    fill_in :member_ans_q4_3, with: @member_ans.ans_q4[2]
    expect(find("#member_ans_q4_1").value).to eq @member_ans.ans_q4[0]
    expect(find("#member_ans_q4_2").value).to eq @member_ans.ans_q4[1]
    expect(find("#member_ans_q4_3").value).to eq @member_ans.ans_q4[2]
  end
 
  scenario "When a user input all answers for all questions and clicks on the update drucker button on the edit drucker page, the member is updated and user moves to the druckers page." do
    visit edit_drucker_path @member
    fill_in :member_ans_q1_1, with: @member_ans_space.ans_q1[0]
    fill_in :member_ans_q1_2, with: @member_ans_space.ans_q1[1]
    fill_in :member_ans_q1_3, with: @member_ans_space.ans_q1[2]
    fill_in :member_ans_q2_1, with: @member_ans_space.ans_q2[0]
    fill_in :member_ans_q2_2, with: @member_ans_space.ans_q2[1]
    fill_in :member_ans_q2_3, with: @member_ans_space.ans_q2[2]
    fill_in :member_ans_q3_1, with: @member_ans_space.ans_q3[0]
    fill_in :member_ans_q3_2, with: @member_ans_space.ans_q3[1]
    fill_in :member_ans_q3_3, with: @member_ans_space.ans_q3[2]
    fill_in :member_ans_q4_1, with: @member_ans_space.ans_q4[0]
    fill_in :member_ans_q4_2, with: @member_ans_space.ans_q4[1]
    fill_in :member_ans_q4_3, with: @member_ans_space.ans_q4[2]
    click_on :update_drucker_button

    @member.reload
    expect(@member.ans_q1[0]).to eq @member_ans.ans_q1[0]
    expect(@member.ans_q1[1]).to eq @member_ans.ans_q1[1]
    expect(@member.ans_q1[2]).to eq @member_ans.ans_q1[2]
    expect(@member.ans_q2[0]).to eq @member_ans.ans_q2[0]
    expect(@member.ans_q2[1]).to eq @member_ans.ans_q2[1]
    expect(@member.ans_q2[2]).to eq @member_ans.ans_q2[2]
    expect(@member.ans_q3[0]).to eq @member_ans.ans_q3[0]
    expect(@member.ans_q3[1]).to eq @member_ans.ans_q3[1]
    expect(@member.ans_q3[2]).to eq @member_ans.ans_q3[2]
    expect(@member.ans_q4[0]).to eq @member_ans.ans_q4[0]
    expect(@member.ans_q4[1]).to eq @member_ans.ans_q4[1]
    expect(@member.ans_q4[2]).to eq @member_ans.ans_q4[2]

    expect(page).to have_current_path druckers_path @team
    expect(page).to have_text @member_ans.ans_q1[0]
    expect(page).to have_text @member_ans.ans_q1[1]
    expect(page).to have_text @member_ans.ans_q1[2]
    expect(page).to have_text @member_ans.ans_q2[0]
    expect(page).to have_text @member_ans.ans_q2[1]
    expect(page).to have_text @member_ans.ans_q2[2]
    expect(page).to have_text @member_ans.ans_q3[0]
    expect(page).to have_text @member_ans.ans_q3[1]
    expect(page).to have_text @member_ans.ans_q3[2]
    expect(page).to have_text @member_ans.ans_q4[0]
    expect(page).to have_text @member_ans.ans_q4[1]
    expect(page).to have_text @member_ans.ans_q4[2]
  end

  scenario "When a user clicks on update button without all answers for q1 on the edit drucker page, the member is updated and the user moves to druckers page." do
    visit edit_drucker_path @member
    fill_in :member_ans_q1_1, with: ""
    fill_in :member_ans_q1_2, with: " "
    fill_in :member_ans_q1_3, with: "　"
    fill_in :member_ans_q2_1, with: @member_ans_space.ans_q2[0]
    fill_in :member_ans_q2_2, with: @member_ans_space.ans_q2[1]
    fill_in :member_ans_q2_3, with: @member_ans_space.ans_q2[2]
    fill_in :member_ans_q3_1, with: @member_ans_space.ans_q3[0]
    fill_in :member_ans_q3_2, with: @member_ans_space.ans_q3[1]
    fill_in :member_ans_q3_3, with: @member_ans_space.ans_q3[2]
    fill_in :member_ans_q4_1, with: @member_ans_space.ans_q4[0]
    fill_in :member_ans_q4_2, with: @member_ans_space.ans_q4[1]
    fill_in :member_ans_q4_3, with: @member_ans_space.ans_q4[2]
    click_on :update_drucker_button

    @member.reload
    expect(@member.ans_q1[0]).to eq nil
    expect(@member.ans_q1[1]).to eq nil
    expect(@member.ans_q1[2]).to eq nil
    expect(@member.ans_q2[0]).to eq @member_ans.ans_q2[0]
    expect(@member.ans_q2[1]).to eq @member_ans.ans_q2[1]
    expect(@member.ans_q2[2]).to eq @member_ans.ans_q2[2]
    expect(@member.ans_q3[0]).to eq @member_ans.ans_q3[0]
    expect(@member.ans_q3[1]).to eq @member_ans.ans_q3[1]
    expect(@member.ans_q3[2]).to eq @member_ans.ans_q3[2]
    expect(@member.ans_q4[0]).to eq @member_ans.ans_q4[0]
    expect(@member.ans_q4[1]).to eq @member_ans.ans_q4[1]
    expect(@member.ans_q4[2]).to eq @member_ans.ans_q4[2]

    expect(page).to have_current_path druckers_path @team
    expect(page).not_to have_text @member_ans.ans_q1[0]
    expect(page).not_to have_text @member_ans.ans_q1[1]
    expect(page).not_to have_text @member_ans.ans_q1[2]
    expect(page).to have_text @member_ans.ans_q2[0]
    expect(page).to have_text @member_ans.ans_q2[1]
    expect(page).to have_text @member_ans.ans_q2[2]
    expect(page).to have_text @member_ans.ans_q3[0]
    expect(page).to have_text @member_ans.ans_q3[1]
    expect(page).to have_text @member_ans.ans_q3[2]
    expect(page).to have_text @member_ans.ans_q4[0]
    expect(page).to have_text @member_ans.ans_q4[1]
    expect(page).to have_text @member_ans.ans_q4[2]
  end

  scenario "When a user clicks on update button without some answers for q1 on the edit drucker page, the member model is updated and the user moves to the druckers page ." do
    visit edit_drucker_path @member
    fill_in :member_ans_q1_1, with: ""
    fill_in :member_ans_q1_2, with: @member_ans_space.ans_q1[1]
    fill_in :member_ans_q1_3, with: @member_ans_space.ans_q1[2]
    fill_in :member_ans_q2_1, with: @member_ans_space.ans_q2[0]
    fill_in :member_ans_q2_2, with: @member_ans_space.ans_q2[1]
    fill_in :member_ans_q2_3, with: @member_ans_space.ans_q2[2]
    fill_in :member_ans_q3_1, with: @member_ans_space.ans_q3[0]
    fill_in :member_ans_q3_2, with: @member_ans_space.ans_q3[1]
    fill_in :member_ans_q3_3, with: @member_ans_space.ans_q3[2]
    fill_in :member_ans_q4_1, with: @member_ans_space.ans_q4[0]
    fill_in :member_ans_q4_2, with: @member_ans_space.ans_q4[1]
    fill_in :member_ans_q4_3, with: @member_ans_space.ans_q4[2]
    click_on :update_drucker_button

    @member.reload
    expect(page).to have_current_path druckers_path @team
    expect(@member.name).to eq @member.name
    expect(@member.ans_q1[0]).to eq @member_ans.ans_q1[1]
    expect(@member.ans_q1[1]).to eq @member_ans.ans_q1[2]
    expect(@member.ans_q1[2]).to eq nil
    expect(@member.ans_q2[0]).to eq @member_ans.ans_q2[0]
    expect(@member.ans_q2[1]).to eq @member_ans.ans_q2[1]
    expect(@member.ans_q2[2]).to eq @member_ans.ans_q2[2]
    expect(@member.ans_q3[0]).to eq @member_ans.ans_q3[0]
    expect(@member.ans_q3[1]).to eq @member_ans.ans_q3[1]
    expect(@member.ans_q3[2]).to eq @member_ans.ans_q3[2]
    expect(@member.ans_q4[0]).to eq @member_ans.ans_q4[0]
    expect(@member.ans_q4[1]).to eq @member_ans.ans_q4[1]
    expect(@member.ans_q4[2]).to eq @member_ans.ans_q4[2]

    expect(page).to have_text @member.name
    expect(page).not_to have_text @member_ans.ans_q1[0]
    expect(page).to have_text @member_ans.ans_q1[1]
    expect(page).to have_text @member_ans.ans_q1[2]
    expect(page).to have_text @member_ans.ans_q2[0]
    expect(page).to have_text @member_ans.ans_q2[1]
    expect(page).to have_text @member_ans.ans_q2[2]
    expect(page).to have_text @member_ans.ans_q3[0]
    expect(page).to have_text @member_ans.ans_q3[1]
    expect(page).to have_text @member_ans.ans_q3[2]
    expect(page).to have_text @member_ans.ans_q4[0]
    expect(page).to have_text @member_ans.ans_q4[1]
    expect(page).to have_text @member_ans.ans_q4[2]
  end

  scenario "When a user clicks on update button without all answers for q2 on the edit drucker page, the member is updated and the user moves to druckers page." do
    visit edit_drucker_path @member
    fill_in :member_ans_q1_1, with: @member_ans_space.ans_q1[0]
    fill_in :member_ans_q1_2, with: @member_ans_space.ans_q1[1]
    fill_in :member_ans_q1_3, with: @member_ans_space.ans_q1[2]
    fill_in :member_ans_q2_1, with: ""
    fill_in :member_ans_q2_2, with: " "
    fill_in :member_ans_q2_3, with: "　"
    fill_in :member_ans_q3_1, with: @member_ans_space.ans_q3[0]
    fill_in :member_ans_q3_2, with: @member_ans_space.ans_q3[1]
    fill_in :member_ans_q3_3, with: @member_ans_space.ans_q3[2]
    fill_in :member_ans_q4_1, with: @member_ans_space.ans_q4[0]
    fill_in :member_ans_q4_2, with: @member_ans_space.ans_q4[1]
    fill_in :member_ans_q4_3, with: @member_ans_space.ans_q4[2]
    click_on :update_drucker_button

    @member.reload
    expect(@member.ans_q1[0]).to eq @member_ans.ans_q1[0]
    expect(@member.ans_q1[1]).to eq @member_ans.ans_q1[1]
    expect(@member.ans_q1[2]).to eq @member_ans.ans_q1[2]
    expect(@member.ans_q2[0]).to eq nil
    expect(@member.ans_q2[1]).to eq nil
    expect(@member.ans_q2[2]).to eq nil
    expect(@member.ans_q3[0]).to eq @member_ans.ans_q3[0]
    expect(@member.ans_q3[1]).to eq @member_ans.ans_q3[1]
    expect(@member.ans_q3[2]).to eq @member_ans.ans_q3[2]
    expect(@member.ans_q4[0]).to eq @member_ans.ans_q4[0]
    expect(@member.ans_q4[1]).to eq @member_ans.ans_q4[1]
    expect(@member.ans_q4[2]).to eq @member_ans.ans_q4[2]

    expect(page).to have_current_path druckers_path @team
    expect(page).to have_text @member_ans.ans_q1[0]
    expect(page).to have_text @member_ans.ans_q1[1]
    expect(page).to have_text @member_ans.ans_q1[2]
    expect(page).not_to have_text @member_ans.ans_q2[0]
    expect(page).not_to have_text @member_ans.ans_q2[1]
    expect(page).not_to have_text @member_ans.ans_q2[2]
    expect(page).to have_text @member_ans.ans_q3[0]
    expect(page).to have_text @member_ans.ans_q3[1]
    expect(page).to have_text @member_ans.ans_q3[2]
    expect(page).to have_text @member_ans.ans_q4[0]
    expect(page).to have_text @member_ans.ans_q4[1]
    expect(page).to have_text @member_ans.ans_q4[2]
  end

  scenario "When a user clicks on update button without some answers for q2 on the edit drucker page, the member model is updated and the user moves to the druckers page ." do
    visit edit_drucker_path @member
    fill_in :member_ans_q1_1, with: @member_ans_space.ans_q1[0]
    fill_in :member_ans_q1_2, with: @member_ans_space.ans_q1[1]
    fill_in :member_ans_q1_3, with: @member_ans_space.ans_q1[2]
    fill_in :member_ans_q2_1, with: ""
    fill_in :member_ans_q2_2, with: @member_ans_space.ans_q2[1]
    fill_in :member_ans_q2_3, with: @member_ans_space.ans_q2[2]
    fill_in :member_ans_q3_1, with: @member_ans_space.ans_q3[0]
    fill_in :member_ans_q3_2, with: @member_ans_space.ans_q3[1]
    fill_in :member_ans_q3_3, with: @member_ans_space.ans_q3[2]
    fill_in :member_ans_q4_1, with: @member_ans_space.ans_q4[0]
    fill_in :member_ans_q4_2, with: @member_ans_space.ans_q4[1]
    fill_in :member_ans_q4_3, with: @member_ans_space.ans_q4[2]
    click_on :update_drucker_button

    @member.reload
    expect(page).to have_current_path druckers_path @team
    expect(@member.name).to eq @member.name
    expect(@member.ans_q1[0]).to eq @member_ans.ans_q1[0]
    expect(@member.ans_q1[1]).to eq @member_ans.ans_q1[1]
    expect(@member.ans_q1[2]).to eq @member_ans.ans_q1[2]
    expect(@member.ans_q2[0]).to eq @member_ans.ans_q2[1]
    expect(@member.ans_q2[1]).to eq @member_ans.ans_q2[2]
    expect(@member.ans_q2[2]).to eq nil
    expect(@member.ans_q3[0]).to eq @member_ans.ans_q3[0]
    expect(@member.ans_q3[1]).to eq @member_ans.ans_q3[1]
    expect(@member.ans_q3[2]).to eq @member_ans.ans_q3[2]
    expect(@member.ans_q4[0]).to eq @member_ans.ans_q4[0]
    expect(@member.ans_q4[1]).to eq @member_ans.ans_q4[1]
    expect(@member.ans_q4[2]).to eq @member_ans.ans_q4[2]

    expect(page).to have_text @member.name
    expect(page).to have_text @member_ans.ans_q1[0]
    expect(page).to have_text @member_ans.ans_q1[1]
    expect(page).to have_text @member_ans.ans_q1[2]
    expect(page).not_to have_text @member_ans.ans_q2[0]
    expect(page).to have_text @member_ans.ans_q2[1]
    expect(page).to have_text @member_ans.ans_q2[2]
    expect(page).to have_text @member_ans.ans_q3[0]
    expect(page).to have_text @member_ans.ans_q3[1]
    expect(page).to have_text @member_ans.ans_q3[2]
    expect(page).to have_text @member_ans.ans_q4[0]
    expect(page).to have_text @member_ans.ans_q4[1]
    expect(page).to have_text @member_ans.ans_q4[2]
  end

  scenario "When a user clicks on update button without all answers for q3 on the edit drucker page, the member is updated and the user moves to druckers page." do
    visit edit_drucker_path @member
    fill_in :member_ans_q1_1, with: @member_ans_space.ans_q1[0]
    fill_in :member_ans_q1_2, with: @member_ans_space.ans_q1[1]
    fill_in :member_ans_q1_3, with: @member_ans_space.ans_q1[2]
    fill_in :member_ans_q2_1, with: @member_ans_space.ans_q2[0]
    fill_in :member_ans_q2_2, with: @member_ans_space.ans_q2[1]
    fill_in :member_ans_q2_3, with: @member_ans_space.ans_q2[2]
    fill_in :member_ans_q3_1, with: ""
    fill_in :member_ans_q3_2, with: " "
    fill_in :member_ans_q3_3, with: "　"
    fill_in :member_ans_q4_1, with: @member_ans_space.ans_q4[0]
    fill_in :member_ans_q4_2, with: @member_ans_space.ans_q4[1]
    fill_in :member_ans_q4_3, with: @member_ans_space.ans_q4[2]
    click_on :update_drucker_button

    @member.reload
    expect(@member.ans_q1[0]).to eq @member_ans.ans_q1[0]
    expect(@member.ans_q1[1]).to eq @member_ans.ans_q1[1]
    expect(@member.ans_q1[2]).to eq @member_ans.ans_q1[2]
    expect(@member.ans_q2[0]).to eq @member_ans.ans_q2[0]
    expect(@member.ans_q2[1]).to eq @member_ans.ans_q2[1]
    expect(@member.ans_q2[2]).to eq @member_ans.ans_q2[2]
    expect(@member.ans_q3[0]).to eq nil
    expect(@member.ans_q3[1]).to eq nil
    expect(@member.ans_q3[2]).to eq nil
    expect(@member.ans_q4[0]).to eq @member_ans.ans_q4[0]
    expect(@member.ans_q4[1]).to eq @member_ans.ans_q4[1]
    expect(@member.ans_q4[2]).to eq @member_ans.ans_q4[2]

    expect(page).to have_current_path druckers_path @team
    expect(page).to have_text @member_ans.ans_q1[0]
    expect(page).to have_text @member_ans.ans_q1[1]
    expect(page).to have_text @member_ans.ans_q1[2]
    expect(page).to have_text @member_ans.ans_q2[0]
    expect(page).to have_text @member_ans.ans_q2[1]
    expect(page).to have_text @member_ans.ans_q2[2]
    expect(page).not_to have_text @member_ans.ans_q3[0]
    expect(page).not_to have_text @member_ans.ans_q3[1]
    expect(page).not_to have_text @member_ans.ans_q3[2]
    expect(page).to have_text @member_ans.ans_q4[0]
    expect(page).to have_text @member_ans.ans_q4[1]
    expect(page).to have_text @member_ans.ans_q4[2]
  end

  scenario "When a user clicks on update button without some answers for q3 on the edit drucker page, the member model is updated and the user moves to the druckers page ." do
    visit edit_drucker_path @member
    fill_in :member_ans_q1_1, with: @member_ans_space.ans_q1[0]
    fill_in :member_ans_q1_2, with: @member_ans_space.ans_q1[1]
    fill_in :member_ans_q1_3, with: @member_ans_space.ans_q1[2]
    fill_in :member_ans_q2_1, with: @member_ans_space.ans_q2[0]
    fill_in :member_ans_q2_2, with: @member_ans_space.ans_q2[1]
    fill_in :member_ans_q2_3, with: @member_ans_space.ans_q2[2]
    fill_in :member_ans_q3_1, with: ""
    fill_in :member_ans_q3_2, with: @member_ans_space.ans_q3[1]
    fill_in :member_ans_q3_3, with: @member_ans_space.ans_q3[2]
    fill_in :member_ans_q4_1, with: @member_ans_space.ans_q4[0]
    fill_in :member_ans_q4_2, with: @member_ans_space.ans_q4[1]
    fill_in :member_ans_q4_3, with: @member_ans_space.ans_q4[2]
    click_on :update_drucker_button

    @member.reload
    expect(page).to have_current_path druckers_path @team
    expect(@member.name).to eq @member.name
    expect(@member.ans_q1[0]).to eq @member_ans.ans_q1[0]
    expect(@member.ans_q1[1]).to eq @member_ans.ans_q1[1]
    expect(@member.ans_q1[2]).to eq @member_ans.ans_q1[2]
    expect(@member.ans_q2[0]).to eq @member_ans.ans_q2[0]
    expect(@member.ans_q2[1]).to eq @member_ans.ans_q2[1]
    expect(@member.ans_q2[2]).to eq @member_ans.ans_q2[2]
    expect(@member.ans_q3[0]).to eq @member_ans.ans_q3[1]
    expect(@member.ans_q3[1]).to eq @member_ans.ans_q3[2]
    expect(@member.ans_q3[2]).to eq nil
    expect(@member.ans_q4[0]).to eq @member_ans.ans_q4[0]
    expect(@member.ans_q4[1]).to eq @member_ans.ans_q4[1]
    expect(@member.ans_q4[2]).to eq @member_ans.ans_q4[2]

    expect(page).to have_text @member.name
    expect(page).to have_text @member_ans.ans_q1[0]
    expect(page).to have_text @member_ans.ans_q1[1]
    expect(page).to have_text @member_ans.ans_q1[2]
    expect(page).to have_text @member_ans.ans_q2[0]
    expect(page).to have_text @member_ans.ans_q2[1]
    expect(page).to have_text @member_ans.ans_q2[2]
    expect(page).not_to have_text @member_ans.ans_q3[0]
    expect(page).to have_text @member_ans.ans_q3[1]
    expect(page).to have_text @member_ans.ans_q3[2]
    expect(page).to have_text @member_ans.ans_q4[0]
    expect(page).to have_text @member_ans.ans_q4[1]
    expect(page).to have_text @member_ans.ans_q4[2]
  end

  scenario "When a user clicks on update button without all answers for q4 on the edit drucker page, the member is updated and the user moves to druckers page." do
    visit edit_drucker_path @member
    fill_in :member_ans_q1_1, with: @member_ans_space.ans_q1[0]
    fill_in :member_ans_q1_2, with: @member_ans_space.ans_q1[1]
    fill_in :member_ans_q1_3, with: @member_ans_space.ans_q1[2]
    fill_in :member_ans_q2_1, with: @member_ans_space.ans_q2[0]
    fill_in :member_ans_q2_2, with: @member_ans_space.ans_q2[1]
    fill_in :member_ans_q2_3, with: @member_ans_space.ans_q2[2]
    fill_in :member_ans_q3_1, with: @member_ans_space.ans_q3[0]
    fill_in :member_ans_q3_2, with: @member_ans_space.ans_q3[1]
    fill_in :member_ans_q3_3, with: @member_ans_space.ans_q3[2]
    fill_in :member_ans_q4_1, with: ""
    fill_in :member_ans_q4_2, with: " "
    fill_in :member_ans_q4_3, with: "　"
    click_on :update_drucker_button

    @member.reload
    expect(@member.ans_q1[0]).to eq @member_ans.ans_q1[0]
    expect(@member.ans_q1[1]).to eq @member_ans.ans_q1[1]
    expect(@member.ans_q1[2]).to eq @member_ans.ans_q1[2]
    expect(@member.ans_q2[0]).to eq @member_ans.ans_q2[0]
    expect(@member.ans_q2[1]).to eq @member_ans.ans_q2[1]
    expect(@member.ans_q2[2]).to eq @member_ans.ans_q2[2]
    expect(@member.ans_q3[0]).to eq @member_ans.ans_q3[0]
    expect(@member.ans_q3[1]).to eq @member_ans.ans_q3[1]
    expect(@member.ans_q3[2]).to eq @member_ans.ans_q3[2]
    expect(@member.ans_q4[0]).to eq nil
    expect(@member.ans_q4[1]).to eq nil
    expect(@member.ans_q4[2]).to eq nil

    expect(page).to have_current_path druckers_path @team
    expect(page).to have_text @member_ans.ans_q1[0]
    expect(page).to have_text @member_ans.ans_q1[1]
    expect(page).to have_text @member_ans.ans_q1[2]
    expect(page).to have_text @member_ans.ans_q2[0]
    expect(page).to have_text @member_ans.ans_q2[1]
    expect(page).to have_text @member_ans.ans_q2[2]
    expect(page).to have_text @member_ans.ans_q3[0]
    expect(page).to have_text @member_ans.ans_q3[1]
    expect(page).to have_text @member_ans.ans_q3[2]
    expect(page).not_to have_text @member_ans.ans_q4[0]
    expect(page).not_to have_text @member_ans.ans_q4[1]
    expect(page).not_to have_text @member_ans.ans_q4[2]
  end

  scenario "When a user clicks on update button without some answers for q4 on the edit drucker page, the member model is updated and the user moves to the druckers page ." do
    visit edit_drucker_path @member
    fill_in :member_ans_q1_1, with: @member_ans_space.ans_q1[0]
    fill_in :member_ans_q1_2, with: @member_ans_space.ans_q1[1]
    fill_in :member_ans_q1_3, with: @member_ans_space.ans_q1[2]
    fill_in :member_ans_q2_1, with: @member_ans_space.ans_q2[0]
    fill_in :member_ans_q2_2, with: @member_ans_space.ans_q2[1]
    fill_in :member_ans_q2_3, with: @member_ans_space.ans_q2[2]
    fill_in :member_ans_q3_1, with: @member_ans_space.ans_q3[0]
    fill_in :member_ans_q3_2, with: @member_ans_space.ans_q3[1]
    fill_in :member_ans_q3_3, with: @member_ans_space.ans_q3[2]
    fill_in :member_ans_q4_1, with: ""
    fill_in :member_ans_q4_2, with: @member_ans_space.ans_q4[1]
    fill_in :member_ans_q4_3, with: @member_ans_space.ans_q4[2]
    click_on :update_drucker_button

    @member.reload
    expect(page).to have_current_path druckers_path @team
    expect(@member.name).to eq @member.name
    expect(@member.ans_q1[0]).to eq @member_ans.ans_q1[0]
    expect(@member.ans_q1[1]).to eq @member_ans.ans_q1[1]
    expect(@member.ans_q1[2]).to eq @member_ans.ans_q1[2]
    expect(@member.ans_q2[0]).to eq @member_ans.ans_q2[0]
    expect(@member.ans_q2[1]).to eq @member_ans.ans_q2[1]
    expect(@member.ans_q2[2]).to eq @member_ans.ans_q2[2]
    expect(@member.ans_q3[0]).to eq @member_ans.ans_q3[0]
    expect(@member.ans_q3[1]).to eq @member_ans.ans_q3[1]
    expect(@member.ans_q3[2]).to eq @member_ans.ans_q3[2]
    expect(@member.ans_q4[0]).to eq @member_ans.ans_q4[1]
    expect(@member.ans_q4[1]).to eq @member_ans.ans_q4[2]
    expect(@member.ans_q4[2]).to eq nil

    expect(page).to have_text @member.name
    expect(page).to have_text @member_ans.ans_q1[0]
    expect(page).to have_text @member_ans.ans_q1[1]
    expect(page).to have_text @member_ans.ans_q1[2]
    expect(page).to have_text @member_ans.ans_q2[0]
    expect(page).to have_text @member_ans.ans_q2[1]
    expect(page).to have_text @member_ans.ans_q2[2]
    expect(page).to have_text @member_ans.ans_q3[0]
    expect(page).to have_text @member_ans.ans_q3[1]
    expect(page).to have_text @member_ans.ans_q3[2]
    expect(page).not_to have_text @member_ans.ans_q4[0]
    expect(page).to have_text @member_ans.ans_q4[1]
    expect(page).to have_text @member_ans.ans_q4[2]
  end

end