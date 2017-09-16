require 'spec_helper'
require 'app'

describe App do
  subject { App.run(io: StringIO.new("8C TS KC 9H 4S 7D 2S 5D 3S AC\n")) }

  describe "run" do
    context "player 2 wins" do
      it "returns 0" do
        expect(subject).to eql 0
      end
    end

  end
end
