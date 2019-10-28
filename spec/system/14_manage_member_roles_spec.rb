feature "14_manage_member_roles", type: :system, js: true do

  background do
    @team = create(:team)
    @member1 = create(:member, team: @team)
    @member2 = create(:member2, team: @team, role: "")
    @member3 = build(:member, name: "Yamada Hanako", role: "Developer")
    @member3_space = build(:member, name: "Yamada Hanako", role: " Developer　")
  end

  scenario "Member can input own 'Role' on new member page." do
    visit new_member_path(team: @team)
    fill_in :member_role, with: @member3.role
    expect(find("#member_role").value).to eq @member3.role
  end

  scenario "Member is created and moves to team page, when member clicks on 'Create' button after inputing role on new member page." do
    member_count = Member.count

    visit new_member_path(team: @team)
    fill_in :member_name, with: @member3.name
    fill_in :member_role, with: @member3.role
    click_on :create_member_button

    expect(Member.count).to eq member_count + 1
    expect(Member.last.role).to eq @member3.role

    expect(current_path).to eq team_path @team
    expect(page).to have_text @member3.role

    Member.last.destroy

    visit new_member_path(team: @team)
    fill_in :member_name, with: @member3.name
    fill_in :member_role, with: @member3_space.role
    click_on :create_member_button

    expect(Member.count).to eq member_count + 1
    expect(Member.last.role).to eq @member3.role

    expect(current_path).to eq team_path @team
    expect(page).to have_text @member3.role
  end

  scenario "Member is created and moves to team page, when member clicks on 'Create' button without inputing role on new member page." do
    member_count = Member.count

    visit new_member_path(team: @team)
    fill_in :member_name, with: @member3.name
    fill_in :member_role, with: ""
    click_on :create_member_button

    expect(Member.count).to eq member_count + 1
    expect(Member.last.name).to eq @member3.name
    expect(Member.last.role.blank?).to eq true

    expect(current_path).to eq team_path @team
    expect(all(".member-card").last).not_to have_text "（）"

    Member.last.destroy

    visit new_member_path(team: @team)
    fill_in :member_name, with: @member3.name
    fill_in :member_role, with: "　 "
    click_on :create_member_button

    expect(Member.count).to eq member_count + 1
    expect(Member.last.role.blank?).to eq true

    expect(current_path).to eq team_path @team
    expect(all(".member-card").last).not_to have_text "（）"
  end

  scenario "Member can know members' role on team page." do
    visit team_path @team
    expect(all(".member-card")[0]).to have_text @member1.role
    expect(all(".member-card")[1]).not_to have_text "（）"
  end

  scenario "Present role is filled in by default on edit member page." do
    visit edit_member_path @member1
    expect(find("#member_role").value).to eq @member1.role

    visit edit_member_path @member2
    expect(find("#member_role").value).to eq @member2.role
  end

  scenario "Member is updated and moves to team page, when member clicks on 'Update' button after inputing role on edit member page." do
    member_count = Member.count
    visit edit_member_path @member1
    fill_in :member_role, with: @member3.role
    click_on :update_member_button

    expect(Member.count).to eq member_count
    expect(@member1.reload.role).to eq @member3.role

    expect(current_path).to eq team_path @team
    expect(all(".member-card")[0]).to have_text @member1.name
    expect(all(".member-card")[0]).to have_text @member3.role

    visit edit_member_path @member2
    fill_in :member_role, with: @member3_space.role
    click_on :update_member_button

    expect(Member.count).to eq member_count
    expect(@member1.reload.role).to eq @member3.role

    expect(current_path).to eq team_path @team
    expect(all(".member-card")[1]).to have_text @member2.name
    expect(all(".member-card")[1]).to have_text @member3.role
  end

  scenario "Member is updated and moves to team page, when member clicks on 'Update' button withoug inputing role on edit member page." do
    member_count = Member.count
    visit edit_member_path @member1
    fill_in :member_role, with: ""
    click_on :update_member_button

    expect(Member.count).to eq member_count
    expect(@member1.reload.role.blank?).to eq true

    expect(current_path).to eq team_path @team
    expect(all(".member-card")[0]).to have_text @member1.name
    expect(all(".member-card")[0]).not_to have_text "（）"

    visit edit_member_path @member2
    fill_in :member_role, with: " 　"
    click_on :update_member_button

    expect(Member.count).to eq member_count
    expect(@member1.reload.role.blank?).to eq true

    expect(current_path).to eq team_path @team
    expect(all(".member-card")[1]).to have_text @member2.name
    expect(all(".member-card")[1]).not_to have_text "（）"
  end
    
end