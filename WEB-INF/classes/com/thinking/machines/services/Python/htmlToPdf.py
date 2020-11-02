import pdfkit
import sys
websiteURL=sys.argv[1]
print(websiteURL)
pdfkit.from_url(websiteURL,'/usr/local/tomcat9/webapps/sbadmin2/WEB-INF/classes/com/thinking/machines/services/Python/'+'htmlToPdf.pdf')
