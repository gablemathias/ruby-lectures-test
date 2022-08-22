require 'csv'
require_relative './room.rb'

class RoomRepository

  def initialize(csv_file)
    @csv_file = csv_file
    @room = []
    @next_id = 0
    load_csv
  end

  def add(room)
    room.id = @next_id
    @room << room
    @next_id += 1
  end

  private

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i
      row[:capacity] = row[:capacity].to_i
      @room << Room.new(row)
    end
    @next_id = @room.empty? ? 1 : @room.last.id + 1
  end

end

room_repo = RoomRepository.new('./room.csv')

p room_repo
