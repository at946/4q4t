feature "04_team_member_leaves_team", type: :system, js: true do

  before :each do
    @team = Team.create(name: "ほげほげプロジェクト")
    @member = Member.create(
      team: @team,
      name: "名無しの　権兵衛",
      ans_q1: ["sample answer1", "サンプルアンサー１", "Sampleアンサー1"],
      ans_q2: ["sample answer2", "サンプルアンサー２", "Sampleアンサー2"],
      ans_q3: ["sample answer3", "サンプルアンサー３", "Sampleアンサー3"],
      ans_q4: ["sample answer4", "サンプルアンサー４", "Sampleアンサー4"]
    )
  end

  scenario "User can move edit member page when user clicks on edit icon on member card on show team page." do
    visit team_path @team
    all(".member-card").first.find(".edit-icon").click
    expect(current_path).to eq edit_member_path @member
  end

  scenario "User moves error page for member not found when user tries to access edit member page with no exist member" do
    visit edit_member_path "a"
    expect(page).to have_text "Member is not found."
  end

  scenario "User can open delete member confirmation dialog when user clicks on 'delete' button on edit member page." do
    confirmation = "メンバーの削除は元に戻すことができません。本当に削除しますか？"
    visit edit_member_path @member
    click_on :delete_member_button
    expect(page.driver.browser.switch_to.alert.text).to eq confirmation
    page.driver.browser.switch_to.alert.dismiss
  end

  scenario "User can close delete member confirmation dialog when user selects 'cancel' on delete member confirmation dialog." do
    visit edit_member_path @member
    click_on :delete_member_button
    page.driver.browser.switch_to.alert.dismiss
    expect(current_path).to eq edit_member_path @member
    expect{@member.reload}.not_to raise_exception
  end
  
  scenario "Member is deleted and user moves to show team page when user selects 'ok' on delete member confirmation dialog." do
    visit edit_member_path @member
    click_on :delete_member_button
    page.driver.browser.switch_to.alert.accept
    expect(current_path).to eq team_path @team
    expect(page).not_to have_text @member.name
    expect{@member.reload}.to raise_exception(ActiveRecord::RecordNotFound)
  end
end