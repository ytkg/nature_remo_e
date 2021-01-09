# frozen_string_literal: true

RSpec.describe NatureRemoE::Client do # rubocop:disable Metrics/BlockLength
  let(:uri) { 'https://api.nature.global/1/appliances' }
  let(:client) { described_class.new(anything) }

  before do
    stub_request(:get, uri).to_return(status: 200, body: open('./spec/files/appliances.json').read)
  end

  describe '#echonetlite_properties' do
    subject { client.echonetlite_properties }

    it do
      is_expected.to include(
        coefficient: 1,
        cumulative_electric_energy_effective_digits: 6,
        normal_direction_cumulative_electric_energy: 35_766,
        cumulative_electric_energy_unit: 1,
        reverse_direction_cumulative_electric_energy: 10,
        measured_instantaneous: 620
      )
    end
  end

  describe '#coefficient' do
    subject { client.coefficient }

    it { is_expected.to eq 1 }
  end

  describe '#cumulative_electric_energy_effective_digits' do
    subject { client.cumulative_electric_energy_effective_digits }

    it { is_expected.to eq 6 }
  end

  describe '#normal_direction_cumulative_electric_energy' do
    subject { client.normal_direction_cumulative_electric_energy }

    it { is_expected.to eq 35_766 }
  end

  describe '#cumulative_electric_energy_unit' do
    subject { client.cumulative_electric_energy_unit }

    it { is_expected.to eq 1 }
  end

  describe '#reverse_direction_cumulative_electric_energy' do
    subject { client.reverse_direction_cumulative_electric_energy }

    it { is_expected.to eq 10 }
  end

  describe '#measured_instantaneous' do
    subject { client.measured_instantaneous }

    it { is_expected.to eq 620 }
  end
end
