# rubocop:disable all
class Thor
  class << self
    def exit_on_failure?
      true
    end

    def help(shell, subcommand = false)
      list = printable_commands(true, subcommand)
      Thor::Util.thor_classes_in(self).each do |klass|
        list += klass.printable_commands(false)
      end
      # list.sort! { |a, b| a[0] <=> b[0] }

      if defined?(@package_name) && @package_name
        shell.say "#{@package_name} commands:"
      else
        shell.say "Commands:"
      end

      shell.print_table(list, :indent => 2, :truncate => true)
      shell.say
      class_options_help(shell)
    end
  end
end
