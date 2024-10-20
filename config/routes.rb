Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

   get 'hello/index' => 'hello#index'
   get 'hello/link' => 'hello#link'

   get 'tweets' => 'tweets#index'


  resources :perfumes
  resources :chats
  resources :sentences
  resources :interpretations
  resources :words
  resources :languages
  resources :terms
  resources :grammars
  resources :texts
  resources :commons
  
  resources :comments, only: [:create]

  root 'perfumes#index'

end
