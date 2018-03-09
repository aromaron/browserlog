Browserlog::Engine.routes.draw do
  root :to => 'logs#index'
  get '/changes.json', to: 'logs#changes', format: :json
end
