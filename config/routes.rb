Rails.application.routes.draw do
  
  devise_for :books
  
  root to: "homes#top"
  devise_for :users
  resources :books, only: [:new, :create, :index, :show]
  get "/homes/about" => "homes#about", as: "about"
end
