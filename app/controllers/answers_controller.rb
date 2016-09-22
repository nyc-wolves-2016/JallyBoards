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

get '/questions/:question_id/answers/:id/votes' do
  answer = Answer.find(params[:id])
  if has_voted?(answer)
    if params[:status] == "upvote"
      user_vote(answer).update_attributes(status: true)
    else
      user_vote(answer).update_attributes(status: false)
    end
  else
    vote_status = params[:status]
    if vote_status == "upvote"
      vote_status = true
    else
      vote_status = false
    end
    Vote.create(user_id: current_user.id, voteable: answer, status: vote_status)
  end
  redirect "/questions/#{params[:question_id]}"
end
