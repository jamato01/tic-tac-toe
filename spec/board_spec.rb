require_relative '../lib/board.rb'

describe Board do
  describe '#initialize' do
    # Initialize --> No test needed since only creating instance variable
  end 

  describe '#to_s' do
    context 'when game is initialized' do
      subject(:game_board) { described_class.new }
      it 'returns gameboard as string' do
        expect(game_board.to_s).to eq " 1 | 2 | 3 \n-----------\n 4 | 5 | 6 \n-----------\n 7 | 8 | 9 "
      end
    end
  end

  describe '#turn' do
    context 'when the position is not used yet' do
      let(:player_board) { double('player_board') }
      let(:position) { String.new('5') }
      subject(:game_board) { described_class.new }
      
      before do
        allow(game_board).to receive(:puts)
        allow(player_board).to receive(:game_symbol)
        allow(game_board.board).to receive(:each)
      end

      it 'sends message to player to update_position' do
        expect(player_board).to receive(:update_position).with(position)
        game_board.turn(player_board, position)
      end

      it 'returns true' do
        allow(player_board).to receive(:update_position)
        result = game_board.turn(player_board, position)
        expect(result).to be true
      end
    end

    context 'when the position has been used' do
      let(:player_board) { double('player_board') }
      let(:position) { String.new('5') }
      subject(:game_board) { described_class.new }

      before do
        game_board.instance_variable_set(:@board, [" 1 | 2 | 3 ", "-----------", " 4 | X | 6 ", "-----------", " 7 | 8 | 9 "])
      end

      it 'puts an error message' do
        error_message = "Not a valid position."
        expect(game_board).to receive(:puts).with(error_message).once
        game_board.turn(player_board, position)
      end

      it 'returns false' do
        result = game_board.turn(player_board, position)
        expect(result).to be false
      end
    end
  end
end