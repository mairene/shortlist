require 'yelp'

get '/' do
  erb :index
end

get '/searchresults' do
  p ENV['CONSUMER_KEY']
  client = Yelp::Client.new ({ :consumer_key => ENV['CONSUMER_KEY'],
                            :consumer_secret => ENV['CONSUMER_SECRET'],
                            :token => ENV['TOKEN'],
                            :token_secret => ENV['TOKEN_SECRET']
                            })

  options =  { term: 'restaurants',
              limit: 20,
              category_filter: params[:cuisine].downcase
            }

  response = client.search(params[:neighborhood].downcase, options)
  @businesses = response.businesses
  erb :search
end

#----------- SESSIONS -----------

get '/sessions/new' do
  # render sign-in page
  @user = User.new
  erb :sign_in
end

post '/sessions' do
  # sign-in
  p @user = User.where(email: params[:email]).take
  if @user.password_hash == params[:password]
    # successfully authenticated; set up session and redirect
    session[:user_id] = @user.id
    redirect '/'
  else
    # an error occurred, re-render the sign-in form, displaying an error
    @error = "Invalid email or password."
    erb :sign_in
  end
end

get '/sessions/:id' do
  # sign-out -- invoked via AJAX
  # return 401 unless params[:id].to_i == session[:user_id].to_i
  # session.clear
  # 200
  session[:user_id] = nil
  redirect '/'
end


#----------- USERS -----------

get '/users/new' do
  # render sign-up page
  @user = User.new
  erb :sign_up
end

post '/users' do
  # sign-up
  @user = User.new( username: params[:username],
                    name: params[:name],
                    email: params[:email])
  @user.password = params[:password]

  if @user.save
    # successfully created new account; set up the session and redirect
    session[:user_id] = @user.id
    redirect '/'
  else
    # an error occurred, re-render the sign-up form, displaying errors
    erb :sign_up
  end
end
