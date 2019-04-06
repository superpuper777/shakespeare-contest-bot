Rails.application.routes.draw do
  post '/quiz',  to: 'quiz#create'
end
