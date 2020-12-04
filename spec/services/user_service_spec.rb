require 'rails_helper'

RSpec.describe UserService do
  describe '#user_profile' do
    it 'should be rigin URL' do
      stub_request(:get, 'https://demo.com/profile').with(
        query: hash_including({ user: 'willy@gmail.com' })
      ).to_return(status: 200, body: { name: 'willy', age: 18 }.to_json)
      resp = UserService.new('willy@gmail.com').user_profile

      expect(resp[:status]).to eq(200)
      expect(resp[:parsed_resp][:name]).to eq('willy')
      expect(resp[:parsed_resp][:age]).not_to eq(30)
    end
  end
end