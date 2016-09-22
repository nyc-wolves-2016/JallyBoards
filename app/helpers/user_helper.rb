def current_user
  User.find_by(id: session[:user_id])
end

def logged_in?
  !!current_user
end

def current_user_id
  user = User.find_by(id: session[:user_id])
  user.nil? ? nil : user.id
end

def require_user
  redirect '/users/login' unless logged_in?
end

def prevent_user
  redirect '/' if logged_in?
end

def has_voted?(post)
  current_user.votes.find_by(voteable_id: post.id)
end

def display_vote_option(post)
  post_vote = current_user.votes.find_by(voteable_id: post.id)
  if post_vote.status == true
    #display button for option user hasn't chosen yet
    return "downvote"
  else
    return "upvote"
  end
end

def user_vote(post)
  current_user.votes.find_by(voteable_id: post.id)
end
