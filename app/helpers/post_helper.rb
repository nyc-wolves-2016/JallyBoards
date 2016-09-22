def vote_count(post)
  votes = 0
  post.votes.each do |vote|
    if vote.status == true
      votes += 1
    else
      votes -= 1
    end
  end
  votes
end