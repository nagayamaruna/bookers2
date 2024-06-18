class HomesController < ApplicationController
  before_action :authenticate_user!, except: [:about, :top]
  
  def about
    
  end
  
  def top
    
  end
end
