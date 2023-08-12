require 'sinatra'
require 'sinatra/reloader'
require 'mysql2'

register Sinatra::Reloader

get '/' do
    @number = rand(10)
    erb :index
end

get '/goodbye' do
    erb :goodbye
end

get '/users' do
    host = 'mydb1.c5wzo5irqbqc.ap-northeast-1.rds.amazonaws.com'
    username = 'udemy'
    password = '!Qazxsw2'
    database = 'ecsite'

    client = Mysql2::Client.new(host: host, username: username, database: database, password: password)

    result = client.query("SELECT COUNT(*) FROM users")
    @users_count = result.to_a[0]['COUNT(*)']
    erb :users
end

post '/register' do
    host = 'mydb1.c5wzo5irqbqc.ap-northeast-1.rds.amazonaws.com'
    username = 'udemy'
    password = '!Qazxsw2'
    database = 'ecsite'

    client = Mysql2::Client.new(host: host, username: username, database: database, password: password)

    name = params[:name]
    email = params[:email]
    birthday = params[:birthday]
    gender = params[:gender]
    
    client.query("INSERT INTO users (name, email, birthday, gender) VALUES ('#{name}', '#{email}', '#{birthday}', #{gender})")
    redirect "/users"
end