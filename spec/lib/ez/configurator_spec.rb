# frozen_string_literal: true

require 'ez/configurator'

RSpec.describe Ez::Configurator do
  module MyEngine
    include Ez::Configurator
  end

  it { expect(MyEngine.config).to be_instance_of Ez::Configurator::Engine::Store }

  describe '.configure' do
    before do
      MyEngine.configure do |config|
        config.random_value = 'random value'
      end

      it { expect(MyEngine.config.random_value).to eq 'random value' }
    end
  end

  describe 'getters / setters' do
    before { MyEngine.config.any_config = 'my value' }

    it { expect(MyEngine.config.any_config).to eq 'my value' }
    it { expect(MyEngine.config.not_defined).to eq nil }
  end
end
