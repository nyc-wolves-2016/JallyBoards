post '/comment' do
  comment = Comment.new(params[:comment])
  comment.user_id = 1
  
end
