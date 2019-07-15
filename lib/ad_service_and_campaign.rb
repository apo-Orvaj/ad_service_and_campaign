require 'ad_service_and_campaign/version'
require 'ad_service'
require 'campaign'

module AdServiceAndCampaign
  @campaign_ids = []

  def self.call_ad_service
    ad_service = AdService.new
    ad_service.call
  end

  def self.initialize_campaigns(ads_count)
    return false unless ads_count.positive?
    ads_count.times do |index|
      job_id = rand(0..999_999).to_s
      status = Campaign::STATUS_LIST[rand(0..2)]
      campaign = Campaign.new(job_id, status, (index+1).to_s, "test description #{job_id}")
      @campaign_ids << campaign.object_id
    end
  end

  def self.campaign_ids
    @campaign_ids
  end

  def self.compare
    result = []

    ads = AdServiceAndCampaign.call_ad_service['ads']
    AdServiceAndCampaign.initialize_campaigns(ads.count)
    ads.each_with_index do |ad, index|
      campaign_obj = ObjectSpace._id2ref(AdServiceAndCampaign.campaign_ids[index])

      discrepancies = []
      unless ad['status'] == campaign_obj.status
        discrepancies << { 'status': {
          'remote': ad['status'],
          'local': campaign_obj.status
        } }
      end
      unless ad['description'] == campaign_obj.ad_description
        discrepancies << { 'description': {
          'remote': ad['description'],
          'local': campaign_obj.ad_description
        } }
      end
      result << { 'remote_reference': campaign_obj.external_reference,
                  'discrepancies': discrepancies }
    end
    result
  end
end
