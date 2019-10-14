feature "05_team_leader_rename_team", type: :system, js: true do

  before :each do
    @team = Team.create(name: "ほげほげプロジェクト")
    @member = @team.members.create(name: "名無しの権兵衛", ans_q1: [], ans_q2: [], ans_q3: [], ans_q4: [])
end

  scenario "Current name is filled in on edit member page." do
    visit edit_member_path @member
    expect(find("#member_name").value).to eq @member.name
  end

  scenario "User finds error message when user clicks on 'update' button with no input for name on edit member page." do
    msg = "Name can't be blank."

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
    fill_in :member_name, with: new_name_space
    click_on :update_member_button

    @member.reload
    expect(current_path).to eq team_path @team
    expect(@member.name).to eq new_name
    expect(page).to have_text new_name
    expect(page).not_to have_text new_name_space
  end

end