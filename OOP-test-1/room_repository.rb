require 'csv'
require_relative './room.rb'

class RoomRepository

  def initialize(csv_file)
    @csv_file = csv_file
    @rooms = []
    @next_id = 0
    load_csv
  end

  def add(room)
    room.id = @next_id
    @rooms << room
    @next_id += 1
  end

  def find(index)
    @rooms[index]
  end

  private

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i
      row[:capacity] = row[:capacity].to_i
      @rooms << Room.new(row)
    end
    @next_id = @rooms.empty? ? 1 : @rooms.last.id + 1
  end

end

# room_repo = RoomRepository.new('./room.csv')
# p room_repo
