feature "18_user_shows_a_member_card_randomly", type: :system, js: true do

  background do
    @team = create(:team)
    @member1 = create(:member, team: @team)
    @member2 = create(:member2, team: @team)
    @member3 = create(:member, team: @team, name: "hoge", role: "Developer")
  end

  scenario "When the user clicks on 'start exercise' button on team page, the user moves to exercise page." do
    visit team_path @team
    click_on :start_exercise_button

    expect(page).to have_current_path exercise_path @team
  end

  scenario "The user find a member card randomly on exercise page." do
    visit exercise_path @team

    expect(page).to have_text(@member1.name).or have_text(@member2.name).or have_text(@member3.name)
    expect(page).to have_text(@member1.role).or have_text(@member2.role).or have_text(@member3.role)
    expect(page).to have_text(@member1.ans_q1[0]).or have_text(@member2.ans_q1[0]).or have_text(@member3.ans_q1[0])
    expect(page).to have_text(@member1.ans_q1[1]).or have_text(@member2.ans_q1[1]).or have_text(@member3.ans_q1[1])
    expect(page).to have_text(@member1.ans_q1[2]).or have_text(@member2.ans_q1[2]).or have_text(@member3.ans_q1[2])
    expect(page).to have_text(@member1.ans_q2[0]).or have_text(@member2.ans_q2[0]).or have_text(@member3.ans_q2[0])
    expect(page).to have_text(@member1.ans_q2[1]).or have_text(@member2.ans_q2[1]).or have_text(@member3.ans_q2[1])
    expect(page).to have_text(@member1.ans_q2[2]).or have_text(@member2.ans_q2[2]).or have_text(@member3.ans_q2[2])
    expect(page).to have_text(@member1.ans_q3[0]).or have_text(@member2.ans_q3[0]).or have_text(@member3.ans_q3[0])
    expect(page).to have_text(@member1.ans_q3[1]).or have_text(@member2.ans_q3[1]).or have_text(@member3.ans_q3[1])
    expect(page).to have_text(@member1.ans_q3[2]).or have_text(@member2.ans_q3[2]).or have_text(@member3.ans_q3[2])
    expect(page).to have_text(@member1.ans_q4[0]).or have_text(@member2.ans_q4[0]).or have_text(@member3.ans_q4[0])
    expect(page).to have_text(@member1.ans_q4[1]).or have_text(@member2.ans_q4[1]).or have_text(@member3.ans_q4[1])
    expect(page).to have_text(@member1.ans_q4[2]).or have_text(@member2.ans_q4[2]).or have_text(@member3.ans_q4[2])
  end

  scenario "When the user clicks on back icon on exercise page, the user moves to team page." do
    visit exercise_path @team
    click_on :return_button
    
    expect(page).to have_current_path team_path @team
  end

  scenario "When the first exercise card appears on exercise page, the prev icon disappears." do
    visit exercise_path @team

    expect(page).not_to have_selector "#exercise_prev_icon"
    expect(page).to     have_selector "#exercise_next_icon"
    expect(page).to     have_selector "#return_button"
    expect(page).to     have_text     "1 / 3"

    find("#exercise_next_icon").click

    expect(page).to     have_selector "#exercise_prev_icon"
    expect(page).to     have_selector "#exercise_next_icon"
    expect(page).to     have_selector "#return_button"
    expect(page).to     have_text     "2 / 3"

    find("#exercise_prev_icon").click

    expect(page).not_to have_selector "#exercise_prev_icon"
    expect(page).to     have_selector "#exercise_next_icon"
    expect(page).to     have_selector "#return_button"
    expect(page).to     have_text     "1 / 3"
end

  scenario "When the last exercise card appears on exercise page, the next icon disappears." do
    visit exercise_path @team
    find("#exercise_next_icon").click
    find("#exercise_next_icon").click

    expect(page).to     have_selector "#exercise_prev_icon"
    expect(page).not_to have_selector "#exercise_next_icon"
    expect(page).to     have_selector "#return_button"
    expect(page).to     have_text     "3 / 3"

    find("#exercise_prev_icon").click

    expect(page).to     have_selector "#exercise_prev_icon"
    expect(page).to     have_selector "#exercise_next_icon"
    expect(page).to     have_selector "#return_button"
    expect(page).to     have_text     "2 / 3"

    find("#exercise_next_icon").click

    expect(page).to     have_selector "#exercise_prev_icon"
    expect(page).not_to have_selector "#exercise_next_icon"
    expect(page).to     have_selector "#return_button"
    expect(page).to     have_text     "3 / 3"
  end

end