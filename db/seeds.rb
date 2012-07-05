# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
# . . .
User.create(:name => 'Xiao Qiang Wu', :email => "xiaoqiangwu.school@gmail.com", :password => "password",
  :description => %{I am cool.},
  :image_url =>   '/images/xqw.jpg',    
  )
# . . .
User.create(:name => 'William Wu', :email => "xiaoqiangwu2010@gmail.com", :password => "password",
  :description => %{I am cool.},
  :image_url =>   '/images/ww.jpg',    
  )
# . . .
User.create(:name => 'Xiao Qiang', :email => "xiaoqiangwu2007@gmail.com", :password => "password",
  :description => %{I am cool.},
  :image_url =>   '/images/xq.jpg',    
  )