RSpec.describe Ez::Registry do
  let(:callable_object) { Proc.new { 'Hello' } }
  let(:someone_other)   { 'Someone other' }

  let!(:init) do
    Ez::Registry.in :test_registry, by: RSpec do |registry|
      registry.add :a
      registry.add 'b'
    end

    Ez::Registry.in :test_registry, by: someone_other do |registry|
      registry.add callable_object
    end

    Ez::Registry.in :other_registry, by: someone_other do |registry|
      registry.add :d
    end
  end

  it 'store data as registry' do
    # .store
    expect(Ez::Registry.store(:test_registry).count).to eq 3

    Ez::Registry.store.each_key do |key|
      expect(Ez::Registry.store(key)).to be_instance_of(Ez::Registry::Store)
    end

    expect(Ez::Registry.store(:test_registry)[0].data).to eq :a
    expect(Ez::Registry.store(:test_registry)[0].by).to eq RSpec

    expect(Ez::Registry.store(:test_registry)[1].data).to eq 'b'
    expect(Ez::Registry.store(:test_registry)[1].by).to eq RSpec

    expect(Ez::Registry.store(:test_registry)[2].data).to eq callable_object
    expect(Ez::Registry.store(:test_registry)[2].by).to eq someone_other

    expect(Ez::Registry.store(:test_registry).data).to eq [:a, 'b', callable_object]

    expect(Ez::Registry.store(:other_registry).count).to eq 1
    expect(Ez::Registry.store(:other_registry)[0].data).to eq :d
    expect(Ez::Registry.store(:other_registry)[0].by).to eq someone_other

    expect(Ez::Registry.store(:undefined_registry)).to be_empty
    expect(Ez::Registry.store(:undefined_registry)).to be_instance_of(Ez::Registry::Store)

    # .data
    expect(Ez::Registry.data(:test_registry)).to be_instance_of Array
    expect(Ez::Registry.data(:test_registry).count).to eq 3
    expect(Ez::Registry.data(:test_registry)[0]).to eq :a
    expect(Ez::Registry.data(:test_registry)[1]).to eq 'b'
    expect(Ez::Registry.data(:test_registry)[2]).to eq callable_object
  end
end
