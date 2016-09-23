get '/questions' do
  @questions = Question.all.order(created_at: :desc)
  erb :'questions/index'
end

get '/questions/new' do
  require_user
  erb :'questions/_new'
end

post '/questions' do
  question = Question.new(params[:question])
  question.user_id = current_user.id
    if question.save
      if request.xhr?
        erb :'questions/_questions', layout: false, locals: { question: question }
      else
        redirect '/questions'
        erb :'questions/_new'
      end
    else
      @errors = question.errors.full_messages
    end
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  erb :'questions/show'
end

get '/questions/:question_id/votes/new' do
  redirect '/questions'
end

post '/questions/:question_id/votes' do
  #change in vote migration  
  if params[:status] == "upvote"
    params[:status] = true
  else
    params[:status] = false
  end

  question = Question.find(params[:question_id])
  vote = Vote.create(user_id: current_user.id, voteable: question, status: params[:status])

  if request.xhr?
    erb :'questions/_vote_count', layout: false, locals: {post: question}
  else

    redirect '/questions/:question_id/votes/new'
  end
end

put '/questions/:question_id/votes/:id' do
  question = Question.find(params[:question_id])
  if params[:status] == "upvote"
    user_vote(question).update_attributes(status: true)
  else
    user_vote(question).update_attributes(status: false)
  end

  redirect '/questions/:question_id/votes/:id/edit'

  if request.xhr?
    erb :'questions/_vote_count', layout: false, locals: {post: question}
  else

    redirect '/questions/:question_id/votes/new'
  end
end

get '/questions/:question_id/votes/:id/edit' do
  redirect '/questions'
end

put  '/questions/:question_id/answers/:id/star' do
  question = Question.find(params[:question_id])
  if question.user == current_user
    answer = Answer.find(params[:id])
    question.set_star(answer)
      if answer.starred == true
        if request.xhr?

        else
          redirect "/questions/#{question.id}"
        end
      else
        redirect "/questions/#{question.id}"
      end
  else
    redirect "/questions/#{question.id}"
  end
end
