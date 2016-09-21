class Question < ActiveRecord::Base
  belongs_to :user
  has_many :votes, as: :voteable

  validates :question,
            :user,
              presence: true
end
