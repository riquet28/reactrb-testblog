Rails.application.routes.draw do
  devise_for :users
  mount ReactiveRecord::Engine => '/rr'

  root 'home#show'

end
