class StaticPagesController < ApplicationController

  def about
    
  end

  def home

  end

  def login
    
  end

  def publicminds

    @completed_minds = Mind.completed_minds

    @incomplete_minds = Mind.incomplete_minds

  end

  def greatminds

    @great_minds = Mind.all.joins(:upvote).order('count desc').limit(10)

  end


end
