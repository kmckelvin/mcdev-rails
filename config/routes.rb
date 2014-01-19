Mcdev::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: "home#index"

  scope "/blog" do
    get "/:year/:month/:slug" => "blog#show", as: 'blog'
    get "/" => "blog#index", as: 'blogs'
  end
end
