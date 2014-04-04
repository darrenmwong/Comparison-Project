Comparison::Application.routes.draw do
	resources :comparison
	devise_for :users, :path => "auth", :path_names => { :sign_in => 'login', :sign_out => 'logout', :password => 'secret', :confirmation => 'verification', :unlock => 'unblock', :registration => 'register', :sign_up => 'cmon_let_me_in' }

 root to: "comparison#index"

 # get 'comparison/index', to: 'comparison#index'

 get 'comparison/modalExample', to: 'comparison#modal'

 get 'comparison/moreInfo/compare', to: 'comparison#moreInfo'
end
