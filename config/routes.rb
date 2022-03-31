Rails.application.routes.draw do
  mount ShopifyApp::Engine, at: '/'

  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => 'home#index'
  get '/products', :to => 'products#index'
end
