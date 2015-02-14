class Client < ActiveRecord::Base

	has_many :sells
	after_create :email_send

	def email_send


		puts "enviando email a #{self.email}"
	end

	validates :name, :email, presence: true
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i , message: "email valido" }



end
