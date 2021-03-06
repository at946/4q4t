feature "10_user_show_privacy_policy", type: :system, js: true do

  background do    
    @team = create(:team)
    @member = create(:member, team: @team)
  end

  scenario "User accesses to privacy policy page directly." do
    visit pp_path
    expect(current_path).to eq pp_path
    expect(page).to have_text "Privacy policy"
  end

  scenario "User moves to privacy policy page when user clicks on privacy link on footer on top page." do
    visit root_path
    click_on :pp_link
    expect(current_path).to eq pp_path
  end

  scenario "User moves to privacy policy page when user clicks on privacy link on footer on create team page." do
    visit new_team_path
    click_on :pp_link
    expect(current_path).to eq pp_path
  end

  scenario "User moves to privacy policy page when user clicks on privacy link on footer on show team page." do
    visit team_path @team
    click_on :pp_link
    expect(current_path).to eq pp_path
  end

  scenario "User moves to privacy policy page when user clicks on privacy link on footer on edit team page." do
    visit edit_team_path @team
    click_on :pp_link
    expect(current_path).to eq pp_path
  end

  scenario "User moves to privacy policy page when user clicks on privacy link on footer on create member page." do
    visit new_member_path @team
    click_on :pp_link
    expect(current_path).to eq pp_path
  end

  scenario "User moves to privacy policy page when user clicks on privacy link on footer on edit member page." do
    visit edit_member_path @member
    click_on :pp_link
    expect(current_path).to eq pp_path
  end

  scenario "User moves to privacy policy page when user clicks on privacy link on footer on terms page." do
    visit tos_path
    click_on :pp_link
    expect(current_path).to eq pp_path
  end

  scenario "User moves to privacy policy page when user clicks on privacy link on footer on privacy policy page." do
    visit pp_path
    click_on :pp_link
    expect(current_path).to eq pp_path
  end

  scenario "A user moves to privacy policy page when the user clicks on the privacy link on the footer on the druckers page." do
    visit druckers_path @team
    click_on :pp_link
    expect(page).to have_current_path pp_path
  end

  scenario "A user moves to the privacy policy page when the user clicks on the privacy link on the footer on the edit drucker page." do
    visit edit_drucker_path @member
    click_on :pp_link
    expect(page).to have_current_path pp_path
  end

  scenario "A user moves to the privacy policy page when the user clicks on the privacy link on the footer on the drucker exercise page." do
    visit drucker_exercise_path @team
    click_on :pp_link
    expect(page).to have_current_path pp_path
  end

end