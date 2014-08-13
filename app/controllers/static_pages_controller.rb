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
      group('user_minds.mind_id').
        having('COUNT(neurons.id) >= 4').
      # are in the top 10 by number of upvotes
      order('upvotes.count DESC').
        limit(2)

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
    @great_minds = Mind.
      joins(:neurons, :upvote).
      # are public
      where(:public => true).
      # have >= 5 neurons
      group('user_minds.mind_id').
        having('COUNT(neurons.id) >= 4').
      # are in the top 10 by number of upvotes
      order('upvotes.count DESC').
        limit(10)
  end


end
