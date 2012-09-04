Spree::Core::Engine.routes.append do
  namespace :admin do
    match 'invoice/:id(/:template)' => 'invoice#show'
  end
end
