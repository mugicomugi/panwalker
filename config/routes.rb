Rails.application.routes.draw do
  
    scope module: :public do
    get '/about' => "homes#about"
    root to: "homes#top"
    resources :lists, only: [:new, :index, :show, :edit]
    resources :pan_images, only: [:new, :index, :show, :delete]
    resources :user, only: [:show, :edit, :update]
    end
       devise_for :user, skip: [:passwords], controllers: {
          #model
           registrations: "public/registrations",
           sessions: 'public/sessions'
           #fileの指定
          }
       
     
       devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
           sessions: "admin/sessions"
          }
        #   get 'lists/new'
        #   get 'lists/index'
        #   get 'lists/show'
        #   get 'lists/edit'
    
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
