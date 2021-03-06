require 'journeylog'

describe Journeylog do
  let(:journey) { double(:journey) }
  let(:station) { double(:station) }
  let(:journey_class) { double :journey_class, new: journey }
  subject {described_class.new(journey_class: journey_class)}

  describe '#start' do
    it 'creates a new journey' do
      expect(journey_class).to receive(:new).with(entry_station: station)
      subject.start(station)
    end

    it 'records a journey' do
    end
  end

  describe '#finish' do
    it 'finishes a journey' do
      subject.start(station)
      expect(journey).to receive(:finish).with(exit_station: station)
      subject.finish(station)
    end

    it 'adds journey to journeys' do
      allow(journey).to receive(:finish)
      subject.start(station)
      expect { subject.finish(station) }.to change { subject.journeys }.to([journey])
    end
  end
end
