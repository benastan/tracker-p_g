require 'tracker/p_g'

module Tracker
  describe PG do
    before do
      Sequel.stub(connect: 'connection')
    end

    after do
      PG.reset!
    end

    describe '.connection' do
      it 'connects to the specified database url' do
        PG.database_url = 'my url'
        expect(PG.connection).to eq 'connection'
        expect(Sequel).to have_received(:connect).with('my url')
        expect(Tracker.pg).to eq 'connection'
      end
    end
  end
end