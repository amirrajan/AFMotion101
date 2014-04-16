class HomeController < ApplicationController
 def index
  render :json => {
    first_name: "Amir",
    last_name: "Rajan",
    aliases: ["amirrajan", "amir"]
  }
 end

 def save params
  render :json => { }
 end
end
