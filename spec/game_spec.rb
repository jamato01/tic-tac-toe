require_relative '../lib/game.rb'
require_relative '../lib/board.rb'

describe Game do
  describe '#initialize' do
    # only sets instance variables, will not test
  end

  describe '#start' do
    let(:player_one) { double('player_one') }
    let(:player_two) { double('player_two') }
    subject(:start_game) { described_class.new(player_one, player_two) }

    context 'when rand(2) returns 1' do
      before do
        allow(start_game).to receive(:rand).and_return(1)
        allow(player_one).to receive(:name)
        allow(Board).to receive(:new)
        allow(start_game).to receive(:puts)
        allow(start_game).to receive(:next_turn)
      end
      it 'makes player 1 the current player' do
        start_game.start
        expect(start_game.current_player).to eql(player_one)
      end
    end

    context 'when rand(2) does not return 1' do
      before do
        allow(start_game).to receive(:rand).and_return(2)
        allow(player_two).to receive(:name)
        allow(Board).to receive(:new)
        allow(start_game).to receive(:puts)
        allow(start_game).to receive(:next_turn)
      end
      it 'makes player 2 the current player' do
        start_game.start
        expect(start_game.current_player).to eql(player_two)
      end
    end
  end

  describe '#position_select' do
    let(:player_one) { double('player_one') }
    let(:player_two) { double('player_two') }
    subject(:game_position) { described_class.new(player_one, player_two) }

    before do
      allow(Board).to receive(:new)
      allow(game_position).to receive(:puts)
      allow(game_position).to receive(:gets).and_return('3')
      RSpec::Mocks.configuration.allow_message_expectations_on_nil = true
    end
    it 'sends #turn to Board object' do
      expect(game_position.board).to receive(:turn)
      game_position.position_select
    end
  end

  describe '#next_turn' do
    # script method, no testing
  end

  describe '#switch_player' do
    # script method, no testing
  end
end