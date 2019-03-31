Rails.application.routes.draw do
  get 'bookshelves/index'
  get 'bookshelves/show'
  get 'bookshelves/new'
  get 'bookshelves/edit'
  resources :readers do
    resources :bookshelves
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
