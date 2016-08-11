# Homepage (Root path)
helpers do
  def current_user
    User.first
  end
end

get '/' do
  erb :index
end

get '/user/?' do 
  @user = current_user
  @team = Team.new
  erb :'user/index'
end

post '/create_team' do
  @team = Team.new(
    name: params[:name]
    )
  # binding.pry
  if @team.save
    current_user.pairings.create(team: @team)
    #flash - thanks for creating a team
    redirect '/user'
  else
    erb :'user/index'# 
  end

end
