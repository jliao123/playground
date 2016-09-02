class CompleteController < ApplicationController
  	def index
  		print "I'm here"
  		@friend = Friend.last
  		UserMailer.welcome("jackieoliao@gmail.com", @friend.avatar.url(:medium), @friend.name).deliver_now
  	end
end
