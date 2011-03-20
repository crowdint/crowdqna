Fabricator(:question) do
  answered      { false                  }
  question_text { Faker::Lorem.paragraph }
end
