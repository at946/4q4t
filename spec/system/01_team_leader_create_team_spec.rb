feature "01_team_leader_create_team", type: :system, js: true do

  background do
    @team = build(:team)
    @team_space = build(:team_space)
  end

  scenario "User can access top page directly." do
    visit root_path
    expect(current_path).to eq root_path
  end

  scenario "User can access team create page directly." do
    visit new_team_path
    expect(current_path).to eq new_team_path
  end

  scenario "User can move team create page when user click 'Make a team' button on top page." do
    visit root_path
    click_on :new_team_link
    expect(current_path).to eq new_team_path
  end

  scenario "User can input the team name on team create page." do
    visit new_team_path
    fill_in :team_name, with: @team.name
    expect(find("#team_name").value()).to eq @team.name
  end

  scenario "User find the error message on create team page when user click 'create' button with no input for team name." do
    error_message = "Team name を入力してください。"
    visit new_team_path
    fill_in :team_name, with: ""
    click_on :create_team_button
    expect(page).to have_text error_message

    fill_in :team_name, with: " 　"
    click_on :create_team_button
    expect(page).to have_text error_message
  end

  scenario "Team can be created and User can move show team page when user click 'create' button with input for team name." do
    visit new_team_path
    team_name = "ほげほげプロジェクト"
    team_name_space = " ほげほげプロジェクト　"
    fill_in :team_name, with: @team.name
    click_on :create_team_button
    expect(current_path).to eq team_path Team.last.uid
    expect(page).to have_text @team.name

    visit new_team_path
    fill_in :team_name, with: @team_space.name
    click_on :create_team_button
    expect(current_path).to eq team_path Team.last.uid
    expect(page).to have_text @team.name
    expect(page).not_to have_text @team_space.name
  end
  
end
