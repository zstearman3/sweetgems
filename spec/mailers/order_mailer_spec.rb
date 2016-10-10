require "rails_helper"

RSpec.describe OrderMailer, type: :mailer do
  describe "new_order" do
    order = Order.first
    let(:mail) { OrderMailer.new_order(order) }

    it "renders the headers" do
      expect(mail.subject).to eq("New order")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["noreply@sweetgemsthx.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
