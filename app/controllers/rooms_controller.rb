class RoomsController < ApplicationController
  before_action :authenticate_user! # создание комнаты, отображение списка всех комнат и пользователей кроме скоупов!

  def index
    @room = Room.new
    @rooms = Room.public_rooms

    @users = User.all_except(current_user)
  end

  def show
    @single_room = Room.find(params[:id]) # показывает приватную комнату
    @room = Room.new
    @rooms = Room.public_rooms

    @message = Message.new
    @message = @single_room.messages.order(created_at: :asc)

    @users = User.all_except(current_user)
  end

  def create 
    @room = Room.create(room_params)
  end

  def room_params
    params.require(:room).permit(:name)
  end
end
