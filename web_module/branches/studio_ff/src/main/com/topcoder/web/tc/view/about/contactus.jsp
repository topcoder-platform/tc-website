<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
    <title>TopCoder :: Contact Us</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="../script.jsp" />
    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tbody>
    <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="node" value="contact_us"/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
        <td width="100%" align="center" class="bodyColumn">
            <div class="fixedWidth700Body">

            <div>
                <p align="center"><a href="/tc?module=Static&amp;d1=about&amp;d2=contactus"><img src="/i/about/hdr_contactus.png" alt="Contact Us" /></a></p>
                
                <p align="center"><strong><span style="font:12px arial;">However big or small your company, however big or small your problem,</span><br />
                <img style="margin:10px;" src="/i/about/bnr_tc_solution.png" alt="TopCoder can help you find the solution." /><br />
                <span style="font:12px arial;">Every day we work with Fortune 500 companies, small businesses and individuals alike, <br />
                helping them tap into the resources of our Global Community to tackle issues just like yours.</span><br /><br />
                <span style="font:14px arial;">Send us an email, and let's talk about how TopCoder can work for you!</span></strong></p>
                
                <br />
                
                <div style="width:268px; float:left; margin-right:100px;">
<!--                
                    <div align="center"><img src="/i/about/hdr_contact_form.png" alt="Contact Form" /></div>
                    <br />
                    <form action="https://www.salesforce.com/servlet/servlet.WebToLead?encoding=utf-8" method="post">
                    
                        <input type=hidden name="oid" value="00D300000001UY4">
                        <input type=hidden name="retURL" value="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&amp;d1=about&amp;d2=contactusSuccess">
                        <input type=hidden name="lead_source" id="lead_source" value="Web" />
                        
                        <%--  ----------------------------------------------------------------------  --%>
                        <%--  NOTE: These fields are optional debugging elements.  Please uncomment   --%>
                        <%--  these lines if you wish to test in debug mode.                          --%>
                        <%--  <input type="hidden" name="debug" value=1>                              --%>
                        <%--  <input type="hidden" name="debugEmail" value="mpackard@topcoder.com">   --%>
                        <%--  ----------------------------------------------------------------------  --%>
                        
                        <table align="center" width="268px">
                            <tr>
                                <td style="font-size:11px;"><label for="first_name">First Name</label></td><td style="font-size:11px;"><label for="last_name">Last Name</label></td>
                            </tr>
                            <tr>
                                <td><input id="first_name" maxlength="40" name="first_name" type="text" style="width:90px;" /></td><td><input id="last_name" maxlength="80" name="last_name" type="text" style="width:160px;" /><br /></td>
                            </tr>
                            <tr>
                                <td colspan="2" style="font-size:11px;"><label for="email">Your Email Address</label></td>
                            </tr>
                            <tr>
                                <td colspan="2"><input id="email" maxlength="80" name="email" type="text" style="width:260px;" /><br /></td>
                            </tr>
                            <tr>
                                <td colspan="2" style="font-size:11px;"><label for="company">Company</label></td>
                            </tr>
                            <tr>
                                <td colspan="2"><input  id="company" maxlength="40" name="company" size="20" type="text" style="width:260px;" /><br /></td>
                            </tr>
                            <tr>
                            <tr>
                                <td colspan="2" style="font-size:11px;"><label for="state">State/Province</label></td>
                            </tr>
                            <tr>
                                <td colspan="2"><input  id="state" maxlength="20" name="state" size="20" type="text" style="width:260px;" /><br /></td>
                            </tr>
                            <tr>
                            <tr>
                                <td colspan="2" style="font-size:11px;"><label for="country">Country</label></td>
                            </tr>
                            <tr>
                                <td colspan="2"><input  id="country" maxlength="40" name="country" size="20" type="text" style="width:260px;" /><br /></td>
                            </tr>
                            <tr>
                            
                            
                                <td colspan="2" style="font-size:11px;">How Can We Help You?</td>
                            </tr>
                            <tr>
                                <td colspan="2"><textarea id="00N40000001mBlp" name="00N40000001mBlp" type="text" wrap="soft" style="width:260px; height:100px;"></textarea><br /></td>
                            </tr>
                            <tr>
                                <td colspan="2" style="font-size:11px;"><label for="phone"><span style="font-size:10px;">(optional)</span> Leave a phone number and we'll call you</label></td>
                            </tr>
                            <tr>
                                <td colspan="2"><input id="phone" maxlength="40" name="phone" type="text" style="width:260px;" /><br /></td>
                            </tr>
                        </table>
                        <br />
                        <%-- 
                        <p align="right"><input type="submit" name="submit"></p>
                        --%>
                        <p align="right"><input type="image" name="submit" img src="/i/about/btn_submit.png" alt="Submit"></p>
                    </form>
-->                    
                </div>
                
                <div style="width:314px; float:left;">
                    <div align="center"><img src="/i/about/hdr_corporate.png" alt="Corporate" /></div>
                    <p style="font:arial 14px;"><strong>TopCoder, Inc.</strong><br />
                    95 Glastonbury Blvd.<br />
                    Glastonbury, CT 06033 U.S.A.</p>
                    
                    <div align="center"><img src="/i/about/hdr_phonefax.png" alt="Phone and Fax" /></div>
                    <p style="font:arial 14px;"><strong>Speak to a TopCoder Representative Today</strong><br />
                    866.867.2633 or 860.633.5540<br />
                    Fax: 860.657.4276</p>
                    
                    <div align="center"><img src="/i/about/hdr_email.png" alt="Email" /></div>
                    <p style="font:arial 14px;"><a href="mailto:support@topcoder.com?subject=TopCoder Support &amp; Service">TopCoder Support &amp; Service</a><br />
                    <a href="mailto:media@topcoder.com?subject=Membia Request">Public Relations</a><br />
                    <a href="mailto:support@topcoder.com?subject=Member Questions">Member Questions</a></p>
                </div>
                
            
            </div>

            </div>
        </td>
<%-- Center Column Ends --%>
       
<%-- Right Column Begins --%>
        <td width="170">
            <jsp:include page="../public_right.jsp">
                <jsp:param name="level1" value="default"/>
            </jsp:include>
        </td>
<%-- Right Column Ends --%>
       
    </tr>
</tbody>
</table>

<jsp:include page="../foot.jsp" />

<script type="text/javascript" src="http://cetrk.com/pages/scripts/0004/0536.js"> </script>

</body>

</html>