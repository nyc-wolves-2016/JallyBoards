get '/users/new' do
  prevent_user
  erb :'/users/new'
end

post '/users' do
  user = User.new(params[:user])
  if user.save
    redirect '/'
  else
    @error = "Username or email already exists."
    erb :'users/new'
  end
end

get '/users/login' do
  prevent_user
  erb :'/users/login'
end

post '/users/login' do
  user = User.find_by(email: params[:email])
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect '/'
  else
    @error = "Email or password was invalid."
    erb :'/users/login'
  end
end

get '/users/logout' do
  session[:user_id] = nil
  redirect '/'
end

get '/users/:id/profile' do
  @user = User.find(params[:id])
  erb :'users/profile'
end
