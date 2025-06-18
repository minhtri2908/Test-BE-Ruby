Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  namespace :api do
  root to: "base#index"
  get 'student_scores/lookup/:sbd', to: 'student_scores#lookup'
  get 'student_scores/report', to: 'student_scores#report'
  get 'student_scores/statistics', to: 'student_scores#statistics'
  get 'student_scores/top_block_a', to: 'student_scores#top_block_a'
  end

  # Defines the root path route ("/")
  # root "posts#index"
end
