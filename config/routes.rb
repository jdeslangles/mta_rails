Mta::Application.routes.draw do

  get '/', to: 'home#home'
  get'/choice', to: 'home#result'
  root to: 'home#home'


end