<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<%@  page contentType="text/html"%>
<SCRIPT type="text/javascript">
if ( window.navigator.userAgent.indexOf("Linux")>-1 ) {
  // Linux Stylesheets
  document.write('<link type="text/css" rel="stylesheet" href="/css/corpStyle_linux.css"/>');
} else {
  // NonLinux Stylesheets
  document.write('<link type="text/css" rel="stylesheet" href="/css/corpStyle.css"/>');
}
</SCRIPT>

<SCRIPT TYPE="text/javascript">
  function getGraph(url,wd,ht) {
    url='http://<%=ApplicationServer.SERVER_NAME%>'+url;
    var wht = parseInt(ht)+49;
    var features = 'width='+wd+',height='+wht+'status=0';
    var win = window.open('', 'graph', features);
    win.document.open('text/html', 'replace');
    win.document.write('<html><head><title>TopCoder :: Graph</title></head><body bgcolor="#000000" marginwidth="0" marginheight="0" topmargin="0" leftmargin="0"><img src="/i/logo.gif" width="206" height="49"><br><img src="' + url + '" width="' + wd + '" height="' + ht + '"></body></html>');
    win.document.close();
    return;
  }
</SCRIPT>
