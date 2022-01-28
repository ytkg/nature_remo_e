# frozen_string_literal: true

require 'thor'

module NatureRemoE
  class Cli < Thor
    default_command :all

    desc 'all', 'Get all value'
    option 'json', type: :boolean
    def all
      return puts echonetlite_properties.to_json if options['json']

      echonetlite_properties.each do |name, value|
        puts "#{name}: #{value}"
      end
    end

    desc 'coefficient', 'Get coefficient value'
    def coefficient
      puts echonetlite_properties[:coefficient]
    end

    desc 'cumulative_electric_energy_effective_digits', 'Get cumulative_electric_energy_effective_digits value'
    def cumulative_electric_energy_effective_digits
      puts echonetlite_properties[:cumulative_electric_energy_effective_digits]
    end

    desc 'normal_direction_cumulative_electric_energy', 'Get normal_direction_cumulative_electric_energy value'
    def normal_direction_cumulative_electric_energy
      puts echonetlite_properties[:normal_direction_cumulative_electric_energy]
    end

    desc 'cumulative_electric_energy_unit', 'Get cumulative_electric_energy_unit value'
    def cumulative_electric_energy_unit
      puts echonetlite_properties[:cumulative_electric_energy_unit]
    end

    desc 'reverse_direction_cumulative_electric_energy', 'Get reverse_direction_cumulative_electric_energy value'
    def reverse_direction_cumulative_electric_energy
      puts echonetlite_properties[:reverse_direction_cumulative_electric_energy]
    end

    desc 'measured_instantaneous', 'Get measured_instantaneous value'
    def measured_instantaneous
      puts echonetlite_properties[:measured_instantaneous]
    end

    private

    def echonetlite_properties
      client = NatureRemoE::Client.new(ENV['NATURE_REMO_API_TOKEN'])
      client.echonetlite_properties
    rescue StandardError => e
      puts e.message
      exit!
    end
  end
end
