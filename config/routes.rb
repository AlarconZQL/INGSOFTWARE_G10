Rails.application.routes.draw do


  get 'levels/index'
  post 'levels/create'
  get 'levels/delete'
  get 'levels/update'



  resources :questions
  get 'users/index'
  post 'users/create'

  get 'sessions/index'

  root 'questions#index'

  get 'questions/index'
  post 'questions/create'
  get 'questions/update'

  get 'questions/show'
  get 'users/show'
  get 'users/update'

  post 'sessions/create'

  get 'sessions/destroy'

  get 'labels/index'


  post 'labels/create'

  post 'questions_comments/create'
  post 'answers_comments/create'
  post 'answers/create'
  post 'cars/create'
  post 'cats/create'
  post 'dogs/create'
  post 'cows/create'

  get 'labels/delete'
  get 'labels/update'
  
  get 'faculties/index'
  get 'faculties/delete'
  post 'faculties/create'
  get 'faculties/update'
  get 'faculties/show'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
