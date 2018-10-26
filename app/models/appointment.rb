class Appointment < ApplicationRecord
  has_and_belongs_to_many :contacts
  has_and_belongs_to_many :users
  validates :name, presence: true
  validates :phone_number, presence: true
  validates :time, presence: true

  after_create :reminder

  # Notify our appointment attendee X minutes before the appointment time
  def reminder
       time_str = ((self.time).localtime).strftime("%I:%M%p on %b. %d, %Y")
       message = "Your appontment '#{self.name}' is at '#{time_str}' Sent Form Hudson-Lab"
      TwilioTextMessenger.new(message).call(self.phone_number)
  end

  def when_to_run
    minutes_before_appointment = 120.minutes
    time - minutes_before_appointment
  end

  handle_asynchronously :reminder, :run_at => Proc.new { |i| i.when_to_run }
end

