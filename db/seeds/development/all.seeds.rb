puts "== Seeding started =="

community = FactoryBot.create(:community)

FactoryBot.create(:admin, email: "admin@example.com")
FactoryBot.create(:user, :owner, email: "owner@example.com", community: community)
FactoryBot.create_list(:user, 4, :member, community: community)

users = community.users

users.each do |user|
  FactoryBot.create_list(:post, 2, author: user, community: community)
end

users.each do |user|
  community.posts.each do |post|
    next if post.author == user

    FactoryBot.create(:comment, commenter: user, post: post)
    FactoryBot.create(:rating, user: user, post: post)
  end
end

users.each do |user|
  user.posts.each do |post|
    post.update(average_rating: post.ratings.average(:value))
  end
end

users.each do |user|
  user.update(rating: user.posts.average(:average_rating))
end

puts "== Seeding finished =="
