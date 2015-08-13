Rails.application.routes.draw do
  
  get 'tweets/index'

  get 'search/index'

  get 'keywords/index'

  get 'home/index'

  #Homepage
  root 'home#index'

  #Search
  get '/search' => 'search#index'

  #Keywords
  get '/keywords' => 'keywords#index'

  #Tweets
  get '/keywords/:keyword_id/tweets'  => 'tweets#index', as: 'tweets'
  
end
