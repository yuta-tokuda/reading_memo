Rails.application.routes.draw do
  root to: 'top#index'

  resources :books do
    collection do
      match :index, via: %i[get post]
      match 'create_new', to: 'books#create', via: 'post'
    end
  end

  resources :memos do
    collection do
      match :index, via: %i[get post]
      match 'create_new', to: 'memos#create', via: 'post'
    end
  end
end
