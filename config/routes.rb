Rails.application.routes.draw do
  devise_for :books
  devise_for :users
  root to: "homes#top"
  get "/homes/about" => "homes#about", as: "about"
end
