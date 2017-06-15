Rails.application.routes.draw do

  get 'welcom/contact'

  get 'welcome/index'

  get 'welcome/about'

  root 'welcome#index'

end
