require 'rails_helper'

RSpec.describe Category, type: :model do
  subject { FactoryGirl.create(:category, user: FactoryGirl.create(:user, :confirmed)) }

  before { subject.save }

  it 'name must be there' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'description must be there' do
    subject.description = nil
    expect(subject).to_not be_valid
  end

  it 'icon must be there' do
    subject.icon = nil
    expect(subject).to_not be_valid
  end

  it 'count of all transactions' do
    user = FactoryGirl.create(:user, :confirmed)
    subject.update(user:)
    t1 = FactoryGirl.create(:service, user:)
    t2 = FactoryGirl.create(:service, user:)
    FactoryGirl.create(:service_category, service: t1, category: subject)
    FactoryGirl.create(:service_category, service: t2, category: subject)
    subject.save
    expect(subject.all_services.length).to eql 2
  end
end
