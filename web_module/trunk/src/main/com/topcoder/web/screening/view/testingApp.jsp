<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
 <%@ page errorPage="/errorPage.jsp" %>
<html>
  <head>
    <title>Competition Arena</title>
        <!--<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
        <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>-->
  </head>
  <body bgcolor="#CCCCCC" marginwidth="0" marginheight="0" topmargin="0" leftmargin="0" onLoad="focus()">
    <table border="0" cellpadding="0" cellspacing="0" width="290" align="center">
      <tr>
        <td>
          <img border="0" height="8" width="1" src="/images/spacer.gif"/>
        </td>
      </tr>
      <tr>
        <td class="bodyText">
          <font size="3">
            <b>Competition Arena</b>
          </font>
        </td>
      </tr>
      <tr>
        <td>
          <img border="0" height="12" width="1" src="/images/spacer.gif"/>
        </td>
      </tr>
      <tr>
        <td class="bodyText">
              This page should present you with a button to start the competition arena applet.<br/><br/>
              NOTE: If a red button to "Load Competition Arena" does <b>not</b> appear below,
              you may not have the appropriate Plug-in software installed.
              <SCRIPT type="text/javascript">
                function getReq(){u='/?t=support&amp;c=software_req';window.open(u);close();}
              </SCRIPT><BR/>
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

        <%
            String host = request.getParameter("host");
            if ((host==null) || host.equals("")) host="corporate.topcoder.com";

            String port = request.getParameter("port");
            if ((port==null) || port.equals("")) port="8001";

            String tunnel = request.getParameter("tunnel");
            if ((tunnel==null) || tunnel.equals("")) tunnel="http://arena2.topcoder.com/servlet/com.topcoder.utilities.HTTPTunnelling.Tunnel?host=screening+port=8001";

            String companyID = request.getParameter("company");
            if ((companyID==null) || companyID.equals("")) companyID="1";

        %>

<OBJECT classid="clsid:8AD9C840-044E-11D1-B3E9-00805F499D93" width="239" height="26" name="LaunchApplet" align="middle" vspace="0" hspace="0" codebase="http://java.sun.com/products/plugin/autodl/jinstall-1_4-windows-i586.cab#Version=1,4,0,0">
    <PARAM name="type" value="application/x-java-applet;version=1.4" >
    <PARAM name="code" value="com.topcoder.client.screening.tool.view.screeningClient.LaunchApplet.class" >
    <PARAM name="codebase" value="/contest/classes">
    <PARAM name="name" value="LaunchApplet" >
    <PARAM name="archive" value="ScreeningClient.jar" >
    <PARAM name="scriptable" value="false" >
    <PARAM name="HOST" value="<%=host%>">
    <PARAM name="PORT" value="<%=port%>">
    <PARAM name="TUNNEL" value="<%=tunnel%>">
    <PARAM name="COMPANYID" value="<%=companyID%>">

    <EMBED type="application/x-java-applet;version=1.3"
           code="com.topcoder.client.screening.tool.view.screeningClient.LaunchApplet.class"
           codebase="/contest/classes"
           name="LaunchApplet"
           archive="ScreeningClient.jar"
           HOST="<%=host%>"
           PORT="<%=port%>"
           TUNNEL="<%=tunnel%>"
           COMPANYID="<%=companyID%>"
           width="239"
           height="26"
           align="middle"
           vspace="0"
           hspace="0"
           scriptable="false"
           pluginspage="http://java.sun.com/j2se/1.3/jre/index.html">
<NOEMBED>
</NOEMBED>
</OBJECT>
         <b>You may minimize this browser window, but do not close it.</b>
          Doing so will close the applet.
        </td>
      </tr>
    </table>
  </body>
</html>
