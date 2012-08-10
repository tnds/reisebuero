class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new # guest user (not logged in)
    if !user.role.nil?
			if user.role.name == "Admin"
	      can :manage, :all
	    end
			if user.role.name == "Moderator"
				can :manage, Event
        can :manage, EventHelper
        can :manage, Lodging
			end
			if user.role.name == "User"
				can :create, Event
				can :read, Event
        can :read, EventHelper
				can :create, EventHelper
				can :destroy, EventHelper, :user_id => user.id
        can :manage, Event do |event|
          EventHelper.where(:event_id => event.id, :user_id => user.id, :orga => true).exists?
        end
        can [:manage, :promote, :demote], EventHelper do |event_helper|
          event = event_helper.event
          EventHelper.where(:event_id => event.id, :user_id => user.id, :orga => true).exists? unless event.nil?
        end
        can :read, Lodging
        can :read, Booking
        can :manage, Lodging, :user_id => user.id
        can :manage, Booking, :user_id => user.id
        can :destroy, Booking do |booking|
          Lodging.where(:id => booking.lodging_id, :user_id => user.id).exists?
        end
        cannot :index, Lodging
        cannot :index, Booking
			end
    else
#      can :read, [Event, EventHelper]
      can :read, Event
      can :create, User
    end
		#
    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end