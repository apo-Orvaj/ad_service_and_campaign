class Campaign

  STATUS_LIST = ['active', 'paused', 'deleted']
  attr_accessor :status, :ad_description, :external_reference

  def initialize(id, job_id, status, external_reference, ad_description)
    @id = id
    @job_id = job_id
    @status = status
    @external_reference = external_reference
    @ad_description = ad_description
  end
end