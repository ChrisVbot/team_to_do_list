# Homepage (Root path)
#REST guidelines specify should not nest more than two levels deep, e.g.
#GET /authors/:id/articles
#POST /authors/:id/articles
#GET /authors/:id/articles/new

#GET /users/:id
#GET /users/:id/teams

#DELETE/PUT/PATCH requests cannot be submitted by normal forms, must add modification - ref. Monica's lecture notes

#Can have multiple inputs when POSTing, e.g. from James' lecture. Good for to-do list to add multiple things

helpers do
  def current_user
    current_user = current_user || User.find_by(id: session[:user_id])
  end
  
  def admin
    admin = admin || User.find_by(id: session[:admin])
  end

end


get '/' do
  erb :index
end

get '/user/:id/?' do 
  @user = User.find params[:id]
  @team = Team.new
  session[:user_id] = @user.id
  erb :'user/index'
end

post '/user/:id/new' do
  user = User.find params[:id]
  @team = Team.new(name: params[:name])
  # binding.pry
  if @team.save
    new_team = user.pairings.create(team: @team)
    if new_team.persisted?
      flash[:notice] = "Thanks for creating a new team!"
      redirect "/user/#{user.id}"
    end
  else
      flash[:notice] = "Something went wrong. Try again"
      redirect back 
  end
end


get '/team/:team_id' do
  @team = Team.find params[:team_id]
  erb :'team/index'
end  


post '/team/:team_id/new_list' do
  @team = Team.find params[:team_id]
  @list = List.new(
    title: params[:title],
    user_id: current_user.id
    )
    @list.team_id = @team.id
    if @list.save
      flash[:notice] = "New list created"
      redirect "/team/#{@team.id}"
    else
      redirect "/team/#{@team.id}"
    end
end  

delete '/team/:list_id' do
  list = List.find params[:list_id]
  if 
    list.destroy
    redirect back
  else
    redirect back
  end
end

post '/team/:list_id/new' do
  @list = List.find params[:list_id]
  @task = Task.new(
    content: params[:content],
    list_id: params[:list_id],
    user_id: current_user.id
    )
    if @task.save
      redirect back
    else
      redirect back
    end
end

post '/team/:list_id/complete' do
  @list = List.find params[:list_id]
  @list.complete = true
  if @list.save
    redirect back
  else
    redirect back
  end
end

delete '/team/:task_id/delete' do
  @task = Task.find params[:task_id]
  if @task.destroy
    redirect back
  else
    redirect back
  end
end

post '/team/:task_id/check' do
  @task = Task.find params[:task_id]
  @task.complete = params[:complete]
  @task.completed_by = current_user.username
  @task.completion_date = DateTime.now
  if @task.save
    redirect back
  else
    redirect back
  end
end

post '/team/:task_id/priority' do
  task = Task.find params[:task_id]
  task.priority = true
  task.date_priority_assigned = DateTime.now
  if task.save
    redirect back
  else
    redirect back
  end
end


post '/team/:team_id/new_member' do
  team = Team.find params[:team_id]
  new_team_member = User.where(username: params[:username])
    if new_team_member[0] == nil
      flash[:notice] = "User not found"
      redirect "/team/#{team.id}"
    elsif team.users.ids.include? new_team_member[0].id
      flash[:notice] = "#{new_team_member[0].username} is already on this team!"
      redirect "/team/#{team.id}"
    elsif new_team_member[0].pairings.create(team: team)
      flash[:notice] = "#{new_team_member[0].username} has been added to the team"
      redirect "/team/#{team.id}"
    else
      redirect "team/#{team.id}"
  end
end

get '/admin/?' do 
  admin = User.first
  session[:admin] = admin.id
  erb :'admin/index'
end

