Modulo::Application.routes.draw do
  get "site/uuids"

  root :to => 'site#index'
end
