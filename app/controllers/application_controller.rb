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

  get '/registrations/signup' do #Renders the signup form.
    erb :'/registrations/signup'
  end

  post '/registrations' do #creates user, signs them in, redirects them.
    @user = User.new(name: params["name"], email: params["email"], password: params["password"])
    @user.save
    session[:id] = @user.id #This signs them in.
    redirect '/users/home'
  end

  get '/sessions/login' do #Renders the login form.
    erb :'sessions/login'
  end

  post '/sessions' do #grabs users info, comapres that against the DB
                      # and signs them in.
    @user = User.find_by(email: params["email"], password: params["password"])
    session[:id] = @user.id #This signs them in.
    redirect '/users/home'
  end

  get '/sessions/logout' do #logs user out by clearing the session hash.
    session.clear
    redirect '/'
  end

  get '/users/home' do #renders the users homepage
    @user = User.find(session[:id]) #finds current user based on his session id.
    erb :'/users/home'
  end

end
