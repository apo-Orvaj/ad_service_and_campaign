require 'spec_helper'

RSpec.describe AdServiceAndCampaign do
  it 'has a version number' do
    expect(AdServiceAndCampaign::VERSION).not_to be nil
  end

  it 'has version number 0.1.0' do
    expect(AdServiceAndCampaign::VERSION).to eq('0.1.0')
  end

  it 'initializes campaigns' do 
    expect(AdServiceAndCampaign.initialize_campaigns(1)).to be_truthy
  end

  it 'should not initialize campaigns if argument is not positive' do
    expect(AdServiceAndCampaign.initialize_campaigns(-4)).to be_falsey

    expect(AdServiceAndCampaign.initialize_campaigns(0)).to be_falsey
  end

  it 'returns count of campaign_ids initialized' do
    expect(AdServiceAndCampaign.campaign_ids.count).to eq(1)
  end

  it 'check if object were made for Campaign class' do
    campaign_id = AdServiceAndCampaign.campaign_ids.last
    object = ObjectSpace._id2ref(campaign_id)
    expect(object.is_a?(Campaign)).to be_truthy
  end

  it 'calls_ad_service to return a response' do
    expect(AdServiceAndCampaign.call_ad_service.nil?).to be_falsey

    expect(AdServiceAndCampaign.call_ad_service.is_a?(Hash)).to be_truthy
  end

  it 'should compare the local and remote values' do
    expect(AdServiceAndCampaign.compare).to be_truthy
  end
end
