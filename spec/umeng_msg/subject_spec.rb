require 'spec_helper'

module UmengMsg
  describe Subject do
    let(:subject) {Subject.new('ios', type: 'unicast', device_tokens: 'xxx', alert: 'hello')}
    describe '#push' do
      it 'can push to umeng' do
        subject.push
        expect(subject.ret[:push]).to eq 'SUCCESS'
      end

      it 'will get error_code with wrong appkey' do
        subject.push
        expect(subject.error_code[:push]).to eq nil
      end
    end

    describe '#check' do
      it 'can check the push task' do

      end

      it 'will get check_data' do

      end
    end

    describe '#cancel' do
      it 'can cancel the task' do
      end
    end

    describe '#upload' do
      it 'return a file_id' do

      end
    end
  end
end
