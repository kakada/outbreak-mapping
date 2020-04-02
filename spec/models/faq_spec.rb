# frozen_string_literal: true

require "rails_helper"

RSpec.describe Faq, type: :model do
  describe "#create" do
    let(:faq1) { create(:faq) }
    let(:faq2) { create(:faq) }

    it "should assign position when create" do
      expect(faq1.position).to eq(1)
      expect(faq2.position).to eq(2)
    end
  end
end
