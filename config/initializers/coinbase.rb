Rails.configuration.coinbase = {
  :api_key => ENV['COINBASE_API_KEY'],
  :button_id => ENV['COINBASE_BUTTON_ID']
}

#FIXME Coinbase.api_key = Rails.configuration.coinbase[:api_key]
