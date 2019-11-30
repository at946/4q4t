feature "00_logo_and_side_menu", type: :system, js: true do
  before :each do
    @team = create(:team)
    @member = create(:member, team: @team)
  end

  # For the header logo
  scenario "When a user clicks on the header logo on the top page, the user moves to the top page." do
    visit root_path
    click_on :header_logo
    
    expect(page).to have_current_path root_path
  end

  scenario "When a user clicks on the header logo on the tos page, the user moves to the top page." do
    visit tos_path
    click_on :header_logo

    expect(page).to have_current_path root_path
  end

  scenario "When a user clicks on the header logo on the pp page, the user moves to the top page." do
    visit pp_path
    click_on :header_logo 

    expect(page).to have_current_path root_path
  end

  scenario "When a user clicks on the header logo on the new team page, the user moves to the top page." do
    visit new_team_path
    click_on :header_logo

    expect(page).to have_current_path root_path
  end

  scenario "When a user clicks on the header logo on the team page, the user moves to the top page." do
    visit team_path(@team)
    click_on :header_logo

    expect(page).to have_current_path root_path
  end

  scenario "When a user clicks on the header logo on the edit team page, the user moves to the top page." do
    visit edit_team_path(@team)
    click_on :header_logo

    expect(page).to have_current_path root_path
  end

  scenario "When a user clicks on the header logo on the new member page, the user moves to the top page." do
    visit new_member_path(@team)
    click_on :header_logo

    expect(page).to have_current_path root_path
  end

  scenario "When a user clicks on the header logo on the edit member page, the user moves to the top page." do
    visit edit_member_path(@member)
    click_on :header_logo

    expect(page).to have_current_path root_path
  end

  scenario "When a user clicks on the header logo on the druckers page, the user moves to the top page." do
    visit druckers_path(@team)
    click_on :header_logo

    expect(page).to have_current_path root_path
  end

  scenario "When a user clicks on the header logo on the edit drucker page, the user moves to the top page." do
    visit edit_drucker_path(@member)
    click_on :header_logo
    
    expect(page).to have_current_path root_path
  end

  scenario "When a user clicks on the header logo on the drucker exercise page, the user moves to the top page." do
    visit drucker_exercise_path(@team)
    click_on :header_logo

    expect(page).to have_current_path root_path
  end

  # There is no side menu.
  scenario "The top page does not have the side menu." do
    visit root_path
    expect(page).not_to have_selector "#side_menu"
  end

  scenario "The terms of service page does not have the side menu." do
    visit tos_path
    expect(page).not_to have_selector "#side_menu"
  end

  scenario "The privacy policy does not have the side menu." do
    visit pp_path
    expect(page).not_to have_selector "#side_menu"
  end

  # For the team side menu.
  scenario "When a user clicks on the team side menu on the team page, the user moves to the team page." do
    visit team_path(@team)
    click_on :team_side_menu

    expect(page).to have_current_path team_path(@team)
  end

  scenario "When a user clicks on the team side menu on the edit team page, the user moves to the team page." do
    visit edit_member_path(@member)
    click_on :team_side_menu

    expect(page).to have_current_path team_path(@team)
  end

  scenario "When a user clicks on the team side menu on the new member page, the user moves to the team page." do
    visit new_member_path(@team)
    click_on :team_side_menu

    expect(page).to have_current_path team_path(@team)
  end

  scenario "When a user clicks on the team side menu on the edit member page, the user moves to the team page." do
    visit edit_member_path(@member)
    click_on :team_side_menu
    
    expect(page).to have_current_path team_path(@team)
  end

  scenario "When a user clicks on the team side menu on the druckers page, the user moves to the team page." do
    visit druckers_path(@team)
    click_on :team_side_menu

    expect(page).to have_current_path team_path(@team)
  end

  scenario "When a user clicks on the team side menu on the edit drucker page, the user moves to the team page." do
    visit edit_drucker_path(@member)
    click_on :team_side_menu

    expect(page).to have_current_path team_path(@team)
  end

  scenario "When a user clicks on the team side menu on the drucker exercise page, the user moves to the team page." do
    visit drucker_exercise_path(@team)
    click_on :team_side_menu

    expect(page).to have_current_path team_path(@team)
  end

  # For the druckers side menu.
  scenario "When a user clicks on the druckers side menu on the team page, the user moves to the druckers page." do
    visit team_path(@team)
    click_on :druckers_side_menu

    expect(page).to have_current_path druckers_path(@team)
  end

  scenario "When a user clicks on the druckers side menu on the edit team page, the user moves to the druckers page." do
    visit edit_member_path(@member)
    click_on :druckers_side_menu

    expect(page).to have_current_path druckers_path(@team)
  end

  scenario "When a user clicks on the druckers side menu on the new member page, the user moves to the druckers page." do
    visit new_member_path(@team)
    click_on :druckers_side_menu

    expect(page).to have_current_path druckers_path(@team)
  end

  scenario "When a user clicks on the druckers side menu on the edit member page, the user moves to the druckers page." do
    visit edit_member_path(@member)
    click_on :druckers_side_menu
    
    expect(page).to have_current_path druckers_path(@team)
  end

  scenario "When a user clicks on the druckers side menu on the druckers page, the user moves to the druckers page." do
    visit druckers_path(@team)
    click_on :druckers_side_menu

    expect(page).to have_current_path druckers_path(@team)
  end

  scenario "When a user clicks on the druckers side menu on the edit drucker page, the user moves to the druckers page." do
    visit edit_drucker_path(@member)
    click_on :druckers_side_menu

    expect(page).to have_current_path druckers_path(@team)
  end

  scenario "When a user clicks on the druckers side menu on the drucker exercise page, the user moves to the druckers page." do
    visit drucker_exercise_path(@team)
    click_on :druckers_side_menu

    expect(page).to have_current_path druckers_path(@team)
  end

end