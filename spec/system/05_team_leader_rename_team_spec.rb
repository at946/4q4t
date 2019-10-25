feature "05_team_leader_rename_team", type: :system, js: true do

  before :each do
    @team = Team.create(name: "ほげほげプロジェクト")
  end

  scenario "User moves to edit team page when user clicks on 'team edit icon' on show team page." do
    visit team_path @team
    click_on :edit_team_icon
    expect(current_path).to eq edit_team_path @team
  end

  scenario "Team name is input the present one on edit team page." do
    visit edit_team_path @team
    expect(find("#team_name").value).to eq @team.name
  end
    
  scenario "User finds error message when user click on 'update' button without input 'team name' on edit team page." do
    msg = "Team name can't be blank."

    visit edit_team_path @team
    fill_in :team_name, with: ""
    click_on :update_team_button
    expect(current_path).to eq edit_team_path @team
    expect(page).to have_text msg

    fill_in :team_name, with: " 　"
    click_on :update_team_button
    expect(current_path).to eq edit_team_path @team
    expect(page).to have_text msg
  end

  scenario "Team is updated and User moves to show team page when user clicks on 'update' button with input 'team name' on edit team page." do
    in_new_team_name = " ふがふがプロジェクト　"
    out_new_team_name = "ふがふがプロジェクト"
    expect(Team.all.count).to eq 1

    visit edit_team_path @team
    fill_in :team_name, with: in_new_team_name
    click_on :update_team_button
    
    expect(Team.all.count).to eq 1
    expect(current_path).to eq team_path @team
    expect(page).not_to have_text @team.name
    @team.reload
    expect(@team.name).to eq out_new_team_name
    expect(page).to have_text out_new_team_name
  end

  scenario "User is redirected to team not found error page when user tries to access to edit team page of non-existent team." do
    visit edit_team_path "a"
    expect(current_path).to eq edit_team_path "a"
    expect(page).to have_text "Team is not found."
  end

end