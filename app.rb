require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:square_page)
end

get ("/square/new") do
  erb(:square_page)
end

get ("/square/results") do
  @num = params["number"]
  @square = @num.to_f * @num.to_f
  erb(:square_result_page)
end

get("/square_root/new") do
  erb(:square_root_page)
end

get("/square_root/results") do
  @num = params["user_number"]
  @square_root = @num.to_f**0.5
  erb(:square_root_result_page)
end

get("/payment/new") do
  erb(:payment_page)
end

get("/payment/results") do
  @apr = (params['user_apr'].to_f)
  @years = params['user_years'].to_i
  @pv = params['user_pv'].to_f
  periods = @years * 12
  percentage_per_period = (@apr/12)/100
  numeratr = percentage_per_period * @pv
  denominatr = 1 - ((1+percentage_per_period.to_f)**(-periods.to_f))
  @payment = numeratr.to_f/denominatr.to_f
  erb(:payment_result_page)
end

get("/random/new") do
  erb(:random_page)
end

get("/random/results") do
  @mini = params['user_min'].to_f
  @maxi = params['user_max'].to_f
  @rand = rand(@mini..@maxi)
  erb(:random_result_page)
end
  
