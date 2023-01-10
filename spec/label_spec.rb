require_relative './../label'

describe 'Test Label class' do
  label = Label.new('test1', 'black')

  it 'takes parameters and returns a label object' do
    expect(label).to be_instance_of(Label)
  end

  it "label title should be 'test1'" do
    expect(label.title).to eql 'test1'
  end
end
