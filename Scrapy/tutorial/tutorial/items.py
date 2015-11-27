# -*- coding: utf-8 -*-

# Define here the models for your scraped items
#
# See documentation in:
# http://doc.scrapy.org/en/latest/topics/items.html

import scrapy


class TutorialItem(scrapy.Item):
    # define the fields for your item here like:
    # name = scrapy.Field()
    pass

class VulnerabilityItem(scrapy.Item):
    
    CVE = scrapy.Field()
    Description = scrapy.Field()
    P_Date = scrapy.Field()
    U_Date = scrapy.Field()
    Score = scrapy.Field()
    Type = scrapy.Field()
    
class ProductItem(scrapy.Item):
    
    Vendor = scrapy.Field()
    Product = scrapy.Field()
    Version = scrapy.Field()
    CVE = scrapy.Field()
    
class ExploitItem(scrapy.Item):
    
    ID = scrapy.Field()
    CVE = scrapy.Field()
    Date = scrapy.Field()
    Exploit = scrapy.Field()