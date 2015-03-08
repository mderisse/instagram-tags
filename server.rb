require 'sinatra'
require 'HTTParty'
require 'json'

get '/' do
  images = []
  erb :index, locals: {url: images}
end



get '/click' do
  response = HTTParty.get("https://api.instagram.com/v1/tags/" + params[:name] + "/media/recent?client_id=427c4373d9cc437b8cdee15749e0cbff")
  tag = params[:name]
  data = response['data']
  puts data.length
  images = []
  data.each do |x|
      y = x['images']['standard_resolution']['url']
      puts
      images.push(y)
  end
  puts images
  erb :index, locals: {url: images, tag: tag}
end
