# Homepage (Root path)
get '/' do
  erb :index
end

get '/user' do 
  @user = User.first
  erb :'user/index'
end