namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Maijid Moujaled",
                 email: "maijid@gmail.com",
                 password: "secret",
                 password_confirmation: "secret")
    admin.toggle!(:admin)
    regular = User.create!(name: "Syron Bowman",
                  email: "syron.bowman@gmail.com",
                  password: "syron232", 
                  password_confirmation: "syron232")
    98.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end

    users = User.all(limit: 6)
    50.times do
      content = Faker::Lorem.sentence(5)
      users.each { |user| user.microposts.create!(content: content)}
    end
  end
end