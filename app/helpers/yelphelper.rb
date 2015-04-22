require 'yelp'

helpers do
  @client = Yelp::Client.new({ consumer_key: 'CV9slE8x1MwJ9YzDlvzpOw',
                            consumer_secret: 'o8wTElEqtDrRJaxXWLQBuGaNXSE',
                            token: 'JyiHDvNHfeDffFSksyoSyKPKqZnWZXpM',
                            token_secret: 'yNqjYI3itCyC8SDE5HR4lD5PqeM'
                          })


  @params = { term: 'restaurants',
           limit: 10,
           category_filter: 'breakfast_brunch'
         }

end
# response = client.search('San Francisco', params)
# p response.keys
# p response.businesses
# p response.businesses[0]
# p response.businesses[0].name
# p response.businesses[0].image_url
