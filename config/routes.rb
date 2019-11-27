Rails.application.routes.draw do
  # Team path
  get     'teams/new',            to: 'teams#new',      as: 'new_team'
  post    'teams/new',            to: 'teams#create',   as: 'create_team'
  get     'teams/:uid/edit',      to: 'teams#edit',     as: 'edit_team'
  patch   'teams/:uid/edit',      to: 'teams#update',   as: 'update_team'
  get     'teams/:uid',           to: 'teams#show',     as: 'team'
  delete  'teams/:uid',           to: 'teams#destroy',  as: 'destroy_team'
  get     'teams/:uid/exercise',  to: 'teams#exercise', as: 'exercise'

  # Member path
  get     'members/new',        to: 'members#new',      as: 'new_member'
  post    'members/new',        to: 'members#create',   as: 'create_member'
  get     'members/:uid/edit',  to: 'members#edit',     as: 'edit_member'
  patch   'members/:uid/edit',  to: 'members#update',   as: 'update_member'
  get     'members/:uid',       to: 'members#show',     as: 'member'
  delete  'members/:uid',       to: 'members#destroy',  as: 'destroy_member'

  # Drucker Exercise path
  get 'druckers',           to: 'druckers#index', as: 'druckers'
  get 'druckers/:id/edit',  to: 'druckers#edit',  as: 'edit_drucker'

  # Common path
  get 'terms',    to: 'common#tos', as: 'tos'
  get 'privacy',  to: 'common#pp',  as: 'pp'

  root to: 'common#index'
end
