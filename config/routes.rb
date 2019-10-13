Rails.application.routes.draw do
  # Team path
  get   'team/new',   to: 'teams#new',    as: 'new_team'
  post  'team/new',   to: 'teams#create', as: 'create_team'
  get   'team/:uid',  to: 'teams#show',   as: 'team'

  # Member path
  get   'member/new', to: 'members#new',    as: 'new_member'
  post  'member/new', to: 'members#create', as: 'create_member'
  get   'member/:id', to: 'members#show',   as: 'member'

  root to: 'common#index'
end
