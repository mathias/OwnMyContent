require 'spec_helper'
require 'sidekiq/testing'

# describe 'Feeds can create enclosures and download associated files' do
# 	context 'the file download works' do
# 		before do
# 			# Do not try to download podcast:
# 			URI::HTTP.any_instance.stub_chain(:open, :read)

# 			# 
# 			Feed.any_instance.stub(:parse_feed!) { true }
# 		end

# 		it 'updates the status' do
# 			Sidekiq::Testing.inline! do
# 				enclosure = FactoryGirl.create :enclosure
# 				# wait for sidekiq
# 				expect(enclosure.upload_status).to eq "Waiting to Upload"
# 			end
# 		end
# 	end
# end