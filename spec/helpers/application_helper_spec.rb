require "rails_helper"

describe ApplicationHelper do
  describe "#flash_class" do
    it "returns notice class" do
      expect(helper.flash_class('notice')).to eql('alert alert-info')
    end

    it "returns success class" do
      expect(helper.flash_class('success')).to eql('alert alert-success')
    end

    it "returns error class" do
      expect(helper.flash_class('error')).to eql('alert alert-danger')
    end

    it "returns alert class" do
      expect(helper.flash_class('alert')).to eql('alert alert-warning')
    end

  end
end
