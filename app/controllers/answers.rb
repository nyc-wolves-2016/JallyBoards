post '/questions/:id/answer' do
  answer = Answer.new(params[:answer])
  answer.user_id = 1
  answer.question_id = params[:id]

  if answer.save
    redirect '/questions/#{params[:id]}'
  else
    @errors = answer.errors.full_messages
    erb :'questions/:id'
  end
end
