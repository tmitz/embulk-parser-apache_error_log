  module Embulk
  module Parser

    class ApacheErrorLog < ParserPlugin
      Plugin.register_parser('apache_error_log', self)

      def self.transaction(config, &control)
        # configuration code:
        task = {
          'hostname' => config.param('hostname', :string, default: '')
        }

        columns = [
          Column.new(0, 'time', :string),
          Column.new(1, 'level', :string),
          Column.new(2, 'pid', :long),
          Column.new(3, 'client', :string),
          Column.new(4, 'message', :string),
          Column.new(5, 'hostname', :string)
        ]

        yield(task, columns)
      end

      def init
        # initialization code:
        @hostname = task['hostname']
      end

      def run(file_input)
        while file = file_input.next_file
          file.each do |buffer|
            # parsering code
            data = buffer.split("\n")
            data.each do |row|
              row.scan(error_format) do |record|
                record.insert(-1, @hostname)
                page_builder.add(record)
              end
            end
          end
        end
        page_builder.finish
      end

      private

      def error_format
        /\A\[[^ ]*
        \s(?<time>[^\]]*)\]
        \s\[(?<level>[^\]]*)\]
        \s(?:\((?<pid>[^\)]*)\))?
        (\[client (?<client>[^\]]*)\])?
        \s?(?<message>.*)\z
        /x
      end
    end
  end
end
