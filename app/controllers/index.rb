get '/' do
  @recent_questions = Question.order(created_at: :desc).first(10)
  @active_users = 
  erb :index
end
