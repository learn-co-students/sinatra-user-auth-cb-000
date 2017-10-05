class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :views, Proc.new { File.join(root, "../views/") }

  configure do
    enable :sessions
    set :session_secret, "secret"
  end

  get '/' do
    erb :home
  end

  get '/registrations/signup' do
    # Render sign-up form view
    erb :'/registrations/signup'
  end

  post '/registrations' do
    # create new user from params hash, sign in, redirect to user home page
    @user = User.new(name: params['name'], email: params['email'], password: params['password'])
    @user.save

    session[:id] = @user[:id]
    redirect '/users/home'
  end

  get '/sessions/login' do
    # render login form
    erb :'sessions/login'
  end

  post '/sessions' do
    # login post, match params to db user object, sign in
    @user = User.find_by(email: params['email'], password: params['password'])
    session[:id] = @user.id
    redirect '/users/home'
  end

  get '/sessions/logout' do
    # clear session hash, redirect to index
    session.clear
    redirect '/'
  end

  get '/users/home' do
    # render user home page view
    @user = User.find(session[:id])
    erb :'/users/home'
  end

end
