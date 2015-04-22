# require 'oauth'
# require 'rubygems'
# require 'json'

# consumer_key = 'CV9slE8x1MwJ9YzDlvzpOw'
# consumer_secret = 'o8wTElEqtDrRJaxXWLQBuGaNXSE'
# token = 'JyiHDvNHfeDffFSksyoSyKPKqZnWZXpM'
# token_secret = 'yNqjYI3itCyC8SDE5HR4lD5PqeM'

# api_host = 'api.yelp.com'

# consumer = OAuth::Consumer.new(consumer_key, consumer_secret, {:site => "http://#{api_host}"})
# access_token = OAuth::AccessToken.new(consumer, token, token_secret)

# path = "/v2/search?term=restaurants&location=new%20york"

# p JSON.parse(access_token.get(path).body)
