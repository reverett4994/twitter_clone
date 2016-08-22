class User < ActiveRecord::Base
	
	has_secure_password
  	has_friendship
	has_many :tweets



	before_save :downcase_email
	validates :email,presence: true,
					 uniqueness: true,
	                  format: {
	                    with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9\.-]+\.[A-Za-z]+\Z/
	                  }
	def downcase_email
		self.email=email.downcase
	end
end
