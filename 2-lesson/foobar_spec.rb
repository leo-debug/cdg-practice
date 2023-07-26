require 'rspec'
require_relative 'foobar'

describe 'pokemon' do

    it 'says OK if one of the numbers is equal to 20' do
        expect(collaborator).to have_received(:message).with(args)
        
    end
end

