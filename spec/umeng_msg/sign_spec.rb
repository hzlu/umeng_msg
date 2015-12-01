require 'spec_helper'
module UmengMsg
  describe Sign do
    let(:sign) do
      UmengMsg::Sign.generate('ios', UmengMsg::Subject::PUSH_URL, {type: 'boardcast'})
    end
    it 'generate a sign' do
      expect(sign).to eq '39c427075b808ec33cb7a9f5294879f6'
    end
  end
end
