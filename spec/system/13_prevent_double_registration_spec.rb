feature "13_prevent_double_registration", type: :system, js: true do

  background do    
    @team = create(:team)
    @team_v2 = build(:team, name: "fugafuga")
    @member = create(:member, team: @team)
    @member_v2 = build(:member2)
  end

  scenario "Only one team is created and user moves to team page when user double clicks on 'Create' button on new team page." do
    team_count = Team.count
    visit new_team_path
    fill_in :team_name, with: @team_v2.name
    expect(find("#create_team_button")["data-disable-with"]).to eq "Creating..."
    find("#create_team_button").click
    expect(Team.count).to eq team_count + 1
    expect(current_path).to eq team_path Team.last
    expect(page).to have_text @team_v2.name
  end

  scenario "Only one member is created and user moves to team page when user double clicks on 'Answer' button on new member page." do
    member_count = Member.count
    visit new_member_path(team: @team)
    fill_in :member_name, with: @member_v2.name
    expect(find("#create_member_button")["data-disable-with"]).to eq "Creating..."
    find("#create_member_button").click
    expect(Member.count).to eq member_count + 1
    expect(current_path).to eq team_path @team
    expect(page).to have_text @member_v2.name
  end

  scenario "Team update is succeeded and user moves to team page when user double clicks on 'Update' button on edit team page." do
    team_count = Team.count
    visit edit_team_path @team
    fill_in :team_name, with: @team_v2.name
    expect(find("#update_team_button")["data-disable-with"]).to eq "Updating..."
    find("#update_team_button").click
    expect(Team.count).to eq team_count
    expect(@team.reload.name).to eq @team_v2.name
    expect(current_path).to eq team_path @team
    expect(page).to have_text @team_v2.name
  end

  scenario "Member update is succeeded and user moves to team page when user double clicks on 'update' button on edit member page." do
    member_count = Member.count
    visit edit_member_path @member
    fill_in :member_name, with: @member_v2.name
    expect(find("#update_member_button")["data-disable-with"]).to eq "Updating..."
    find("#update_member_button").click
    expect(Member.count).to eq member_count
    expect(@member.reload.name).to eq @member_v2.name
    expect(current_path).to eq team_path @team
    expect(page).to have_text @member_v2.name
  end
end
