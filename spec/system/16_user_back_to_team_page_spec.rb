feature "16_user_back_to_team_page", type: :system, js: true do

  background do
    @team = create(:team)
    @member = create(:member, team: @team)
  end

  scenario "Team is not created and the user moves to top page, when the user clicks on return icon on new team page." do
    team_count = Team.count

    visit new_team_path
    click_on :return_icon

    expect(Team.count).to eq team_count
    expect(page).to have_current_path root_path
  end

  scenario "Team is not updated and the user moves to team page, when the user clicks on return icon on edit team page." do
    team_count = Team.count
    team = @team

    visit edit_team_path @team
    fill_in :team_name, with: "fuga"
    click_on :return_icon

    expect(Team.count).to eq team_count
    expect(@team.reload).to eq team
    expect(page).to have_current_path team_path team
  end

  scenario "Member is not created and the user moves to team page, when the user clicks on return icon on new member page." do
    member_count = Member.count

    visit new_member_path(team: @team)
    click_on :return_icon

    expect(Member.count).to eq member_count
    expect(page).to have_current_path team_path @team
  end

  scenario "Member is not updated and the user moves to team page, when the user clicks on return icon on edit member page." do
    member_count = Member.count
    member = @member

    visit edit_member_path @member
    fill_in :member_name, with: "fuga"
    click_on :return_icon

    expect(Member.count).to eq member_count
    expect(@member.reload).to eq member
    expect(page).to have_current_path team_path @team
  end

end