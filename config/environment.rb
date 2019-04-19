# Load the Rails application.
require_relative 'application'
Date::MONTHNAMES = [nil] + %w(Janeiro Fevereiro Março Abril Maio Junho Julho Agosto Setembro Outubro Novembro Dezembro)

# Initialize the Rails application.
Rails.application.initialize!
