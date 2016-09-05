require "prawn"

class CompleteController < ApplicationController
  	def index
  		print "I'm here"
  		@friend = Friend.last

  		# UserMailer.welcome("jackieoliao@gmail.com", @friend.avatar.url(:medium), @friend.name).deliver_now

  		Prawn::Document.generate("#{Rails.root}/public/pdfs/myfile.pdf") do |pdf|
  			pdf.text "Hello World"

  		redirect_to '/pdfs/myfile.pdf'
		end
  	end
end
