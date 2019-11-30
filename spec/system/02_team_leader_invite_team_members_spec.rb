feature "02_team_leader_invite_team_members", type: :system, js: true do

  background :each do
    @team = create(:team)
  end

  scenario "User can access show team page directly." do
    visit team_path @team.uid
    expect(current_path).to eq team_path @team.uid
  end
  
  scenario "User can find team's url on show team page." do
     visit team_path @team.uid
     expect(page).to have_text current_path
  end

  scenario "User is redirected team not found page when user tries to access show team page of not existing team directly.", js: false do
    expect do
      visit team_path "1"      
    end.to raise_exception{ActiveRecord::RecordNotFound}
  end

end