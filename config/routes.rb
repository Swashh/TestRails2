Rails.application.routes.draw do
  resources :categories do
    resources :comments, :posts
  end

end
