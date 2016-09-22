def upvote_count(post)
  up_votes = 0
  post.votes.each { |vote| up_votes += 1 if vote.status == true }
  up_votes
end

def downvote_count(post)
  down_votes = 0
  post.votes.each { |vote| down_votes += 1 if vote.status == false }
  down_votes
end