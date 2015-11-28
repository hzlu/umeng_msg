require 'spec_helper'

module UmengMsg
  describe Subject do
    let(:subject) {Subject.new('ios', type: 'unicast', device_tokens: 'xxx', alert: 'hello')}
    describe '#push' do

      it 'can post to umeng' do
        subject.push
        # expect(subject.ret).to eq 'SUCCESS'
        expect(subject.data).to eq 'SUCCESS'
      end

    end

    # describe '#upload' do
    #   before :each do
    #     subject.upload
    #   end
    #   it 'has a ret status' do
    #     expect(subject.ret).to eq 'SUCCESS'
    #   end
    #
    # end
  end
end
