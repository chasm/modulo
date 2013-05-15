Modulo::Application.routes.draw do
  scope 'api' do
    resources :users, :except => [ :new, :edit, :create ], defaults: { format: :json }
  end

  get "uuids" => "site#uuids", format: :json, as: :uuid
  get "uuids/:num" => "site#uuids", format: :json, as: :uuids

  root :to => 'site#index'
end
