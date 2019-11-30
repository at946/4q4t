feature "09_user_show_terms_of_service", type: :system, js: true do

  background do
    @team = create(:team)
    @member = create(:member, team: @team)
  end

  scenario "User accesses to terms page directly." do
    visit tos_path
    expect(current_path).to eq tos_path
    expect(page).to have_text "Terms of service"
  end

  scenario "User moves to terms page when user clicks on terms link on footer on top page." do
    visit root_path
    click_on :terms_link
    expect(current_path).to eq tos_path
  end

  scenario "User moves to terms page when user clicks on terms link on footer on create team page." do
    visit new_team_path
    click_on :terms_link
    expect(current_path).to eq tos_path
  end

  scenario "User moves to terms page when user clicks on terms link on footer on show team page." do
    visit team_path @team
    click_on :terms_link
    expect(current_path).to eq tos_path
  end

  scenario "User moves to terms page when user clicks on terms link on footer on edit team page." do
    visit edit_team_path @team
    click_on :terms_link
    expect(current_path).to eq tos_path
  end

  scenario "User moves to terms page when user clicks on terms link on footer on create member page." do
    visit new_member_path @team
    click_on :terms_link
    expect(current_path).to eq tos_path
  end

  scenario "User moves to terms page when user clicks on terms link on footer on edit member page." do
    visit edit_member_path @member
    click_on :terms_link
    expect(current_path).to eq tos_path
  end

  scenario "User moves to terms page when user clicks on terms link on footer on terms page." do
    visit tos_path
    click_on :terms_link
    expect(current_path).to eq tos_path
  end

  scenario "User moves to terms page when user clicks on terms link on footer on privacy policy page." do
    visit pp_path
    click_on :terms_link
    expect(current_path).to eq tos_path
  end

  scenario "A user moves to the terms page when the user clicks on the terms link on the footer on the druckers page." do
    visit druckers_path @team
    click_on :terms_link

    expect(current_path).to eq tos_path
  end

  scenario "A user moves to the terms page when the user clicks on the terms link on the footer on the edit drucker page." do
    visit edit_drucker_path @member
    click_on :terms_link

    expect(page).to have_current_path tos_path
  end

  scenario "A user moves to the terms page when the user clicks on the terms link on the footer on the drucker exercise page." do
    visit drucker_exercise_path @team
    click_on :terms_link

    expect(page).to have_current_path tos_path
  end

end