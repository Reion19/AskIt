30.times do
  question = Question.create!(title: Faker::Job.title,
                              body: Faker::Lorem.paragraph(sentence_count: 5,
                                                           supplemental: true, random_sentences_to_add: 4))
  2.times do
    question.answers.create!(body: Faker::Superhero.power)
  end
end
