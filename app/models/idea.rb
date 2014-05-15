class Idea < ActiveRecord::Base
  belongs_to :user
  belongs_to :argument
  default_scope -> { order('created_at DESC') }
  validates :content, presence: true, length: { maximum: 200 }
  validates :user_id, presence: true
  validates :argument_id, presence: true


end
