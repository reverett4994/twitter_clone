class UserMailer < ApplicationMailer

	default from: 'TwitterClone'
	 
	def welcome_email(user)
	   @user = user
	   @url  = 'https://mysterious-mesa-31808.herokuapp.com/login'
	   mail(to: @user.email, subject: 'Welcome to TwitterClone!')
	end
end
