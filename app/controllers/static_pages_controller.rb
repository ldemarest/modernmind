class StaticPagesController < ApplicationController

  def about
    
  end

  def home

  end

  def login
    
  end

  def publicminds

      @minds = Mind.all.where(:public => true)

  end

  def greatminds
    
  

  end


end
