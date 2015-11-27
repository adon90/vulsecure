import scrapy
from scrapy.contrib.spiders import CrawlSpider, Rule
from scrapy.contrib.linkextractors.sgml import SgmlLinkExtractor
from tutorial.items import ProductItem
from tutorial.items import VulnerabilityItem
#from queries import *



class DmozSpider(CrawlSpider):
    name = "dmoz"
    allowed_domains = ["cvedetails.com"]
    start_urls = [
        "http://www.cvedetails.com/vulnerability-list/"
    ]
    rules = [Rule(SgmlLinkExtractor(restrict_xpaths=('//div[@class="paging"]/a[position()=1]')), follow=True),
    Rule(SgmlLinkExtractor(restrict_xpaths=('//tr/td[@nowrap]/a')), callback='parse_item')]

    def parse_item(self, response):
        #hxs = HtmlXPathSelector(response)

        vulnerability = VulnerabilityItem()
        product = ProductItem()
        datenote = response.xpath("//span[@class='datenote']/text()").extract()[0]
        date = datenote.split('\t')	
        date_pub_aux = date[1]
        date_pub_list = date_pub_aux.split()
        date_pub = date_pub_list[3]
        date_upd_aux = date[2]
        date_upd_list = date_upd_aux.split()
        date_upd = date_upd_list[4]
        # Extract links
        cve = response.xpath("//h1/a[@title][position() = 1]/text()").extract()[0]  # Xpath selector for tag(s)
        description = response.xpath("//td/div[@class='cvedetailssummary']/text()").extract()[0]
        vulnerability['CVE'] = cve
        vulnerability['Description'] = description.split('\t')[1]
        vulnerability['P_Date'] = date_pub
        vulnerability['U_Date'] = date_upd
        vulnerability['Score'] = response.xpath("//td/div[@class='cvssbox']/text()").extract()[0]
        
        type_aux = response.xpath("//table//tr[position()=8]/td/span/text()").extract()
        typez = ' '.join(type_aux)
        vulnerability['Type'] = typez
        
        
        url = response.url
        
        print cve
        
        
        if (vulnerability['Score'] != '0.0'):
            
            # insert_vulnerabilities (vulnerability['CVE'],vulnerability['Description'],vulnerability['P_Date']\
            # ,vulnerability['U_Date'], vulnerability['Score'],vulnerability['Type'],url)
            pass
		############PRODUCT###########
           
        product['Vendor'] = response.xpath("//table[@id='vulnprodstable']//tr/td[position() = 3]/a/text()").extract()
        product['Product'] = response.xpath("//table[@id='vulnprodstable']//td[position() = 4]/a/text()").extract()
        product['Version'] = response.xpath("//table[@id='vulnprodstable']//td[position() = 5]/text()").extract()
	
		
		
        for x in range(len(product['Vendor'])):
			#print cve
			# print product['Vendor'][x]
			# print product['Product'][x]
			# print product['Version'][x].strip()
			#insert_product (product['Vendor'][x],product['Product'][x],product['Version'][x].strip(),cve)
            pass
	    
	
	
	
	
