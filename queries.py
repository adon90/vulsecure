#!/usr/bin/python
# -*- coding: utf-8 -*-

import MySQLdb as mdb
import sys
import os
servername = "localhost"
username = "root"
password = "root"
dbname = "vulsecure"

def connection():
    
    
    global servername, username, password, dbname
    
    con = mdb.connect(servername, username, password, dbname)

    return con;


def insert_product (vendor,product,version):
    
    

    con = connection()



    with con:
        
        cur = con.cursor()
        
        
        
        cur.execute("INSERT INTO Products(vendor,product,version) VALUES(%s,%s,%s)",(vendor,product,version))
        con.commit()
        