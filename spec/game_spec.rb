require_relative './../game'

describe 'Test Game class' do
  game = Game.new(false, '10-12-2000')

  it 'takes parameters and returns a game object' do
    expect(game).to be_instance_of(Game)
  end

  it 'takes parameters and returns a game object which is instance of Item' do
    expect(game).to be_kind_of(Item)
  end

  it 'games can_be_archived? should be true' do
    expect(game.can_be_archived?).to eql true
  end

  it "game publisher should be 'test1'" do
    expect(game.multiplayer).to eql false
  end
end
