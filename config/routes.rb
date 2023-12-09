Rails.application.routes.draw do
  devise_for :users
  root to: "lists#index"
  # Routes for the Recipe resource:

  # CREATE
  post("/insert_recipe", { :controller => "recipes", :action => "create" })
          
  # READ
  get("/recipes", { :controller => "recipes", :action => "index" })
  
  get("/recipes/:path_id", { :controller => "lists", :action => "show" })
  
  # UPDATE
  
  post("/modify_recipe/:path_id", { :controller => "recipes", :action => "update" })
  
  # DELETE
  get("/delete_recipe/:path_id", { :controller => "recipes", :action => "destroy" })

  #------------------------------

  # Routes for the List resource:

  # CREATE
  post("/insert_list", { :controller => "lists", :action => "create" })
          
  # READ
  get("/lists", { :controller => "lists", :action => "index" })
  
  get("/lists/:path_id", { :controller => "lists", :action => "show" })
  
  # UPDATE
  
  post("/modify_list/:path_id", { :controller => "lists", :action => "update" })
  
  # DELETE
  get("/delete_list/:path_id", { :controller => "lists", :action => "destroy" })

  #------------------------------


  #get("/", { :controller => "boards", :action => "index" })

  # Routes for the Post resource:

  # CREATE
  post("/insert_post", { :controller => "posts", :action => "create" })
          
  # READ
  get("/posts", { :controller => "posts", :action => "index" })
  
  get("/posts/:path_id", { :controller => "posts", :action => "show" })
  
  # UPDATE
  
  post("/modify_post/:path_id", { :controller => "posts", :action => "update" })
  
  # DELETE
  get("/delete_post/:path_id", { :controller => "posts", :action => "destroy" })

  #------------------------------

  # Routes for the Board resource:

  # CREATE
  post("/insert_board", { :controller => "boards", :action => "create" })
          
  # READ
  get("/boards", { :controller => "boards", :action => "index" })
  
  get("/boards/:path_id", { :controller => "boards", :action => "show" })
  
  # UPDATE
  
  post("/modify_board/:path_id", { :controller => "boards", :action => "update" })
  
  # DELETE
  get("/delete_board/:path_id", { :controller => "boards", :action => "destroy" })

  #------------------------------

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
