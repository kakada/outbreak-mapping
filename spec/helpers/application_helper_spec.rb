# frozen_string_literal: true

require "rails_helper"

RSpec.describe ApplicationHelper, type: :helper do
  describe "#mobile_request?" do
    context "desplay mode is not provided" do
      before(:each) do
        @device = DeviceDetector.new(request)
      end

      it "return false" do
        allow(@device).to receive(:device_type) { "desktop" }
        expect(mobile_request?).to eq(false)
      end

      it "return true when device is smartphone" do
        allow(@device).to receive(:device_type) { "smartphone" }
        expect(mobile_request?).to eq(true)
      end

      it "return true when device is phablet" do
        allow(@device).to receive(:device_type) { "phablet" }
        expect(mobile_request?).to eq(true)
      end
    end

    context "display mode params" do
      before(:each) do
        @device = DeviceDetector.new(request)
      end

      it "return true when display mode mobile" do
        allow(@device).to receive(:device_type) { "desktop" }
        controller.params[:display_mode] = "mobile"
        expect(mobile_request?).to eq(true)
      end

      it "return false when display mode is desktop" do
        allow(@device).to receive(:device_type) { "smartphone" }

        controller.params[:display_mode] = "desktop"
        expect(mobile_request?).to eq(false)
      end
    end
  end
end
