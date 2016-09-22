def vote_count(question)
  votes = 0
  question.votes.each do |vote|
    if vote.status == true
      votes += 1
    else
      votes -= 1
    end
  end
  votes
end