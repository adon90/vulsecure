import scrapy
from scrapy.contrib.spiders import CrawlSpider, Rule
from scrapy.contrib.linkextractors.sgml import SgmlLinkExtractor
from tutorial.items import ProductItem
from tutorial.items import VulnerabilityItem
#from queries import *



class patchSpider(CrawlSpider):
    name = "patch"
    allowed_domains = ["itsecdb.com"]
    start_urls = [
        "http://www.itsecdb.com/oval/definitions/class-4-Patch/4/"
    ]
    rules = [
    Rule(SgmlLinkExtractor(restrict_xpaths=('//table[@class="listtable"]//tr[position()=2]/td/a')), callback='parse_item')]

    def parse_item(self, response):
        
        
        id = response.xpath('//td[@id="contenttd"]/h1/a/text()').extract()[0]
        #patch
        print id
        description = response.xpath('//div[@class="ovaldescription"]/text()').extract()[0].strip()
        print description
        references = response.xpath('//ul[@class="ovalreferencesul"]/li/a/text()').extract()
        for c in references:
            
            if "CVE" in c:
                print c
        print response.url
        #print cves
