Rails.application.routes.draw do
  
  #Homepage
  root 'home#index'

  #Search
  get '/search' => 'search#index'

  #Keywords
  get '/keywords' => 'keywords#index'

  #Tweets
  get '/keywords/:keyword_id/tweets'  => 'tweets#index', as: 'tweets'
  
end
