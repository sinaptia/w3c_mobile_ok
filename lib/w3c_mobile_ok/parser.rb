module W3CMobileOk
  class Parser
    URL = 'http://validator.w3.org/mobile/check?&docAddr='

    def initialize(url)
      @url = "#{URL}#{url}"
    end

    def parse!
      agent = Mechanize.new
      page = agent.get @url

      result = Result.new
      result.score = page.search('#score .hd strong').text
      result.page_size = page.search('#pagesize .hd strong').text
      result.network_usage = page.search('#network .hd strong').text

      page.search('#pagesize .details tr').each do |node|
        unless node.search('th').any?
          resource = Resource.new
          resource.size = node.children.search('td')[0].text.strip
          resource.type = node.children.search('td')[1].text.strip
          resource.uri = node.children.search('td')[2].text.strip

          result.resources << resource
        end
      end

      page.search('#details li.mod').each do |node|
        failure = Failure.new
        failure.severity = node.search('.severity img').first['alt']
        failure.category = node.search('.cat img').first['alt']
        failure.description = node.search('.desc').children.last.text.split("\n").map(&:strip).join(' ')

        failure.best_practice = BestPractice.new
        failure.best_practice.why = node.search('.why .explanation').children.last.text.split("\n").map(&:strip).join(' ') if node.search('.why .explanation').children.any?
        failure.best_practice.how = node.search('.how .explanation').children.last.text.split("\n").map(&:strip).join(' ') if node.search('.how .explanation').children.any?
        failure.best_practice.where = node.search('div[id$=where] .explanation').children.map(&:text).join.split("\n").map(&:strip).join(' ') if node.search('div[id$=where] .explanation').children.any?

        result.failures << failure
      end

      result
    end
  end
end
