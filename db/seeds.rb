# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.find(1)
title_text = ""
50.times do
  title_text += "c"
end

description_text = ""
75.times do
  description_text += "ba"
end

3.times do
  question = Question.create!(title: title_text, description: description_text, user_id: user.id)
  3.times do
    question.answers.create!(description: title_text, user_id: user.id)
  end
end
