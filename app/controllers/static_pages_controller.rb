class StaticPagesController < ApplicationController

  def about
    
  end

  def home

  end

  def login
    
  end

  def publicminds
    binding.pry

      @minds = Mind.all.where(:public => true)
      @completed_minds = @minds.completed_minds_public
      @incomplete_minds = @minds.incomplete_minds_public

  end

  def greatminds

  

  end


end
