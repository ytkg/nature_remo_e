# frozen_string_literal: true

require 'faraday'
require 'json'

module NatureRemoE
  class Client
    BASE_URL = 'https://api.nature.global'
    API_VERSION = '1'

    def initialize(token)
      @token = token
    end

    def echonetlite_properties
      device[:smart_meter][:echonetlite_properties].to_h do |echonetlite_property|
        [echonetlite_property[:name].to_sym, echonetlite_property[:val].to_i]
      end
    end

    def coefficient
      echonetlite_properties[:coefficient]
    end

    def cumulative_electric_energy_effective_digits
      echonetlite_properties[:cumulative_electric_energy_effective_digits]
    end

    def normal_direction_cumulative_electric_energy
      echonetlite_properties[:normal_direction_cumulative_electric_energy]
    end

    def cumulative_electric_energy_unit
      echonetlite_properties[:cumulative_electric_energy_unit]
    end

    def reverse_direction_cumulative_electric_energy
      echonetlite_properties[:reverse_direction_cumulative_electric_energy]
    end

    def measured_instantaneous
      echonetlite_properties[:measured_instantaneous]
    end

    private

    def headers
      {
        'User-Agent' => "NatureRemoE v#{NatureRemoE::VERSION} (https://github.com/ytkg/nature_remo_e)",
        'Authorization' => "Bearer #{@token}"
      }
    end

    def client
      @client ||= Faraday.new(url: "#{BASE_URL}/#{API_VERSION}", headers: headers) do |f|
        f.response :json, parser_options: { symbolize_names: true }
      end
    end

    def appliances
      response = client.get('appliances')

      raise NatureRemoE::Error, response.body[:message] if response.status != 200

      response.body
    end

    def device
      appliance = appliances.find { |app| app[:type] == 'EL_SMART_METER' }

      raise NatureRemoE::Error, 'Device not found' if appliance.nil?

      appliance
    end
  end
end
