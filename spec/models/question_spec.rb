require 'rails_helper'

RSpec.describe Question, type: :model do
  let(:question) { Question.create!(title: "This is the Title", body: "This is the body") }

  describe "attributes" do
    it "has title and body attributes" do
      expect(question).to have_attribute(title: "This is the Title", body: "This is the body")
    end
  end
end
