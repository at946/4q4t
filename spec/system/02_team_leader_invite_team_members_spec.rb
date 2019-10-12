feature "02_team_leader_invite_team_members", type: :system, js: true do

  before :each do
    @team = Team.create(name: "ほげほげプロジェクト")
  end

  scenario "User can access show team page directly." do
    visit team_path @team.uid
    expect(current_path).to eq team_path @team.uid
  end
  
  scenario "User can find team's url on show team page." do
     visit team_path @team.uid
     expect(page).to have_text current_path
  end

  scenario "User is redirected team not found page when user tries to access show team page of not existing team directly." do
    visit team_path "1"
    expect(current_path).to eq team_path "1"
    expect(page).to have_text "The team is not found."
  end

end