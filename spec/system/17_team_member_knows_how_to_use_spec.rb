feature "17_team_member_knows_how_to_use", type: :system, js: true do

  background do
    @team = create(:team)
    @titles = ["1. Answer", "2. Presentation", "3. Feedback"]
  end

  scenario "'How to use modal' opens, when the user clicks on ? icon on team page." do
    visit team_path @team
    
    expect(page).not_to have_selector "#how_to_use_modal"
    
    find("#how_to_use_icon").click
    
    expect(page).to have_selector "#how_to_use_modal"
  end

  scenario "The user find next explaination, when the user selects next icon on how to use modal." do
    visit team_path @team
    find("#how_to_use_icon").click

    expect(find("#how_to_use_modal")).to      have_text @titles[0]
    expect(find("#how_to_use_modal")).not_to  have_text @titles[1]
    expect(find("#how_to_use_modal")).not_to  have_text @titles[2]

    find("#slide_next_icon").click

    expect(find("#how_to_use_modal")).not_to  have_text @titles[0]
    expect(find("#how_to_use_modal")).to      have_text @titles[1]
    expect(find("#how_to_use_modal")).not_to  have_text @titles[2]

    find("#slide_next_icon").click

    expect(find("#how_to_use_modal")).not_to  have_text @titles[0]
    expect(find("#how_to_use_modal")).not_to  have_text @titles[1]
    expect(find("#how_to_use_modal")).to      have_text @titles[2]
  end

  scenario "The user find previous explaination, when the user selects previous icon on how to use modal." do
    titles = ["1. 質問に回答する", "2. 回答を発表し合う", "3. フィードバックし合う"]

    visit team_path @team
    find("#how_to_use_icon").click
    find("#slide_next_icon").click
    find("#slide_next_icon").click

    expect(find("#how_to_use_modal")).not_to  have_text @titles[0]
    expect(find("#how_to_use_modal")).not_to  have_text @titles[1]
    expect(find("#how_to_use_modal")).to      have_text @titles[2]

    find("#slide_prev_icon").click

    expect(find("#how_to_use_modal")).not_to  have_text @titles[0]
    expect(find("#how_to_use_modal")).to      have_text @titles[1]
    expect(find("#how_to_use_modal")).not_to  have_text @titles[2]

    find("#slide_prev_icon").click

    expect(find("#how_to_use_modal")).to      have_text @titles[0]
    expect(find("#how_to_use_modal")).not_to  have_text @titles[1]
    expect(find("#how_to_use_modal")).not_to  have_text @titles[2]
  end

  scenario "There is not previous icon on first explaination on how to use modal." do
    visit team_path @team
    find("#how_to_use_icon").click

    expect(find("#how_to_use_modal")).not_to  have_selector "#slide_prev_icon"
    expect(find("#how_to_use_modal")).to      have_selector "#slide_next_icon"
  end

  scenario "There is not next icon on last explaination on how to use modal." do
    visit team_path @team
    find("#how_to_use_icon").click
    find("#slide_next_icon").click
    find("#slide_next_icon").click

    expect(find("#how_to_use_modal")).to      have_selector "#slide_prev_icon"
    expect(find("#how_to_use_modal")).not_to  have_selector "#slide_next_icon"
  end

  scenario "How to use modal is closed, when the user selects close icon on how to use modal." do
    visit team_path @team
    find("#how_to_use_icon").click
    
    expect(page).to have_selector "#how_to_use_modal"

    find("#close_icon").click

    expect(page).not_to have_selector "#how_to_use_modal"
  end

end