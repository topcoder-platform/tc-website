<%@ page import="com.topcoder.shared.util.ApplicationServer"%><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">
<html>
  <head>
    <title>Competition Arena</title>
        <jsp:include page="../script.jsp" />
        <script type="text/javascript">
            function getReq(){u='tc\?module=Static&d1=help&d2=index';window.open(u);close();}
        </script>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
  </head>
  <body bgcolor="#CCCCCC" marginwidth="0" marginheight="0" topmargin="0" leftmargin="0" onLoad="focus()">
    <table border="0" cellpadding="0" cellspacing="0" width="290" align="center">
      <tr><td><img border="0" height="8" width="1" src="/images/spacer.gif"/></td></tr>
      <tr><td class="bodyText"><font size="3"><b>Competition Arena</b></font></td></tr>
      <tr><td><img border="0" height="12" width="1" src="/images/spacer.gif"/></td></tr>
      <tr>
        <td class="bodyText">
              This page should present you with a button to start the competition arena applet.<br/><br/>
              NOTE: If a red button to "Load Competition Arena" does <b>not</b> appear below,
              you may not have the appropriate Plug-in software installed.
              <a href="Javascript:getReq()">
                Click here for more information &gt;&gt;
              </a>
        </td>
      </tr>
      <tr>
        <td valign="top"><img height="20" width="1" src="/images/spacer.gif"/></td>
      </tr>
      <tr>
        <td align="center" class="bodyText">
          <OBJECT classid="clsid:8AD9C840-044E-11D1-B3E9-00805F499D93"
                  width="239"
                  height="26"
                  name="LaunchApplet"
                  align="middle"
                  vspace="0"
                  hspace="0"
                  codebase="http://java.sun.com/products/plugin/1.3/jinstall-13-win32.cab#Version=1,3,0,0">
            <param name="name" value="LaunchApplet"/>
            <param name="code" value="com.topcoder.client.contestApplet.LaunchApplet.class"/>
            <param name="codebase" value="/contest/classes"/>
            <param name="archive" value="ContestApplet.jar"/>
            <param name="type" value="application/x-java-applet;version=1.3"/>
            <param name="scriptable" value="false"/>
            <param name="host" value="<%=ApplicationServer.SERVER_NAME%>"/>
            <param name="port" value="5001"/>
            <param name="tunnel" value="http://arena2.topcoder.com/servlet/com.topcoder.utilities.HTTPTunnelling.Tunnel?host=listener+port=5001"/>
            <param name="companyName" value="TopCoder"/>
            <EMBED type="application/x-java-applet;version=1.3"
                  code="com.topcoder.client.contestApplet.LaunchApplet.class"
                  codebase="/contest/classes"
                  name="LaunchApplet"
                  archive="ContestApplet.jar"
                  host="<%=ApplicationServer.SERVER_NAME%>"
                  port="5001"
                  tunnel="http://arena2.topcoder.com/servlet/com.topcoder.utilities.HTTPTunnelling.Tunnel?host=listener+port=5001"
                  companyName="TopCoder"
                  width="239"
                  height="26"
                  align="middle"
                  vspace="0"
                  hspace="0"
                  scriptable="false"
                  pluginspage="http://java.sun.com/j2se/1.3/jre/index.html">
              <NOEMBED></NOEMBED>
            </EMBED>
          </OBJECT>
          <b>You may minimize this browser window, but do not close it.</b>
          Doing so will close the applet.
        </td>
      </tr>
    </table>
  </body>
</html>
