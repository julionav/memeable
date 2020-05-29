# Create admin user
User.create!(username: 'admin', password: '123456', email: 'admin@example.com')

# add some categories
categories = ['Developer', 'Other']
Category.create!(categories.map { |ctg| { name: ctg } })

# add some memes

(1..10).each do |num|
  fake_meme = {
    title: "Meme Title #{num}",
    type: "image",
    category: [Category.first, Category.second][rand * 2],
    created_at: (rand * 3).days.ago,
    # add random amount of votes
    votes_count: rand * 5,
    url_source: "http://localhost:3000/memes/#{num}.png",
    owner: User.first
  }
  Meme.create!(fake_meme)
end
