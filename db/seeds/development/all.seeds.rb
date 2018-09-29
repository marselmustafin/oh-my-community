puts "== Seeding started =="

community = FactoryBot.create(:community)

FactoryBot.create(:user, :owner, email: "owner@example.com", community: community)
FactoryBot.create_list(:user, 4, :member, community: community)

members = community.members

members.each do |member|
  FactoryBot.create_list(:post, 2, author: member, community: community)
end

members.each do |member|
  community.posts.each do |post|
    next if post.author == member

    FactoryBot.create(:comment, commenter: member, post: post)
    FactoryBot.create(:rating, user: member, post: post)
  end
end

members.each do |member|
  member.posts.each do |post|
    post.update(average_rating: post.ratings.average(:value))
  end
end

members.each do |member|
  member.update(rating: member.posts.average(:average_rating))
end

puts "== Seeding finished =="
