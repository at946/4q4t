feature "06_team_member_rename_own_name", type: :system, js: true do

  background do
    @team = create(:team)
    @member = create(:member, team: @team)
    @member_v2 = build(:member2)
    @member_v2_space = build(:member2_space)
end

  scenario "Current name is filled in on edit member page." do
    visit edit_member_path @member
    expect(find("#member_name").value).to eq @member.name
  end

  scenario "User finds error message when user clicks on 'update' button with no input for name on edit member page." do
    msg = "Name を入力してください。"

    visit edit_member_path @member
    fill_in :member_name, with: ""
    click_on :update_member_button
    
    expect(current_path).to eq edit_member_path @member
    expect(page).to have_text msg

    fill_in :member_name, with: "　 "
    click_on :update_member_button
    
    expect(current_path).to eq edit_member_path @member
    expect(page).to have_text msg
  end

  scenario "Member is updated and user moves to show team page when user inputs 'name' and clicks on 'update' button on edit member page." do
    new_name_space = " John Smith　"
    new_name = "John Smith"

    visit edit_member_path @member
    fill_in :member_name, with: @member_v2_space.name
    click_on :update_member_button

    @member.reload

    expect(current_path).to eq team_path @team
    expect(@member.name).to eq @member_v2.name
    expect(page).to have_text @member_v2.name
    expect(page).not_to have_text @member_v2_space.name
  end

end