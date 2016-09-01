class CompleteController < ApplicationController
  	def index
  		@friend = Friend.find(1)
  		print "I did it yo"
  		 UserMailer.welcome("jackieoliao@gmail.com", @friend.avatar.url(:medium), @friend.name).deliver_now
  		
  	end
end
