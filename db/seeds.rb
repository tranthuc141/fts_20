User.create!(email: 'nhieu92@gmail.com',
  password: "12345678",
  password_confirmation: "12345678",
  role: "admin")

30.times do |n|
  email = "example-#{n + 2}@hieunt.com"
  password = "12345678"
  User.create!(email: email,
    password: password,
    password_confirmation: password,
    role: "normal")
end

30.times do |n|
  name = "course-#{n + 1}"
  description = "Content -#{n + 1}"
  Course.create!(name: name,
    description: description)
end