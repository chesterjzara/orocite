class Argument < ActiveRecord::Base
	belongs_to :user
	has_many :ideas
	validates :user_id, presence: true
	validates :topic, presence: true, length: { maximum: 100}

end
