Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  devise_scope :user do
    root 'devise/sessions#new'
  end
end
