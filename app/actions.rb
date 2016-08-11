# Homepage (Root path)
#REST guidelines specify should not nest more than two levels deep, e.g.
#GET /authors/:id/articles
#POST /authors/:id/articles
#GET /authors/:id/articles/new

#GET /users/:id
#GET /users/:id/teams

#DELETE/PUT/PATCH requests cannot be submitted by normal forms, must add modification - ref. Monica's lecture notes

helpers do
  def current_user
    @current_user = @current_user || User.find_by(id: session[:cookie_name])
  end

  def get_username(input)
    @get_username = User.find params(id: input.id)
      if @get_username[0]
        @get_username[0].username
    end
  end
end

get '/' do
  erb :index
end

get '/user/:id/?' do 
  @user = User.find params[:id]
  @team = Team.new
  erb :'user/index'
end

post '/login/?' do
  @user = User.where(username: params[:username]).where(password: params[:password])
    if @user.length > 0
      session[:cookie_name] = @user[0].id

      # flash[:notice] = "Thanks for logging in, #{@user[0].username}!"
      redirect '/user/'
    else 
      # flash[:notice] = "Incorrect username or password! Please try again."
      redirect '/user/'
    end
end

#TODO: implement RESTful principles
post '/new_team' do
  @team = Team.new(
    name: params[:name]
    )
  # binding.pry
  if @team.save
    new_team = current_user.pairings.create(team: @team)
    #below verifies whether the pairing was created correctly
    if new_team.persisted?
    #flash - thanks for creating a team
      redirect "/user/#{current_user.id}"
    else
      #flash - something went wrong
      redirect "/user/#{current_user.id}"
    end
  else
    erb :'user/index'
  end
end

get '/team/:team_id' do
  @team = Team.find params[:team_id]
  erb :'team/index'
end  
