get '/lists/trash' do
  @user = User.find(session[:user_id])
  @trash_lists = @user.lists.where(trash: true)
  erb :'/lists/trash'
end

get '/lists/gold' do
  @user = User.find(session[:user_id])
  @gold_lists = @user.lists.where(gold: true)
  erb :'/lists/gold'
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

get '/lists/:id' do
  @list = List.find(:id)
  @user = User.find(id: params[:user_id])
  erb :'/lists/show'
end
