require 'erb'

def template_maker(payload)

  # Separate nested data structure for easy manipulation
  members={}
  restaurants={}
  members = payload[:members]
  restaurants = payload[:restaurant]

  @email =""
  @name =""
  @team =""
  @logo =""
  @restaurant_name =""
  @yelp =""

  #Create ERB variables for html templating
  #Loop through payload creating customized templates
  #Create new files
  members.each do |val|
    @name = "#{val[:name]}"
    @team = "#{val[:team]}"
    @email = "#{val[:email]}"
    @logo = "#{restaurants[:logo]}"
    @restaurant_name = "#{restaurants[:name]}"
    @yelp = "#{restaurants[:yelp_link]}"

    #Render template
    template = File.read('../views/template/template.html.erb')
    result = ERB.new(template).result(binding)

    #Write result to new file
    File.open("../views/template/#{@name}_#{@team}.html", 'w+') do |f|
      f.write result
    end
  end
end


content = {
"members": [
    {
        "email": "jill@mycompany.com",
        "name": "Jill",
        "team": "engineering"
    },
    {
        "email": "rohit@mycompany.com",
        "name": "Rohit",
        "team": "finance"
    },
    {
        "email": "maria@mycompany.com",
        "name": "Maria",
        "team": "operations"
    }
],
"restaurant": {
    "logo": "http://example.com/images/pizza.png",
    "name": "Pizza R Us",
    "yelp_link": "https://yelp.com/pizza-r-us"
}
}

template_maker(content)
