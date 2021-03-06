feature "04_team_member_leaves_team", type: :system, js: true do

  background do
    @team = create(:team)
    @member = create(:member, team: @team)
  end

  scenario "When a user clicks on member cards on the team page, the user moves to the edit member page." do
    visit team_path @team
    all(".member-card").first.click

    expect(page).to have_current_path edit_member_path @member
  end

  scenario "User moves error page for member not found when user tries to access edit member page with no exist member", js: false do
    expect do
      visit edit_member_path "1"
    end.to raise_exception{ActiveRecord::RecordNotFound}
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