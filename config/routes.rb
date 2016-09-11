Rails.application.routes.draw do
  mount ReactiveRecord::Engine => '/rr'

  devise_for :users

  root 'home#show'

end
