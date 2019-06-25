require 'sinatra'
require 'googlebooks'

get '/' do
  erb :home
end

post '/' do
  query = params[:query]
  books = GoogleBooks.search(query, {:count => 8})
  if books.total_items != 0
    erb :results, :locals => {'books' => books}
  else
    erb :error, :locals => {'query' => query}
  end
end
