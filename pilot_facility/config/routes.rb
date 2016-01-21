Rails.application.routes.draw do
  root 'run#dashboard'
  get 'add_run' => 'run#add_run'
  post 'add_run' => 'run#confirm_run_add'
  get 'schedule' => 'run#schedule'
  post 'update_run' => 'run#update_run'
  post 'confirm_run_update' => 'run#confirm_run_update'
  get 'search' => 'run#search'
  post 'search' => 'run#search_results'
  get 'data_results' => 'datapoint#results'
  get 'update_data' => 'datapoint#update_data'
  post 'update_data' => 'datapoint#confirm_data_update'
  get 'add_data' => 'datapoint#add_data'
  post 'add_data' => 'datapoint#confirm_data_add'
end
