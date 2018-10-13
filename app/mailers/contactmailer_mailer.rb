class ContactmailerMailer < ApplicationMailer

  default from: "info@hudsoncommercial.com"

  def new_marketing_email(recipients, property)
    @recipients = recipients
    mail(
      to: recipients.map(&:email).uniq,
      subject: "New propery is on the market"
    )
  end

end
