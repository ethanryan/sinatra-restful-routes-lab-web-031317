class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # get '/' do
  #   erb :index
  # end

  #above was given to me, below is my additions:

  #index controller action, to show all recipes:
  get '/recipes' do #now http://localhost:9393/recipes is my index page.
    @recipes = Recipe.all #show all recipes
    erb :index #index.erb page shows us our all our recipes
  end

#########

# In the application_controller.rb, set up a controller action
# that will render a form to create a new recipe.
# This controller action should create and save
# this new recipe to the database.

  #new recipe form controller action:
####need this to be ABOVE show page '/recipes/:id'
  get '/recipes/new' do
    erb :new
  end

  #create controller action:
  #create a new blog recipe with Post.create(params) and post it to /posts
  post '/recipes' do
    @recipe = Recipe.create(params) #create ActiveRecord method creates and saves new instance to database
    #erb :index #index shows us our blog post
    redirect to "/recipes/#{@recipe.id}"
  end

  ##########

  #show page controller action:
  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id]) #find this recipe
    erb :show #show.erb page shows us one recipe, corresponding to its id
  end

  #########

  #update page controller action, which updates edits made via an edit form:
  patch '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.update(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    #@recipe.update(params)
    erb :show #show.erb page shows us one recipe, corresponding to its id
    #redirect to("/recipes/#{@recipe.id}")
    #redirect "/recipes/#{@recipe.id}"
  end

  #edit page controller action, which responds with an HTML form that allows edits:
  get '/recipes/:id/edit/?' do #adding /? to the end, saw someone else did this...
    @recipe = Recipe.find(params[:id])
    erb :edit #this needs to render our edit.erb page
  end

#########

  #delete action, to delete a specific recipe:
  delete '/recipes/:id/delete' do
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    erb :delete #index.erb page shows us our all our recipes
  end

end #end class


# Again in the application_controller.rb, create a controller action
# that uses RESTful routes to display a single recipe.
#
# Create a third controller action that uses RESTful routes
# and renders a form to edit a single recipe.
# This controller action should update the entry
# in the database with the changes, and then
# redirect to the recipe show page.
#
# Create a controller action (index action) that
# displays all the recipes in the database.
#
# Add to the recipe show page a form that allows
# a user to delete a recipe. This form should
# submit to a controller action that deletes
# the entry from the database and redirects to the index page.
