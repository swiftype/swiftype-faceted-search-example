require 'swiftype'
require 'time'

Swiftype.api_key = 'YOUR_API_KEY'
Swiftype.endpoint = 'http://localhost:3000/api/v1'

client = Swiftype::Client.new
engine_name = 'e-commerce-store'
engine = client.create_engine(engine_name)
doc_type = client.create_document_type(engine_name,'products')
categories = [
  'Clothing',
  'Shoes',
  'Clothing Accessories',
  'Handbags, Wallets & Cases',
  'Jewelry',
  'Books',
  'DVDs & Movies',
  'Music',
  'Video Game Software'
]

(0..49).each do |i|
  price = rand(99).to_f + 0.99
  category = categories[rand(categories.size)]
  tags = ["tag#{rand(12)}", "tag#{rand(12)}"]
  month = (1..12).to_a[rand(11)]
  day = (1..28).to_a[rand(27)]
  date = Time.utc(2011, month, day, 01, 01, 01).iso8601
  doc = {
    :external_id => "#{i}",
    :fields => [
      {:name => 'title', :type => 'string', :value => "Product #{i}" },
      {:name => 'description', :type => 'text', :value => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam molestie tristique dolor, at ullamcorper ligula semper sit amet. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla sit amet nulla pretium felis varius semper vitae at neque. Sed sed dictum turpis, nec ullamcorper enim. Aliquam eget auctor turpis. Sed in eros iaculis, tristique arcu eu, pulvinar eros. Ut fermentum pellentesque odio non fermentum. Sed lacinia nisi ligula, at bibendum metus accumsan sit amet. Proin gravida, erat at tempus ornare, ipsum risus placerat diam, ut facilisis lectus lectus sit amet magna. Aliquam fermentum placerat massa, eu rhoncus nunc placerat non. Pellentesque sed pellentesque ipsum. Aenean et eros ultricies, scelerisque nulla dapibus, ultrices massa. Curabitur vulputate viverra condimentum. Praesent sed semper nibh, eget placerat felis. Sed pellentesque est ante, at feugiat eros ultricies ut. Nunc tellus enim, bibendum et sapien quis, commodo suscipit justo. Quisque blandit tempor nisl id laoreet. Donec ut porttitor diam, ut euismod sapien. Praesent magna felis, ultrices eu posuere vitae, adipiscing sit amet nisi. Donec quis laoreet ipsum. Pellentesque mollis malesuada placerat. Curabitur tristique est nec lobortis iaculis. Sed tincidunt nisl non facilisis bibendum. Duis at imperdiet erat. Nullam volutpat felis ut neque venenatis elementum. Morbi malesuada dui ut quam placerat sagittis. Phasellus mattis, magna eget malesuada hendrerit, neque enim facilisis massa, vitae posuere ante elit at odio. Curabitur ac diam ornare dui consequat pulvinar. Quisque a lorem tincidunt mauris pretium dignissim. Maecenas imperdiet magna eu aliquam pellentesque. Maecenas sit amet adipiscing urna. Ut eu augue sit amet est volutpat euismod et a lacus. Nam quam mi, mollis at adipiscing quis, condimentum eu massa. Aliquam sit amet nulla neque. Duis vehicula mauris et ligula dictum, a interdum dui sagittis. Vestibulum porttitor pretium dolor ac bibendum. Proin vestibulum ante nisi, nec sollicitudin nunc mattis a. Nulla facilisi. Proin tempor mi dapibus massa volutpat euismod. Vivamus feugiat nunc et consequat ornare. Vivamus dui massa, congue a ultricies a, blandit eu metus. Donec pellentesque tortor sit amet vestibulum tempor. Fusce dui tellus, congue vitae iaculis a, auctor ut enim. Integer blandit purus ante, quis tincidunt est ornare adipiscing. Sed consequat iaculis vestibulum. Donec eu neque nunc. Praesent ac purus vitae tellus imperdiet feugiat sollicitudin quis nulla. Sed convallis sed mi vitae bibendum. Mauris ultrices gravida est, id malesuada enim. Praesent vestibulum cursus dolor, ut dapibus arcu molestie eu. Vivamus ut placerat leo."},
      {:name => 'quantity', :type => 'integer', :value => rand(50) },
      {:name => 'category', :type => 'enum', :value => category },
      {:name => 'price', :type => 'float', :value => price },
      {:name => 'tags', :type => 'enum', :value => tags },
      {:name => 'published_on', :type => 'date', :value => date},
      {:name => 'url', :type => 'enum', :value => 'https://swiftype.com/documentation' },
    ]
  }
  client.create_document(engine_name,'products',doc)
end
