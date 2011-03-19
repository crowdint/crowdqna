Fabricator(:answer) do
  answer_text  { Faker::Lorem.paragraph }
  author_email { Faker::Internet.email  }
end
