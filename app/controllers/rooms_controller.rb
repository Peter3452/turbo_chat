class RoomsController < ApplicationController
  before_action :authenticate_user!

  def index
    @room = Room.new
    @rooms = Room.public_rooms
    @users = User.all_except(current_user)
  end

  def create 
    @room = room.create(room_params)
  end

    def room_params
      params.require(:room).permit(:name)
    end
end
