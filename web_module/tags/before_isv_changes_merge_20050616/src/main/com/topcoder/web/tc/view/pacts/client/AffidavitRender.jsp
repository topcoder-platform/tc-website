<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
   <meta name="GENERATOR" content="Mozilla/4.77 [en] (X11; U; Linux 2.4.17 i686) [Netscape]">
</head>
<body>

<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.common.*" %>

<%

    String affidavitText = null;
    try {
        affidavitText = (String)
	    request.getAttribute(PactsConstants.PACTS_MEMBER_RESULT);
        int idx = affidavitText.indexOf("FILL IN AGED");
        if (idx>=0)
            affidavitText = affidavitText.substring(0,idx) + "______" + affidavitText.substring(idx+("FILL IN AGED").length());
        idx = affidavitText.indexOf("FILL IN BELOW");
        if (idx>=0)
            affidavitText = affidavitText.substring(0,idx) + "_________________________" + affidavitText.substring(idx+("FILL IN BELOW").length());

    } catch (Exception e) {
	out.println("We caught an exception " + e);
	affidavitText = null;
    }

    if(affidavitText!=null) {
	out.print(affidavitText);
    } else {
	out.print("did not get affidavit");
    }
%>


</body>
</html>