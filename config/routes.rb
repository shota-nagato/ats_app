Rails.application.routes.draw do
  devise_for :users

  authenticate :user do
    root to: "dashboard#show", as: :user_root
  end

  devise_scope :user do
    root to: "devise/sessions#new"
  end
end
