Rails.application.routes.draw do

  devise_for :educators
  authenticated :educator do
    root to: 'educators#homepage', as: 'educator_homepage'
  end
  get '/educators/reset'=> 'educators#reset_session_clock'
  get '/educators/services_dropdown/:id' => 'educators#names_for_dropdown'

  devise_scope :educator do
    root to: "devise/sessions#new"
  end

  get 'no_homeroom' => 'pages#no_homeroom'
  get 'no_homerooms' => 'pages#no_homerooms'
  get 'not_authorized' => 'pages#not_authorized'

  get '/students/names' => 'students#names'
  resources :students, only: [:show] do
    resources :event_notes, only: [:create, :update]
    member do
      get :sped_referral
      post :event_note # DEPRECATED. Use `POST /students/:student_id/event_notes` instead.
      post :service
    end
  end
  resources :services, only: [:destroy]

  resources :homerooms, only: [:show]

  resources :schools, only: [:show] do
    get :star_reading, on: :member
    get :star_math, on: :member
  end
end
