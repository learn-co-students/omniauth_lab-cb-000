Rails.application.routes.draw do
  # Add your routes here
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]

  get '/home', to: 'welcome#home'
  root to: 'welcome#home'
end
