def current_user
  User.find_by(id: session[:user_id])
end

def logged_in?
  !!current_user
end

def require_user
  redirect '/users/login' unless logged_in?
end

def prevent_user
  redirect '/' if logged_in?
end
