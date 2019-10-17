feature "11_user_moves_to_top_page", type: :system, js: true do

  before :each do
    @team = Team.create(name: "ほげほげプロジェクト")
    @member = @team.members.create(name: "John Smith", ans_q1: ["ANS-Q1"], ans_q2: ["ANS-Q2"], ans_q3: ["ANS-Q3"], ans_q4: ["ANS-Q4"])
  end

  scenario "User moves to top page when user clicks on header logo on top page." do
    visit root_path
    click_on :header_logo
    expect(current_path).to eq root_path
  end

  scenario "User moves to top page when user clicks on header logo on terms page." do
    visit tos_path
    click_on :header_logo
    expect(current_path).to eq root_path
  end

  scenario "User moves to top page when user clicks on header logo on privacy policy page." do
    visit pp_path
    click_on :header_logo
    expect(current_path).to eq root_path
  end

  scenario "User moves to top page when user clicks on header logo on create team page." do
    visit new_team_path
    click_on :header_logo
    expect(current_path).to eq root_path
  end

  scenario "User moves to top page when user clicks on header logo on team page." do
    visit team_path @team
    click_on :header_logo
    expect(current_path).to eq root_path
  end

  scenario "User moves to top page when user clicks on header logo on edit team page." do
    visit edit_team_path @team
    click_on :header_logo
    expect(current_path).to eq root_path
  end

  scenario "User moves to top page when user clicks on header logo on create member page." do
    visit new_member_path(team: @team)
    click_on :header_logo
    expect(current_path).to eq root_path
  end

  scenario "User moves to top page when user clicks on header logo on edit member page." do
    visit edit_member_path @member
    click_on :header_logo
    expect(current_path).to eq root_path
  end

end