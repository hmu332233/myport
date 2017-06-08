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