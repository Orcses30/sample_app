# Users
User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin:     true,
             activated: true,
             activated_at: Time.zone.now)

40.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

# Microposts
users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(content: content) }
end

# Following relationships
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }

# CFP Books
Book.create!(number:      1,
             description: "General Financial Planning Principles,
                           Professional Conduct, and Regulation",
             created_at:   Time.zone.now)
Book.create!(number:      2,
             description: "Risk Management, Insurance, and
                           Employee Benefits",
             created_at:   Time.zone.now)
Book.create!(number:      3,
             description: "Investment Planning",
             created_at:   Time.zone.now)
Book.create!(number:      4,
             description: "Tax Planning",
             created_at:   Time.zone.now)
Book.create!(number:      5,
             description: "Retirement Savings and Income Planning",
             created_at:   Time.zone.now)
Book.create!(number:      6,
             description: "Estate Planning",
             created_at:   Time.zone.now)
Book.create!(number:      7,
             description: "Financial Plan Development",
             created_at:   Time.zone.now)

# Questions for Books
#books = Book.all
#40.times do |n|
  #question  = "This is question #{n+1}"
  #answer    = "This is answer #{n+1}"
  #books.each { |book| book.questions.create!(
               #question:  question,
               #answer:    answer,
               #book_id: book.number) }
#end
