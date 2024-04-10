require 'sinatra'
require 'sinatra/cookies'
require 'erb'

helpers do
  def read_data
    request.body.rewind # in case someone already read it
    JSON.parse request.body.read
  end

end

get '/get' do
  'This is a get request without parameters'
end

get '/get/:param' do
  "This is a get request with a paramenter. Parameter: #{params[:param]}"
end

get '/query-string' do
  title = params['title']
  author = params['author']

  "Book: #{title} from #{author}"
end

post '/post' do
  read_data.to_json
end

post '/create' do
  data = read_data

  author = data['author']
  title = data['title']

  [
    201,
    "You created a new Book: #{author} - #{title}"
  ]
end

put '/edit' do
  data = read_data

  author  = data['author']
  title  = data['title']

  [
    200,
    "You edited a Book: #{author} - #{title}"
  ]
end

delete '/delete/:id' do
  data = read_data

  204
end

get '/redirect' do
  redirect 'http://google.com'
end

get '/set-cookie' do
  value = params['cookie']
  cookies[:something] = value

  "O valor do cookie 'something' é: #{value}"
end

get '/read-cookie' do
  "value: #{cookies[:something]}"
end

get '/set-custom-headers' do
  status  200
  headers \
    'Authorization' => 'Bearer somejwtoken'
  body "You're authorized"
end

get '/about' do

  @name = 'Vitor Siqueira'

  @social_media = {
    'Linkedin': "https://www.linkedin.com/in/vitor-siqueira-50b800181/",
    'Github': "https://github.com/VitorSiqueirr",
    'Instagram': "https://www.instagram.com/vitor_siqueira_25/",
    'Twitter': "https://twitter.com/vitor_siqueirr"
  }
  @skills = {
    'Front-End': ['HTML/CSS', 'JavaScript', 'TypeScript', 'React', 'Angular'],
    'Back-End': ['Java', 'C/C++', 'C#', 'Ruby']
  }

  ERB.new(File.read('view/about.html.erb')).result(binding)
end
