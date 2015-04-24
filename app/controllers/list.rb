get '/lists' do
  @user = User.find(session[:user_id])
  @lists = @user.lists
  erb :'lists/show'
end

post '/lists/trash' do
  p 'it got to server'
  p request
  @list = List.create(cuisine: params["cuisine"],
                      neighborhood: params["neighborhood"],
                      trash: true,
                      user_id: session[:user_id])

  @restaurant = Restaurant.create(name: params["name"],
                                  image_img: params["image_img"],
                                  rating_img: params["rating_img"],
                                  url: params["url"])

  @selection = Selection.create(restaurant_id: @restaurant.id,
                                list_id: @list.id
                                )

  if request.xhr?
    {list: @list, restaurant: @restaurant, selection: @selection}.to_json
  else
    redirect '/'
  end
end

post '/lists/gold' do
  p 'it got to server'
  p request
  @list = List.create(cuisine: params["cuisine"],
                      neighborhood: params["neighborhood"],
                      gold: true,
                      user_id: session[:user_id])

  @restaurant = Restaurant.create(name: params["name"],
                                  image_img: params["image_img"],
                                  rating_img: params["rating_img"],
                                  url: params["url"])

  @selection = Selection.create(restaurant_id: @restaurant.id,
                                list_id: @list.id
                                )

  if request.xhr?
    {list: @list, restaurant: @restaurant, selection: @selection}.to_json
  else
    redirect '/'
  end
end
