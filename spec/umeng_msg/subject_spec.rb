require 'spec_helper'

module UmengMsg
  describe Subject do
    let(:subject) {Subject.new}
    describe '#push' do
      before :each do
        subject.push
      end

      it 'has a ret status' do
        expect(subject.ret).to eq 'SUCCESS'
      end

    end

    describe '#upload' do
      before :each do
        subject.upload
      end
      it 'has a ret status' do
        expect(subject.ret).to eq 'SUCCESS'
      end

    end
  end
end
