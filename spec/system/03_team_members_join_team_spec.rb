feature "03_team_members_join_team", type: :system, js: true do

  background do 
    @team = create(:team)
    @member = build(:member)
    @member_space = build(:member_space)
  end

  scenario "When a user clicks on the add member button on the team page, the user moves to the new member page." do
    visit team_path @team
    click_on :add_member_button
    expect(page).to have_current_path(new_member_path(@team))
  end

  scenario "User can input the 'name' on create member page." do
    visit new_member_path(@team)
    fill_in :member_name, with: @member.name
    expect(find("#member_name").value).to eq @member.name
  end

  scenario "Member is created and user can move show team page when user clicks on 'answer' button on create member page with input of name" do
    member_count = @team.members.count

    visit new_member_path @team
    fill_in :member_name, with: @member_space.name
    click_on :create_member_button

    expect(current_path).to eq team_path @team
    expect(@team.members.count).to eq member_count + 1
    member = @team.members.last
    expect(member.name).to eq @member.name
    expect(page).to have_text @member.name
  end

  scenario "User can find error message on create member page when user clicks on 'answer' button without 'name'." do
    error_message = "Name を入力してください。"
    member_count = @team.members.count

    visit new_member_path @team
    fill_in :member_name, with: ""
    click_on :create_member_button

    expect(page).to have_current_path new_member_path @team
    expect(@team.members.count).to eq member_count
    expect(page).to have_text error_message

    fill_in :member_name, with: " 　"
    click_on :create_member_button

    expect(page).to have_current_path new_member_path @team
    expect(@team.members.count).to eq member_count
    expect(page).to have_text error_message
  end

  scenario "User is redirected to team not found page when user tries to access new member page for non-existing team.", js: false do
    expect do
      visit new_member_path "1"      
    end.to raise_exception{ActiveRecord::RecordNotFound}
  end

end
