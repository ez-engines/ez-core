require 'ez/items/link'

RSpec.describe Ez::Items::Link do
  subject { described_class.new('label', 'path', some: :options) }

  describe '#initialize' do
    it { expect(subject.label).to eq 'label' }
    it { expect(subject.path).to eq 'path' }
    it { expect(subject.options).to eq({some: :options}) }
  end
end
