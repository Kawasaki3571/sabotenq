Rails.application.routes.draw do



  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'users/show'

  # devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_for :users,
  path: '',
  path_names: {sign_in: 'login', sign_out: 'logout', edit: 'profile', sign_up: 'registration'},
  controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations'
  }
  devise_scope :user do
      get '/users/sign_out' => 'users/sessions#destroy'
       # post '/registration' => 'users/registrations#create'
    # get '/sign_out' => 'users/sessions#destroy'
    # delete '/sign_out' => 'devise/sessions#destroy', as: :destroy_user_session
  end

  post 'questions' => 'makeq#create'

  # resources :questions do
  # end
  resources :root do
  end
  resources :makeq do
  end


  resources :question_lists, only: [:index, :show,:create, :update] do
     # resources :favorites, only: [:create, :destroy]
     # resources :answears, only: [:create, :update]
  end
  post '/question_lists/:id' => 'question_lists#create'

  get 'question_lists/:id/edit' => 'question_lists#edit', as: 'edit_answear'
  patch 'question_lists/:id/edit' => 'question_lists#update_answear', as: 'update_answear'


  get 'answears/:answear_id' => 'answears#show', as: "answears_kobetsu"
  post '/answears/:answear_id' => 'replies#create'
  delete '/answears/:answear_id' => 'replies#destroy'


  resources :question_lists, only: [:show,] do
    resource :favorites, only: [:create, :destroy]
  end

   post '/answears/:answear_id/favorites' => 'favorites#create', as: 'favorites'
   delete '/answears/:answear_id/favorites'=> 'favorites#destroy', as: 'favorites_cancel'

  # resources :question_list do

  # end

  root 'root#top'

  post 'questions' => 'makeq#create'

  # get '/index' => 'root/index'

   get '/top' => 'root#top'
   get 'rule' => 'root#rule'

   get '/' => 'root#top'

   get '/logout', to: 'sessions#destroy'

   resources :users, only: [:show]
   patch '/users/:id' => 'users#update'

   # get '/posts/:id/edit' => 'posts#edit', as: 'edit_post'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
