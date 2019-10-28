feature "15_team_leader_inform_team_name_with_invite_link", type: :system, js: true do

  background do
    @team = create(:team)
    @member = create(:member, team: @team)
  end

  scenario "Team member shows '[Team name] | 4Q4T - Easy Drucker Exercise Tool' as title when team member gets the invite link from team leader." do
    title = "#{@team.name} | 4Q4T - Easy Drucker Exercise Tool"

    visit team_path @team
    expect(page).to have_title title
    expect(find("meta[property='og:title']", visible: false)[:content]).to eq title
  end

  scenario "User shows '4Q4T - Easy Drucker Exercise Tool' as title when user gets OGP from someone." do
    title = "4Q4T - Easy Drucker Exercise Tool"
    paths = [root_path, tos_path, pp_path, new_team_path, new_member_path(team: @team), edit_member_path(@member)]

    paths.each do |path|
      visit path
      expect(page).to have_title title
      expect(find("meta[property='og:title']", visible: false)[:content]).to eq title
    end
  end
   
end