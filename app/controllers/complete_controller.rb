class CompleteController < ApplicationController
  	def index
  		print "I'm here"
  		@friend = Friend.find(1)
  		UserMailer.welcome("jackieoliao@gmail.com", @friend.avatar.url(:medium), @friend.name).deliver_now
  	end
end
