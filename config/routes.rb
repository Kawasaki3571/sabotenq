Rails.application.routes.draw do



  resources :rollmodeltests
  resources :make_answears

  resources :make_questions do
  	
  end
  post 'questions' => 'makeq#create'

  # resources :questions do
  # end
  resources :root do
  end
  resources :makeq do
  end
  
  post 'questions' => 'makeq#create'

   get '/top' => 'root#top'

   # get '/posts/:id/edit' => 'posts#edit', as: 'edit_post'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
