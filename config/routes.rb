Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "dashboard#index"

  get 'dashboard', to: 'dashboard#index'
  get 'index', to: 'static_pages#index'
  get 'sobre', to: 'static_pages#sobre'
  get 'contacto', to: 'static_pages#contacto'
  get 'work_groups_static', to: 'static_pages#work_groups_static'
  get 'entrar', to: 'sessions#new'
  post 'entrar', to: 'sessions#create'
  delete 'sair', to: 'sessions#destroy'

  resources :dashboard, only: [] do
    member do
      get 'results', defaults: { format: :json }
    end
  end
  resources :contacts
  resources :articles
  resources :users
  resources :user_groups 
  resources :companies
  resources :work_groups
  resources :annual_managements do
    member do
      get 'switch', defaults: { format: :json }
    end
  end
  resources :incomes
  resources :income_categories
  resources :expense_categories

  resources :expenses do
    collection do
      get 'monthly_expenses', defaults: { format: :json }
    end
  end

  resources :contracts
  resources :contract_statuses
  resources :currency_kinds
  resources :accounts
  resources :financial_statements
  resources :payment_installments

  get 'datatables/user_groups_table', defaults: { format: :json }
  get 'datatables/users_table', defaults: { format: :json }
  get 'datatables/annual_managements_table', defaults: { format: :json }
  get 'datatables/income_categories', defaults: { format: :json }
  get 'datatables/expense_categories', defaults: { format: :json }
  get 'datatables/incomes', defaults: { format: :json }
  get 'datatables/expenses', defaults: { format: :json }
  get 'datatables/expenses', defaults: { format: :json }
  get 'datatables/companies', defaults: { format: :json }
  get 'datatables/contract_statuses', defaults: { format: :json }
  get 'datatables/contracts', defaults: { format: :json }
  get 'datatables/currency_kinds', defaults: { format: :json }
  get 'datatables/accounts', defaults: { format: :json }
  get 'datatables/financial_statements', defaults: { format: :json }
  get 'datatables/payment_installments', defaults: { format: :json }

  get 'highcharts/results_total', defaults: { format: :json }
  get 'highcharts/results_partial', defaults: { format: :json }
end
