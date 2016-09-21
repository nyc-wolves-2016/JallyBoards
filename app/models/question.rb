class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :votes, as: :voteable

  validates :title,
            :content,
            :user,
              presence: true
end
