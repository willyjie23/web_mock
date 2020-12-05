require 'rails_helper'

RSpec.describe UserService do
  describe '#user_profile' do
    it 'Correct URL' do
      stub_request(:get, 'https://demo.com/profile').with(
        headers: { 'Content-Type': 'application/json' },
        query: hash_including({ user: 'willy@gmail.com' })
      ).to_return(body: { status: 200, name: 'willy', age: 18 }.to_json)
      resp = UserService.new('willy@gmail.com').user_profile
      result = JSON.parse(resp)

      expect(result['status']).to eq(200)
      expect(result['name']).to eq('willy')
      expect(result['age']).not_to eq(30)
    end

    # it 'Wrong URL' do
    #   stub_request(:get, 'https://test.com/profile').with(
    #     query: hash_including({ user: 'willy@gmail.com' })
    #   ).to_return(status: 200, body: { name: 'willy', age: 18 }.to_json)
    #   resp = UserService.new('willy@gmail.com').user_profile

    #   expect(resp[:status]).to eq(200)
    #   expect(resp[:parsed_resp][:name]).to eq('willy')
    #   expect(resp[:parsed_resp][:age]).not_to eq(30)
    # end
  end

  describe '#add_new_user' do
    it 'create user success' do
      stub_request(:post, 'https://demo.com/new_user').with(
        headers: { 'Content-Type' => 'application/json' }
      ).to_return(body: { status: 200, message: 'ok' }.to_json)
      resp = UserService.new('willy@gmail.com').add_new_user
      result = JSON.parse(resp)

      expect(result['status']).to eq(200)
      expect(result['message']).to eq('ok')
    end
    # it 'user already exists' do
    # end
  end
end