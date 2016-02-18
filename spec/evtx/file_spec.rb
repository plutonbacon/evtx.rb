require 'spec_helper'

describe Evtx::File do
  let(:ef) { Evtx::File.new('./spec/data/System.evtx') }

  it 'should have a valid FileHeader' do
    expect(ef.fileheader.verify).to equal(true)
  end
end
