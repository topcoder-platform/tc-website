<%@ page import="com.topcoder.web.privatelabel.Constants"%><html>
<head>
<title>Verizon Coding Contest Powered by TopCoder - Registration</title>
<jsp:usebean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />

<jsp:include page="../nocache.jsp"/>
<jsp:include page="../script.jsp" />

<script language="JavaScript" type="text/javascript" src="/js/verizon.js"></script>

</head>

<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" class="background">

<table border="0" cellspacing="0" cellpadding="0" class="black"  width="100%">
   <tr>

 <!-- Verizon logo-->
        <td width="147" valign="top"><a href="http://www22.verizon.com/"><img src="/i/events/verizon2003/logo_black_147x41.gif" width="147" height="37" alt="Verizon" border="0"></a></td>
        <td class="red"><img alt="" src="/images/spacer.gif" width="1" height="37"></td>
        <td valign="top" class="black" width="440"><img src="/i/events/verizon2003/vcc03_logo_secondary.gif" width="440" height="37" alt="Verizon Coding Contest" border="0"></td>
        <td class="red"><img alt="" src="/images/spacer.gif" width="1" height="37"></td>
        <td valign="top" class="black" width="99%"><img src="/i/events/verizon2003/pbtc_secondary.gif" width="134" height="37" alt="Contest Powered by TopCoder" border="0"></td>
    </tr>

<!-- Top Ad -->
    <tr>
      <td class="red" height="1" colspan="5"><img alt="" src="/images/spacer.gif" width="10" height="1"></td>
   </tr>

<table width="740" border="0" cellspacing="0" cellpadding="0">
    <tr>

<!-- Left Column Begins -->
        <td valign="top" width="146">
            <table width="146" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td width="146" class="white" align="center"><img src="/i/events/verizon2003/ps_banner.jpg" width="146" height="61" border="0" alt="Verizon Coding Contest">

                        <jsp:include page="../verizon/verizon_links_secondary.jsp" />

                    </td>
                </tr>
            </table>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="14"><img src="/i/clear.gif" width="14" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column -->
        <td valign="top" width="579"><img src="/i/clear.gif" width="574" height="10" border="0"/><br />
            <table width="427" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="427" class="bodyCopy">

<p><font size="-1">
<br/>

In order to be eligible to compete in the Verizon Coding Challenge,
you must activate your account by following the directions sent to the email
address provided during registration. You <u>will not</u> be able to compete if you
do not activate your account.

<br/><br/>

<b><font color="#FF0000">OPTIONAL:</font></b> If you would like to upload a resume, click <a href="JavaScript:void window.open('<jsp:getProperty name="sessionInfo" property="ServletPath"/>resume?&<%=Constants.MODULE_KEY%>=ViewUpload&<%=Constants.COMPANY_ID%>=1747','Resume_Upload','top=2,left=2,width=350,height=300,status=0');">here</a><br/><br/>

<br/><br/>

Spend time in the Practice Rooms prior to the Qualification Round by clicking the Practice Arena tab above.<br/><br/>

Good luck to you in the Arena!
</font></p>
                    </td>
                    
<!-- Gutter Begins -->
                    <td width="14"><img src="/i/clear.gif" width="14" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
<jsp:include page="../verizon/verizon_right.jsp" />
<!-- Right Column Ends -->

                </form></tr>
            </table>
        </td>
   </tr>
</table>

<!-- Footer Begins -->
<jsp:include page="../verizon/verizon_foot.jsp" />
<!-- Footer Ends -->

</body>
</html>
