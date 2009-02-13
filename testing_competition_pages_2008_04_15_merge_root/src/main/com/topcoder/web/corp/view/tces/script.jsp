<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<%@  page contentType="text/html"%>
<SCRIPT type="text/javascript">
  document.write('<link type="text/css" rel="stylesheet" href="/css/corpStyle.css"/>');
  document.write('<link type="text/css" rel="stylesheet" href="/css/coders.css"/>');
</SCRIPT>

<SCRIPT TYPE="text/javascript">
  function getGraph(url,wd,ht,name) {
    url='http://<%=ApplicationServer.SERVER_NAME%>'+url;
    var wht = parseInt(ht)+49;
    var features = 'width='+wd+',height='+wht+'status=0';
    var win = window.open('', name, features);
    win.document.open('text/html', 'replace');
    win.document.write('<html><head><title>TopCoder :: Graph</title></head><body bgcolor="#000000" marginwidth="0" marginheight="0" topmargin="0" leftmargin="0"><img src="/i/corp/logo.gif" width="206" height="49"><br><img src="' + url + '" width="' + wd + '" height="' + ht + '"></body></html>');
    win.document.close();
    return;
  }
</SCRIPT>
