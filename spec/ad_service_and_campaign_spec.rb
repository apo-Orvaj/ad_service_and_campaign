require "spec_helper"

RSpec.describe AdServiceAndCampaign do
  it "has a version number" do
    expect(AdServiceAndCampaign::VERSION).not_to be nil
  end

  it "initializes campaigns" do 
  	expect(AdServiceAndCampaign.initialize_campaigns(1)).to be_truthy
  end

  it "returns campaign_ids of the campaigns initialized" do
  	expect(AdServiceAndCampaign.campaign_ids.count).to eq(1)

	campaign_id = AdServiceAndCampaign.campaign_ids.last
	object = ObjectSpace._id2ref(campaign_id)
	expect(object.is_a?(Campaign)).to be_truthy
  end

  it "calls_ad_service to return a response" do
  	expect(AdServiceAndCampaign.call_ad_service.nil?).to be_falsey

  	expect(AdServiceAndCampaign.call_ad_service.is_a?(Hash)).to be_truthy
  end

  it "should compare the local and remote values" do
  	expect(AdServiceAndCampaign.compare).to be_truthy

  	# expect(AdServiceAndCampaign.compare).t
  end
end
