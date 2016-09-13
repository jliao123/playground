require "prawn"

class CompleteController < ApplicationController
  	def index

  		puts "I'm in complete controller"
  		

  		@user = Appid.find_by_session(session.id) #find user

  		@user.email = params[:appid][:email]
  		@user.name = params[:appid][:name]
  		@user.save

  		# pry
  		
  		@friends = Array.new

	    @user.spaceids.each do |p| #create friends object //clean up pass @friends to this controller.
	      puts "p: "
	      puts p
	      @friends.push(Friend.find(p))
	      Friend.find(p).destroy #kill from s3
	      puts "@friends"
	      puts @friends
	    end

  		# UserMailer.welcome("jackieoliao@gmail.com", @friend.avatar.url(:medium), @friend.name).deliver_now

  		Prawn::Document.generate("#{Rails.root}/public/pdfs/myfile.pdf") do |pdf|	

  		counter = 0	
  		pdf.text @user.name
  		pdf.text @user.email
			@friends.each do |p|
				pdf.text @friends[counter].name
				pdf.text @friends[counter].ask
				puts @friends[counter].avatar.url
				if @friends[counter].avatar.url != "/avatars/original/missing.png"
 					pdf.image open @friends[counter].avatar.url(:original)
 				end
				
				counter = counter + 1
			end

	  		
		end

		# UserMailer.welcome("jackieoliao@gmail.com", @friend.avatar.url(:medium), @friend.name).deliver_now

	    InvitationMailer.invite().deliver_now
	    #delete user
	    @user.destroy


		# redirect_to '/pdfs/myfile.pdf'
  	end
end
