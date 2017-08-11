# encoding: utf-8

require 'pismo'
require 'nokogiri'
require "open-uri"
require 'open_uri_redirections'

class Textifiers
    def self.run_all!
        File.open("urls.txt").each_with_index do |url, i|
            parse!(i, url.strip)
        end
    end

    def self.parse!(i, url)
        p "Processing #{url}"
        root = File.join("results", i.to_s)
        FileUtils.mkdir_p(root)

        html = open(url, :allow_redirections => :all)
        doc = Nokogiri::HTML(html.read).to_s.encode("UTF-8")

        write(root, "original.html", doc)

        txt = Pismo::Document.new(doc)
        write(root, "pismo.txt", txt.body)

        # TODO pismo html

        # TODO dandelion

        data = `./java_client/build/install/parsing_clients/bin/parsing_clients #{url} boilerpipe text`
        write(root, "boilerpipe.txt", data)

        if ENV['DIFFBOT_API_KEY']
          data = `./java_client/build/install/parsing_clients/bin/parsing_clients #{url} diffbot html`
          write(root, "diffbot.html", data)
          sleep(1)

          data = `./java_client/build/install/parsing_clients/bin/parsing_clients #{url} diffbot text`
          write(root, "diffbot.txt", data)
          sleep(1)
        else
          puts "DIFFBOT_API_KEY not set - configure one in your ENV if you like to use Diffbot's api"
        end
    end

    def self.write(path, file, content)
        File.open(File.join(path, file), "w") { |file| file.write(content) }
    end
end



Textifiers.run_all!
