# frozen_string_literal: true

require 'faraday'
require 'json'

module NatureRemoE
  class Client
    def initialize(token)
      @token = token
    end

    def echonetlite_properties
      device[:smart_meter][:echonetlite_properties].map do |echonetlite_property|
        [echonetlite_property[:name].to_sym, echonetlite_property[:val].to_i]
      end.to_h
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

    def client
      @client ||= Faraday.new(
        url: 'https://api.nature.global',
        headers: { Authorization: "Bearer #{@token}" }
      )
    end

    def appliances
      response = client.get do |req|
        req.url '/1/appliances'
      end

      raise NatureRemoE::Error, JSON.parse(response.body, symbolize_names: true)[:message] if response.status != 200

      JSON.parse(response.body, symbolize_names: true)
    end

    def device
      appliance = appliances.find { |app| app[:type] == 'EL_SMART_METER' }

      raise NatureRemoE::Error, 'Device not found' if appliance.nil?

      appliance
    end
  end
end
