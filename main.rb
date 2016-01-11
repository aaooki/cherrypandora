get '/' do
	@time = 130
  erb :index
end

get '/timer.js' do
  content_type "text/javascript"
  coffee :'coffee/timer'
end
