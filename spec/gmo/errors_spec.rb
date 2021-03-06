require 'spec_helper'

describe GMO::Payment::Error do
  it "is a GMO::GMOError" do
    GMO::Payment::Error.new(nil, nil).should be_a(GMO::GMOError)
  end
end

describe GMO::GMOError do
  it "is a StandardError" do
    GMO::GMOError.new.should be_a(StandardError)
  end
end

describe GMO::Payment::APIError do
  it "is a GMO::Payment::Error" do
    GMO::Payment::APIError.new({}).should be_a(GMO::Payment::Error)
  end

  context 'with error messages' do
    let(:response) { {
      "ErrCode" => "BA1|E01",
      "ErrInfo" => "BA1040001|E01170001|100"
    } }
    subject { GMO::Payment::APIError.new(response) }
    it { expect(subject.message).to eq "ErrCode=BA1|E01&ErrInfo=BA1040001|E01170001|100&ErrMessage=Bank ID is not specified|Card Number not specified|Card number Required check error" }
  end
end

describe GMO::Payment::ServerError do
  it "is a GMO::Payment::Error" do
    GMO::Payment::ServerError.new(nil, nil).should be_a(GMO::Payment::Error)
  end
end
