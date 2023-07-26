Rails.application.routes.draw do
  
    devise_for :users, skip: [:passwords], controllers: {
      #model
       registrations: "public/registrations",
       sessions: 'public/sessions'
       #fileの指定
    }
       
    scope module: :public do
        root to: "homes#top"
        get '/about' => "homes#about"
        resources :lists, only: [:new, :index, :show, :edit]
        resources :pan_images, only: [:new, :index, :show, :delete]
        resources :users, only: [:show, :edit, :update]
    end
    
    devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
       sessions: "admin/sessions"
    }
        #   get 'lists/new'
        #   get 'lists/index'
        #   get 'lists/show'
        #   get 'lists/edit'
    
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
