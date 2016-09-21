class User < ActiveRecord::Base
  has_many :questions
  has_many :answers
  has_many :votes
  has_many :question_answers, through: :questions, source: :answers
  has_many :answered_questions, through: :answers, source: :question
  has_many :question_votes, through: :questions, source: :vote
  has_many :answer_votes, through: :answers, source: :vote

  validates :username,
            :email,
              presence: true,
              uniqueness: true

  has_secure_password
end
