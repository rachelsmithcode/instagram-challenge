require 'rails_helper'

describe Photo, type: :model do
  it { is_expected.to have_many(:comments).dependent(:destroy) }


  it 'is not valid with a name of less than two characters' do
    photo = Photo.new(name: "a")
    expect(photo).to have(1).error_on(:name)
    expect(photo).not_to be_valid
  end

  it "is not valid unless it has a unique name" do
    Photo.create(name: "cat")
    photo = Photo.new(name: "cat")
    expect(photo).to have(1).error_on(:name)
  end

end
