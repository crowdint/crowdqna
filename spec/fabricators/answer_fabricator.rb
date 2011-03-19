Fabricator(:answer) do
  question     { Fabricate(:question)   }
  answer_text  { Faker::Lorem.paragraph }
  author_email { Faker::Internet.email  }
end
