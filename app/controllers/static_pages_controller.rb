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

    great_minds = []

    minds = Upvote.all.order('count desc').limit(10).collect {|x| x.mind_id }

    minds.each {|x| great_minds << Mind.find(x)}

    @great_minds = great_minds

  end


end
