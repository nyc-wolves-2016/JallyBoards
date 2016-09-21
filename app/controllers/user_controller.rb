get '/users/register' do
  prevent_user
  erb :'/users/register'
end

post '/users/register' do
  user = User.new(params[:user])
  if user.save
    session[:user_id] = user.id
    redirect "/users/#{user.id}/profile"
  else
    @errors = user.errors.full_messages
    erb :'users/register'
  end
end

get '/users/login' do
  prevent_user
  erb :'/users/_login'
end

post '/users/login' do
  user = User.find_by(email: params[:email])
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect '/'
  else
    @errors = ['Email or password was invalid']
    erb :'/users/_login'
  end
end

get '/users/logout' do
  session.clear
  redirect '/'
end

get '/users/:id/profile' do
  @user = User.find(params[:id])
  @top_voted_questions = @user.questions.sort_by {|question| question.votes}
  erb :'users/profile'
end
