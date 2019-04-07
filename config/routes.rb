Rails.application.routes.draw do
  devise_for :users
  root to: "readers#index"
  get 'books/index'
  get 'books/show'
  get 'books/new'
  get 'books/edit'
  get 'books/search' =>'books#search' #, :controller=>'books_controller', :action=>'search'
  get 'bookshelves/index'
  get 'bookshelves/show'
  get 'bookshelves/new'
  get 'bookshelves/edit'
  resources :readers do
    resources :bookshelves do
      resources :books do
        get :search
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
