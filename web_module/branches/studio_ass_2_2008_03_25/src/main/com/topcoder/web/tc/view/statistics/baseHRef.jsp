<%@page import="java.util.*, java.io.*" %>
<%--
 * @version $Revision$
 * @internal Log of Changes:
 *           $Log$
 *           Revision 1.1.2.1  2003/07/31 20:23:15  gpaul
 *           no message
 *
 *           Revision 1.1.2.1  2003/07/31 20:09:44  gpaul
 *           no message
 *
 *           Revision 1.1.1.1  2002/04/02 17:20:38  steveb
 *           initial web load into cvs
 *
 *           Revision 1.1.2.1  2002/03/16 20:19:14  gpaul
 *           moving these over from the member dev area.
 *
 *           Revision 1.4  2002/03/09 03:37:07  tbone
 *           updated
 *
 *           Revision 1.3  2002/02/08 03:21:42  tbone
 *           changed mapping
 *
 *           Revision 1.1  2002/02/07 18:53:02  tbone
 *           added to cvs
 *
 * 
--%>
<% StringBuffer sbHREF = new StringBuffer();
 	sbHREF.append(request.getScheme());
 	sbHREF.append("://");
//
// Need to use the server name from the client, not the server.
//
	sbHREF.append(request.getHeader("Host"));

String sServletBaseHREF = sbHREF.toString() + "/";
%>
<base href="<%= sServletBaseHREF %>">
