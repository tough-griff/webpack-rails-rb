require "rails_helper"

RSpec.describe Webpack::Rails::ViewHelpers, type: :helper do
  describe "#style_tag" do
    subject { style_tag("bundle") }

    context "in development or test mode" do
      it { is_expected.to match(%r{<script src=.*></script>}) }
    end

    context "in production mode" do
      before do
        allow(Rails).to receive_message_chain(:env, :production?)
          .and_return(true)
      end

      it { is_expected.to match(%r{<link rel="stylesheet" media="all" href=.* />}) }
    end

    context "when simulating production" do
      before do
        allow(Rails).to receive_message_chain(:application, :config, :webpack, :simulate_production)
          .and_return(true)
      end

      it { is_expected.to match(%r{<link rel="stylesheet" media="all" href=.* />}) }
    end
  end

  describe "#webpack_js_tag" do
    subject { webpack_js_tag("app") }

    it { is_expected.to match(/app\.bundle/) }
  end

  describe "#webpack_style_tag" do
    subject { webpack_style_tag("app") }

    it { is_expected.to match(/app\.style\.bundle/) }
  end
end
