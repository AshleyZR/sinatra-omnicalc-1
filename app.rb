require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:square_page)
end

get ("/square/new") do
  number = params["number"].to_i
  redirect to("/square/results/#{number}")
  erb(:square_page)
end

get ("/square/results/:number") do
  @num = params["number"]
  @square = @num.to_f * @num.to_f
  erb(:square_result_page)
end

get("/square_root/new") do
  number = params["user_number"].to_i
  erb(:square_root_page)
  redirect to("/square_root/results/#{number}")
end

get("/square_root/results/:number") do
  @num = params["number"]
  @square_root = @num.to_f**0.5
  erb(:square_root_result_page)
end

get("/payment/new") do
  apr = params["user_apr"].to_i 
  years = params["user_years"].to_i
  pv = params['user_pv'].to_i
  erb(:payment_page)
  redirect to("/payment/results/#{apr}/#{years}/#{pv}")
end

get("/payment/results/:apr/:years/:pv") do
  @apr = (params['apr'].to_f)/100
  @years = params['years']
  @pv = params['pv'].to_f
  periods = @years * 12
  percentage_per_period = @apr/12
  numeratr = percentage_per_period * @pv
  denominatr = 1 - ((1+percentage_per_period.to_f)**(-periods.to_f))
  @payment = numeratr.to_f/denominatr.to_f
  erb(:payment_result_page)
end

