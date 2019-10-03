Rails.application.routes.draw do
  root to: 'main#index'
  get '/opponent', to: 'main#opponent'
  post '/opponent', to: 'main#opponent'
  post '/price', to: 'main#price'
  post '/result', to: 'main#result'
  get '*unmatched_route', to: redirect { '/' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
