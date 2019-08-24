# require 'rspec'
#
#
# describe 'Physical' do
#   it "should recieve damage" do
#     damage = Physical.new
#
#
#   end
# end


require "rspec"
require_relative '../../services/damage/physical/deal'

RSpec.describe Physical::Deal do
  it do
    Physical::Deal.(amount: 2131)
  end
end