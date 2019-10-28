feature "12_user_follows_on_twitter", type: :system, js: true do

  background do    
    @team = create(:team)
    @member = create(:member, team: @team)
  end

  scenario "User moves to my twitter account when user clicks on twitter icon on footer on top page." do
    visit root_path
    expect(find("a#twitter_icon")[:href]).to eq "https://twitter.com/at_946"
    expect(find("a#twitter_icon")[:target]).to eq "_blank"
  end

  scenario "User moves to my twitter account when user clicks on twitter icon on footer on terms page." do
    visit tos_path
    expect(find("a#twitter_icon")[:href]).to eq "https://twitter.com/at_946"
    expect(find("a#twitter_icon")[:target]).to eq "_blank"
  end

  scenario "User moves to my twitter account when user clicks on twitter icon on footer on privacy policy page." do
    visit pp_path
    expect(find("a#twitter_icon")[:href]).to eq "https://twitter.com/at_946"
    expect(find("a#twitter_icon")[:target]).to eq "_blank"
  end

  scenario "User moves to my twitter account when user clicks on twitter icon on footer on new team page." do
    visit new_team_path
    expect(find("a#twitter_icon")[:href]).to eq "https://twitter.com/at_946"
    expect(find("a#twitter_icon")[:target]).to eq "_blank"
  end

  scenario "User moves to my twitter account when user clicks on twitter icon on footer on team page." do
    visit team_path @team
    expect(find("a#twitter_icon")[:href]).to eq "https://twitter.com/at_946"
    expect(find("a#twitter_icon")[:target]).to eq "_blank"
  end

  scenario "User moves to my twitter account when user clicks on twitter icon on footer on new member page." do
    visit new_member_path(team: @team)
    expect(find("a#twitter_icon")[:href]).to eq "https://twitter.com/at_946"
    expect(find("a#twitter_icon")[:target]).to eq "_blank"
  end

  scenario "User moves to my twitter account when user clicks on twitter icon on footer on edit member page." do
    visit edit_member_path @member
    expect(find("a#twitter_icon")[:href]).to eq "https://twitter.com/at_946"
    expect(find("a#twitter_icon")[:target]).to eq "_blank"
  end

  scenario "User moves to my twitter account when user clicks on twitter icon on footer on edit team page." do
    visit edit_team_path @team
    expect(find("a#twitter_icon")[:href]).to eq "https://twitter.com/at_946"
    expect(find("a#twitter_icon")[:target]).to eq "_blank"
  end

end