class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :votes, as: :voteable

  validates :title,
            :content,
            :user,
              presence: true
  def set_star(starred_answer)
    self.answers.each {|answer| answer.destar}
    starred_answer.update_attributes(starred: true)
  end
end
