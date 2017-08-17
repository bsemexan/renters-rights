Rails.application.routes.draw do
  root 'renters_rights#index'
  # reference: http://guides.rubyonrails.org/routing.html
  get '/faq', to: 'renters_rights#faq'
  get '/tpo', to: 'renters_rights#tpo_message'
  get '/renters', to: 'renters_rights#renters'
  post '/renters', to: 'renters_rights#renters_post'
  get '/not-applicable', to: 'renters_rights#not_applicable'
  get '/help-type', to: 'renters_rights#help_type'
  post '/help-type', to: 'renters_rights#help_type_post'
  get '/renters-reasons', to: 'renters_rights#renters_reasons'
  post '/renters-reasons', to: 'renters_rights#renters_reasons_post'
  get '/tenant-relocation', to: 'renters_rights#tenant_relocation'
  get '/eviction-resources', to: 'renters_rights#eviction_resources'
  get '/resources', to: 'renters_rights#resources'
  get '/tax-rate-area-get', to: 'renters_rights#tax_rate_area_get'
  get '/tax-rate-area-parse', to: 'renters_rights#tax_rate_area_parse'
end
