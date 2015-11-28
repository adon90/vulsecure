select * from Vulnerabilities_cve inner join Products on Vulnerabilities_cve.CVE = Products.CVE where Product="Windows 2003 Server"\G

select * from Vulnerabilities_cve inner join Products on Vulnerabilities_cve.CVE = Products.CVE inner join Exploits on Products.CVE=Exploits.CVE where Product="Windows 2003 Server"\G

select * from Patches inner join Patch_CVE on Patches.patch_id = Patch_CVE.patch_id inner join Products on Products.CVE=Patch_CVE.cve where Product="Windows 2003 Server"\G

select * from Vulnerabilities_cve inner join Products on Vulnerabilities_cve.CVE = Products.CVE inner join Exploits on Products.CVE=Exploits.CVE where Product="Windows 2003 Server" and Vulnerabilities_cve.CVE="CVE-2008-2245"\G

