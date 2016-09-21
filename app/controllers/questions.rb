get '/questions' do
  @questions = Question.all
  erb :'questions/index'
end

get '/questions/new' do
  erb :'questions/new'
end

post '/questions' do
  question = Question.new(params[:question])
  question.user_id = current_user.id
  if question.save

    redirect '/questions'
  else
    @errors = question.errors.full_messages
    erb :'questions/new'
  end
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  erb :'questions/show'
end

get '/questions/:id/votes' do
  question = Question.find(params[:id])
  vote = Vote.create(user_id: current_user.id, voteable: question)
  redirect '/questions'
end
