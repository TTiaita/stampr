module Stampr
    class Template
        def initialize(filepath)
            @source = read_file filepath
            if contains_template?

            end
        end


        private

        def read_file(filepath)
            File.read(filepath, 'r')
        end

        def contains_template?
            @source.match? /<stampr id=[\w\d_]+.* ?\/>/
        end
    end

    class Config
        attr_accessor :template_dir, :out_dir, :formatter
    end

    class Formatter
        
    end
end
