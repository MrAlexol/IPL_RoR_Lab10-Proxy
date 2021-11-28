Rails.application.routes.draw do
  root 'negotiator#input'

  get 'negotiator/input'
  get 'negotiator/view'
  get 'negotiator/rawview'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
