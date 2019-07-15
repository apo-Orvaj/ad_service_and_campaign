# AdServiceAndCampaign

## Introduction:
Service to detect discrepancies between Campaign (local entity) and Ad Service (3rd party entity).

## Key entities:
- Campaign: Campaigns are local entity in database. Properties: id, job_id, status: one of [active, paused, deleted], external_reference, ad_description.
- AdService: Responsible for connecting with 3rd party Ad Service.
- AdServiceAndCampaign: Service object 'AdServiceAndCampaign' to detect discrepancies between local (Campaign) and remote (AdService) state.

## Approach/Business logic:
AdServiceAndCampaign is the central Service object, where the comparison takes place between the local and remote state. To detect comparisons:

```
AdServiceAndCampaign.compare

``` 

- It calls the AdService to connect with the external JSON API to fetch the "ads".
- The same number of local "campaigns" are initialized with random values.
- These two are then compared, to detect discrepancies amongst them

## Service output format:
	
```
[{:remote_reference=>"1", :discrepancies=>[{:status=>{:remote=>"enabled", :local=>"active"}}, {:description=>{:remote=>"Description for campaign 11", :local=>"test description 21650"}}]}, {:remote_reference=>"2", :discrepancies=>[{:status=>{:remote=>"disabled", :local=>"deleted"}}, {:description=>{:remote=>"Description for campaign 12", :local=>"test description 477737"}}]}, {:remote_reference=>"3", :discrepancies=>[{:status=>{:remote=>"enabled", :local=>"paused"}}, {:description=>{:remote=>"Description for campaign 13", :local=>"test description 999298"}}]}]
```

## Installation:
- For ruby installation:
1. Set up rbenv or rvm
2. Install ruby version 2.3.1

- Clone the repository and move the 'ad_service_and_campaign' directory.
- Build the gem with:
```
gem build ad_service_and_campaign.gemspec
```

- Install the gem with:
```
gem install ad_service_and_campaign
```

- Drop into irb, and require 'ad_service_and_campaign' to make sure our irb session can use our gem.
```
require 'ad_service_and_campaign'

AdServiceAndCampaign.compare
```

## Specifications/Dependencies:
AdServiceAndCampaign Version: 0.1.0
ruby version: 2.3.1
rspec
rake
bundler


