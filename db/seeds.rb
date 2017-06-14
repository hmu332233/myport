# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create(:name => "한민웅", :email => "test@test.com", :password => "123456")
User.create(:name => "반상민", :email => "test2@test.com", :password => "123456")
User.create(:name => "박도현", :email => "test3@test.com", :password => "123456")

Post.create(title: "제목1", content: "내용1", scope: 0, user_name: "한민웅", user_id: 1)
Post.create(title: "제목2", content: "내용2", scope: 0, user_name: "한민웅", user_id: 1)
Post.create(title: "제목3", content: "내용3", scope: 0, user_name: "한민웅", user_id: 1)

Post.create(title: "제목1", content: "내용1", scope: 0, user_name: "반상민", user_id: 2)
Post.create(title: "제목2", content: "내용2", scope: 0, user_name: "반상민", user_id: 2)
Post.create(title: "제목3", content: "내용3", scope: 0, user_name: "반상민", user_id: 2)

Post.create(title: "제목1", content: "내용1", scope: 0, user_name: "박도현", user_id: 3)
Post.create(title: "제목2", content: "내용2", scope: 0, user_name: "박도현", user_id: 3)
Post.create(title: "제목3", content: "내용3", scope: 0, user_name: "박도현", user_id: 3)