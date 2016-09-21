get '/ask' do
  erb :'/questions/new'
end

post '/ask' do

  redirect '/question/:id'
end
