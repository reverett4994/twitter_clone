class Tweet < ActiveRecord::Base

	belongs_to :user

	has_attached_file :image
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
    validates :content,presence: true,length:{minimum: 3},length:{maximum: 120}

end
