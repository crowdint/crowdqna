require 'spec_helper'

describe Question do
  before :each do
    @question = Fabricate(:question)
  end

  describe "#answer_count" do
    context "the question has no answers" do
      it "returns 0" do
        @question.answer_count.should == 0
      end
    end

    context "the question has 3 answers" do
      before :each do
        3.times do
          @question.answers.build(Fabricate.attributes_for(:answer))
        end
        @question.save!
      end

      it "returns 3" do
        @question.answer_count.should == 3
      end
    end
  end
end
