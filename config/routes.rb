Rails.application.routes.draw do
  namespace :cyber_led do
    get :status
    post :power, :brightness, :temperature, :mode
  end
end
