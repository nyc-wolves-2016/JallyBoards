get '/questions/new' do
  erb :'/questions/new'
end

post '/questions' do

  redirect '/questions/:id'
end
