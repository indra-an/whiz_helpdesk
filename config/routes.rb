Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  concern :deleteable do
    get :delete, on: :member
  end

  devise_for :users, skip: [:registrations]
  as :user do
    get "users/edit" => "devise/registrations#edit", :as => "edit_user_registration"
    put "path/:id" => "devise/registrations#update", :as => "user_registration"
  end

  resources :users, concerns: :deleteable
  resources :tickets do
    get :delete, on: :member
    post :post_reply, on: :member
  end

  root to: "dashboards#index"
end
