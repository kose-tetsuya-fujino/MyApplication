require 'mysql2'

host = 'mydb1.c5wzo5irqbqc.ap-northeast-1.rds.amazonaws.com'
username = 'udemy'
password = '!Qazxsw2'
database = 'ecsite'

client = Mysql2::Client.new(host: host, username: username, database: database, password: password)

results = client.query('SELECT COUNT(*) FROM users LIMIT 3')

results_arr = results.to_a
p results_arr[0]["COUNT(*)"]