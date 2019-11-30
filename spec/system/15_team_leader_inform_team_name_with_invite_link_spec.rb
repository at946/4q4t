feature "15_team_leader_inform_team_name_with_invite_link", type: :system, js: true do

  background do
    @team = create(:team)
    @member = create(:member, team: @team)
  end

  scenario "Team member shows '4Q4T - Easy Drucker Exercise Tool' as the title of the top page on OGP." do
    title = "4Q4T - Easy Drucker Exercise Tool"

    visit root_path
    expect(page).to have_title title
    expect(find("meta[property='og:title']", visible: false)[:content]).to eq title
  end

  scenario "Team member shows '4Q4T - Easy Drucker Exercise Tool' as the title of the terms page on OGP." do
    title = "4Q4T - Easy Drucker Exercise Tool"

    visit tos_path
    expect(page).to have_title title
    expect(find("meta[property='og:title']", visible: false)[:content]).to eq title
  end

  scenario "Team member shows '4Q4T - Easy Drucker Exercise Tool' as the title of the privacy policy page on OGP." do
    title = "4Q4T - Easy Drucker Exercise Tool"

    visit pp_path
    expect(page).to have_title title
    expect(find("meta[property='og:title']", visible: false)[:content]).to eq title
  end

  scenario "Team member shows '4Q4T - Easy Drucker Exercise Tool' as the title of the new team page on OGP." do
    title = "4Q4T - Easy Drucker Exercise Tool"

    visit new_team_path
    expect(page).to have_title title
    expect(find("meta[property='og:title']", visible: false)[:content]).to eq title
  end

  scenario "Team member shows '[Team name] | 4Q4T - Easy Drucker Exercise Tool' as the title of the team page on OGP." do
    title = "#{@team.name} | 4Q4T - Easy Drucker Exercise Tool"

    visit team_path @team
    expect(page).to have_title title
    expect(find("meta[property='og:title']", visible: false)[:content]).to eq title
  end

  scenario "Team member shows '[Team name] | 4Q4T - Easy Drucker Exercise Tool' as the title of the edit team page on OGP." do
    title = "#{@team.name} | 4Q4T - Easy Drucker Exercise Tool"

    visit edit_team_path @team
    expect(page).to have_title title
    expect(find("meta[property='og:title']", visible: false)[:content]).to eq title
  end
   
  scenario "Team member shows '[Team name] | 4Q4T - Easy Drucker Exercise Tool' as the title of the new member page on OGP." do
    title = "#{@team.name} | 4Q4T - Easy Drucker Exercise Tool"

    visit new_member_path @team
    expect(page).to have_title title
    expect(find("meta[property='og:title']", visible: false)[:content]).to eq title
  end

  scenario "Team member shows '[Team name] | 4Q4T - Easy Drucker Exercise Tool' as the title of the edit member page on OGP." do
    title = "#{@team.name} | 4Q4T - Easy Drucker Exercise Tool"

    visit edit_member_path @member
    expect(page).to have_title title
    expect(find("meta[property='og:title']", visible: false)[:content]).to eq title
  end

  scenario "Team member shows '[Team name] | 4Q4T - Easy Drucker Exercise Tool' as the title of the druckers page on OGP." do
    title = "#{@team.name} | 4Q4T - Easy Drucker Exercise Tool"

    visit druckers_path @team
    expect(page).to have_title title
    expect(find("meta[property='og:title']", visible: false)[:content]).to eq title
  end

  scenario "Team member shows '[Team name] | 4Q4T - Easy Drucker Exercise Tool' as the title of the edit drucker page on OGP." do
    title = "#{@team.name} | 4Q4T - Easy Drucker Exercise Tool"

    visit edit_drucker_path @member
    expect(page).to have_title title
    expect(find("meta[property='og:title']", visible: false)[:content]).to eq title
  end

  scenario "Team member shows '[Team name] | 4Q4T - Easy Drucker Exercise Tool' as the title of the drucker exercise page on OGP." do
    title = "#{@team.name} | 4Q4T - Easy Drucker Exercise Tool"

    visit drucker_exercise_path @team
    expect(page).to have_title title
    expect(find("meta[property='og:title']", visible: false)[:content]).to eq title
  end

end