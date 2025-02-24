30.times do
  title = Faker::Hipster.sentence(word_count: 3)
  body = Faker::Lorem.paragraph(sentence_count: 5, supplemental: true, random_sentences_to_add: 4)
  question = Question.create title: title, body: body
  3.times do
    question.answers.create body: Faker::Coffee.notes
  end
end
