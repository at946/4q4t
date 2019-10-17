feature "08_team_leader_deletes_team", type: :system, js: true do

  before :each do
    @team = Team.create(name: "ほげほげプロジェクト")
    @member = @team.members.create(name: "John Smith", ans_q1: ["ANS1-Q1"], ans_q2: ["ANS-Q2"], ans_q3: ["ANS-Q3"], ans_q4: ["ANS-Q4"])
  end

  scenario "User can open 'team delete confirmation dialog' when user clicks on 'delete' button on edit team page." do
    confirmation = "チームの削除は元に戻すことができません。また、チームの全てのメンバーも削除されます。本当に削除しますか？"

    visit edit_team_path @team
    click_on :delete_team_button
    expect(page.driver.browser.switch_to.alert.text).to eq confirmation
    page.driver.browser.switch_to.alert.dismiss
  end

  scenario "User can close 'team delete confirmation dialog' when user selects 'cancel' on 'team delete confirmation dialog'." do
    visit edit_team_path @team
    click_on :delete_team_button
    page.driver.browser.switch_to.alert.dismiss
    expect(current_path).to eq edit_team_path @team
    expect{@member.reload}.not_to raise_exception
    expect{@team.reload}.not_to raise_exception
  end

  scenario "Team and member are deleted and user moves to top page when user selects 'ok' on 'team delete confirmation dialog'." do
    visit edit_team_path @team
    click_on :delete_team_button
    page.driver.browser.switch_to.alert.accept
    expect(current_path).to eq root_path
    expect{@member.reload}.to raise_exception ActiveRecord::RecordNotFound
    expect{@team.reload}.to raise_exception ActiveRecord::RecordNotFound
  end

end