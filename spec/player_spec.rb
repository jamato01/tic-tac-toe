require_relative '../lib/player.rb'

describe Player do
  describe '#initialize' do
    # Only sets instance variables, no tests needed
  end

  describe '#to_s' do
    subject(:player_name) { described_class.new('Jarrett', 'O')}
    it 'prints the name of the Player' do
      name = 'Jarrett'
      expect(player_name.to_s).to eq(name)
    end
  end

  describe '#update_position' do
    subject(:player_update) { described_class.new('Jarrett', 'O') }


    it 'updates the position the player chooses' do
      position = '9'
      player_update.update_position(position)
      board_positions = player_update.instance_variable_get(:@board_positions)
      expect(board_positions).to include(9)
    end

  end

  describe '#check_if_won' do
  subject(:player_wins) { described_class.new('Jarrett', 'O') }
    context 'if the player has a winning set "4, 5, 6"' do
      it 'returns true' do
        winning_set = [nil, nil, nil, 4, 5, 6, nil, nil, nil]
        player_wins.instance_variable_set(:@board_positions, winning_set)
        expect(player_wins.check_if_won).to be true
      end
    end
    context 'if the player has a winning set "1, 5, 9"' do
      it 'returns true' do
        winning_set = [1, nil, nil, nil, 5, 6, nil, nil, 9]
        player_wins.instance_variable_set(:@board_positions, winning_set)
        expect(player_wins.check_if_won).to be true
      end
    end
    context 'if the player does not have a winning set' do
      it 'returns false' do
        winning_set = [1, nil, 3, 4, nil, nil, nil, nil, 9]
        player_wins.instance_variable_set(:@board_positions, winning_set)
        expect(player_wins.check_if_won).to be false
      end
    end
  end
end