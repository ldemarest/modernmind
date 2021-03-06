class StaticPagesController < ApplicationController

  # before_action :require_login, only: :openminds

  def about

  end

  def homepage

    @great_minds = Mind.
      joins(:neurons, :upvote).
      # are public
      where(:public => true).
      # have >= 5 neurons
      group('minds.id').
      having('COUNT(neurons.id) >= 4').limit(2)

    # are in the top 10 by number of upvotes
    # order('upvotes.count DESC').
    # limit(2)

  end

  def login

  end

  def openminds

    @completed_minds = Mind.completed_minds

    @incomplete_minds = Mind.incomplete_minds

  end

  # this should be a method in the Mind model
  # called something like find_ten_most_popular_minds
  def greatminds
    # all minds that
    @completed_minds = Mind.completed_minds

    public_minds = Mind.
      # are public
      where(:public => true)
    # have >= 5 neurons

    finished_public_minds = public_minds.select {|mind| mind.neurons.size == 4}
    # have >= 5 neurons
    
    @great_minds = finished_public_minds.sort_by {|finished_mind| finished_mind.upvote.count}.reverse
    
  end


end
