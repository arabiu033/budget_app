require 'rails_helper'

RSpec.describe Service, type: :model do
  subject { Service.create(name: 'Owo', amount: 10) }
  user = FactoryGirl.create(:user, :confirmed)

  before { subject.save }

  it 'name must be there' do
    subject.name = nil
    subject.update(user:)
    subject.save
    expect(subject).to_not be_valid
  end

  it 'description must be there' do
    subject.amount = nil
    subject.update(user:)
    subject.save
    expect(subject).to_not be_valid
  end
end
