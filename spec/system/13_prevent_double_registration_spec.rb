feature "13_prevent_double_registration", type: :system, js: true do

  before :each do
    @team = Team.create(name: "ほげほげプロジェクト")
    @member = @team.members.create(name: "John Smith", ans_q1: ["ANS-Q1"], ans_q2: ["ANS-Q2"], ans_q3: ["ANS-Q3"], ans_q4: ["ANS-Q4"])
  end

  scenario "Only one team is created and user moves to team page when user double clicks on 'Create' button on new team page." do
    team_count = Team.count
    visit new_team_path
    fill_in :team_name, with: "HogeHoge Project"
    find("#create_team_button").double_click
    expect(Team.count).to eq team_count + 1
    expect(current_path).to eq team_path Team.last
  end

  scenario "Only one member is created and user moves to team page when user double clicks on 'Answer' button on new member page." do
    member_count = Member.count
    visit new_member_path(team: @team)
    fill_in :member_name, with: "じょん　すみす"
    find("#create_member_button").double_click
    expect(Member.count).to eq member_count + 1
    expect(current_path).to eq team_path @team    
  end

  scenario "Team update is succeeded and user moves to team page when user double clicks on 'Update' button on edit team page." do
    team_count = Team.count
    new_team_name = "ふがふがプロジェクト"
    visit edit_team_path @team
    fill_in :team_name, with: new_team_name
    find("#update_team_button").double_click
    expect(Team.count).to eq team_count
    expect(@team.reload.name).to eq new_team_name
    expect(current_path).to eq team_path @team
  end

  scenario "Member update is succeeded and user moves to team page when user double clicks on 'update' button on edit member page." do
    member_count = Member.count
    new_member_name = "ななしのごんべえ"
    visit edit_member_path @member
    fill_in :member_name, with: new_member_name
    find("#update_member_button").double_click
    expect(Member.count).to eq member_count
    expect(@member.reload.name).to eq new_member_name
    expect(current_path).to eq team_path @team
  end
end
