get '/questions' do
  @questions = Question.all.order(created_at: :desc)
  erb :'questions/index'
end

get '/questions/new' do
  require_user
  erb :'questions/new'
end

post '/questions' do
  question = Question.new(params[:question])
  question.user_id = current_user.id
    if question.save
      if request.xhr?
        erb :'questions/_questions', layout: false, locals: { question: question }
      else
        redirect '/questions'
        erb :'questions/new'
      end
    else
      @errors = question.errors.full_messages
    end
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  erb :'questions/show'
end

get '/questions/:id/votes' do
  vote_status = params[:status]
  if vote_status == "upvote"
    vote_status = true
  else
    vote_status = false
  end
  question = Question.find(params[:id])
  vote = Vote.create(user_id: current_user.id, voteable: question, status: vote_status)
  redirect '/questions'
end

put  '/questions/:question_id/answers/:id/star' do
  question = Question.find(params[:question_id])
  answer = Answer.find(params[:id])
  answer.update_attributes(starred: true)
  if answer.starred == true
    redirect "/questions/#{question.id}"
  else
    erb :'questions/show'
  end
end
