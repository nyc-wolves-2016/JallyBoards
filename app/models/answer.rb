class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  has_many :votes, as: :voteable

  validates :user,
            :question,
              presence: true

  def destar
    self.update_attributes(starred: false)
  end
end
