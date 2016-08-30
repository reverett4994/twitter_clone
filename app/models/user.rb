class User < ActiveRecord::Base
	include MailForm::Delivery
	has_secure_password
  	has_friendship
  	has_attached_file :avatar
    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
	has_many :tweets



	before_save :downcase_email
	validates :email,presence: true,
					 uniqueness: true,
	                  format: {
	                    with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9\.-]+\.[A-Za-z]+\Z/
	                  }
     validates :username,presence: true,length:{minimum: 5},length:{maximum: 20}
     validates :username,length:{maximum: 20}
     validates_length_of :username, :minimum => 3
     validates :username, uniqueness: true
     validates :first_name,presence: true
     validates_length_of :password, :minimum => 5
     validates :avatar,presence: true
	def downcase_email
		self.email=email.downcase
	end

	  def headers
	   {
      :to => "pattonsrevolver@gmail",
      :subject => "User created an account"
   	   }
  end
end
#, styles: { medium: "300x300>", thumb: "100x100>" }