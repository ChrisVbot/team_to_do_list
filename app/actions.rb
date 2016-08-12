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

get '/team/:team_id' do
  @team = Team.find params[:team_id]
  erb :'team/index'
end  


post '/team/:team_id/new%20list' do
  @team = Team.find params[:team_id]
  @list = List.new(
    title: params[:title]
    )
    @list.team_id = @team.id
    if @list.save
      #flash - team saved
      redirect "/team/#{@team.id}"
    else
      redirect "/team/#{@team.id}"
    end
end  

delete '/team/:list_id' do
  list = List.find params[:list_id]
  list.destroy
  redirect back
end

post '/team/:list_id/new' do
  @list = List.find params[:list_id]
  @task = Task.new(
    content: params[:content],
    list_id: params[:list_id]
    )
    if @task.save
      redirect back
    else
      redirect back
    end
end



