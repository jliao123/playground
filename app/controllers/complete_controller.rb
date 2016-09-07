require "prawn"

class CompleteController < ApplicationController
  	def index
  		puts "I'm here"
  		

  		@user = Appid.find_by_session(request.session_options[:id]) #find user
  		
  		@friends = Array.new

	    @user.spaceids.each do |p| #create friends object //clean up pass @friends to this controller.
	      puts "p: "
	      puts p
	      @friends.push(Friend.find(p))
	      puts "@friends"
	      puts @friends
	    end

  		# UserMailer.welcome("jackieoliao@gmail.com", @friend.avatar.url(:medium), @friend.name).deliver_now

  		Prawn::Document.generate("#{Rails.root}/public/pdfs/myfile.pdf") do |pdf|	

  		counter = 0	
			@friends.each do |p|
				pdf.text @friends[counter].name
				pdf.text @friends[counter].ask
				pdf.image open @friends[counter].avatar.url(:medium)
				counter = counter + 1
			end

	  		
		end

		# UserMailer.welcome("jackieoliao@gmail.com", @friend.avatar.url(:medium), @friend.name).deliver_now
		InvitationMailer.invite().deliver_now
		redirect_to '/pdfs/myfile.pdf'
  	end
end
