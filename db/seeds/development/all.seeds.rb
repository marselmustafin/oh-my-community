puts "== Seeding started =="

community = FactoryBot.create(:community)

FactoryBot.create(:user, :owner, email: "owner@example.com", community: community)
FactoryBot.create_list(:user, 4, :member, community: community)

community.members.each do |member|
  FactoryBot.create_list(:post, 2, author: member, community: community)
end

community.members.each do |member|
  community.posts.each do |post|
    next if post.author == member

    FactoryBot.create(:comment, commenter: member, post: post)
    FactoryBot.create(:rating, user: member, post: post)
  end
end

puts "== Seeding finished =="
