post '/questions/:id' do
  answer = Answer.new(params[:answer])
  answer.user_id = current_user.id
  answer.question_id = params[:id]

  if answer.save
    redirect "/questions/#{params[:id]}"
  else
    @errors = answer.errors.full_messages
    erb :'questions/:id'
  end
end

get '/questions/:question_id/answers/:id/votes' do
  answer = Answer.find(params[:id])
  vote = Vote.create(user_id: current_user.id, voteable: answer)
  redirect "/questions/#{params[:question_id]}"
end