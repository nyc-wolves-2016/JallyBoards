post '/questions/:id/answer' do
  answer = Answer.new(params[:answer])
  answer.user_id = current_user.id
  answer.question_id = params[:id]

  if answer.save
    if request.xhr?
      erb :'questions/_answer', layout: false, locals: {answer: answer }
    else
      redirect "/questions/#{params[:id]}"
      erb :'questions/:id'
    end
  else
    @errors = answer.errors.full_messages
    erb :'questions/:id'
  end
end

get '/questions/:question_id/answers/:answer_id/votes/new' do
  redirect "/questions/#{params[:question_id]}"
end

post '/questions/:question_id/answers/:answer_id/votes' do
  #change in vote migration
  if params[:status] == "upvote"
    params[:status] = true
  else
    params[:status] = false
  end

  answer = Answer.find(params[:answer_id])
  Vote.create(user_id: current_user.id, voteable: answer, status: params[:status])

  redirect "/questions/#{params[:question_id]}/answers/#{params[:answer_id]}/votes/new"
end

put '/questions/:question_id/answers/:answer_id/votes/:id' do
  answer = Answer.find(params[:answer_id])
  if params[:status] == "upvote"
    user_vote(answer).update_attributes(status: true)
  else
    user_vote(answer).update_attributes(status: false)
  end

  redirect "/questions/#{params[:question_id]}/answers/#{params[:answer_id]}/votes/:#{params[:id]}/edit"

  # if request.xhr?

  # else
  #   redirect '/questions'
  # end
end

get '/questions/:question_id/answers/:answer_id/votes/:id/edit' do
  redirect "/questions/#{params[:question_id]}"
end
