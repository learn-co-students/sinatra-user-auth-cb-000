class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :views, Proc.new { File.join(root, "../views/") }

  configure do
    enable :sessions
    set :session_secret, "secret"
  end

  # This is our homepage where we can login and signup
  get '/' do
    erb :home
  end

  # This is where we can signup and create new accounts
  get '/registrations/signup' do
    erb :'/registrations/signup'
  end

  # After registering an account the /registrations
  # controller creates a record in our database
  # with the information given by the user.
  # it is then redirected to the users homepage.
  post '/registrations' do
    @user = User.create(name: params[:name], email: params[:email], password: params[:password])
    session[:id] = @user.id   # session[:id] is saved so that our website will know the current user
                              # on every page.

    redirect '/users/home'    # redirects to the user/homepage
  end

  # Our login page takes the users information and sends it to our
  # sessions controller.
  get '/sessions/login' do
    erb 'sessions/login'.to_sym
  end

  # Our sessions controller verifies if our user is an existing user
  # or not.
  post '/sessions' do
    @user = User.find_by(email: params[:email], password: params[:password])

    if @user == nil
      redirect '/sessions/login'
    else
      session[:id] = @user.id
      redirect '/users/home'
    end
  end

  # Our logout session sends the user back to the homepage
  get '/sessions/logout' do
    redirect '/'
  end

  # Our homepage takes the session[:id] information and creates
  # a user hompage with the current user thats singed in.
  get '/users/home' do
    @user = User.find(session[:id])
    erb '/users/home'.to_sym
  end

  # If our users account doesn't exist it redirects in this route.
  get '/unknown' do
    "That user doesn't exist"
  end
end
