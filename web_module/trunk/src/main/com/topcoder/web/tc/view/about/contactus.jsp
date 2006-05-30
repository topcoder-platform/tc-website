<%@  page
 language="java"
 errorPage="/errorPage.jsp"
  import="com.topcoder.common.web.data.Navigation,
          com.topcoder.shared.util.ApplicationServer"
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder - Contact us</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_main"/>
</jsp:include>

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">

<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="contact_us"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
        <td class="bodyText" width="99%"><img src="/i/clear.gif" width="400" height="1" vspace="5" border="0"><br>
      <jsp:include page="/page_title.jsp">
          <jsp:param name="image" value="about"/>
          <jsp:param name="title" value="Contact Us"/>
      </jsp:include>

<p>TopCoder is dedicated to servicing members, partnering companies, the media and anyone else interested in what 
TopCoder is about. Please contact the appropriate individuals below for more information or assistance.</p>

<div align="center">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
 <tr valign="top">
     <td width="50%" align="left" class="bodyText">
         <p><strong>Corporate Address</strong><br />
         TopCoder, Inc.<br/>
         703 Hebron Avenue<br/>
         Glastonbury, CT 06033 U.S.A.<br/>
         tel: 860.633.5540<br/>
         fax: 860.657.4276<br/>
         &#160;</p>
     </td>
         
     <td width="50%" align="left" class="bodyText">
         <p><strong>Contact us by email</strong><br />
         <A href="mailto:service@topcoder.com" class="bodyText">Membership</A><br />
         <A href="mailto:mluce@topcoder.com" class="bodyText">High School Competitions</A><br />
         <A href="mailto:service@topcoder.com" class="bodyText">General Questions</A><br />
         <A href="mailto:service@topcoder.com" class="bodyText">Competition Tech Support</A><br />
         <A href="mailto:service@topcodersoftware.com" class="bodyText">Software Tech Support</A></p>
     </td>
 </tr>
 
 <tr valign="top">
     <td width="50%" align="left" class="bodyText">
         <p><a href="mailto:sponsorship@topcoder.com" class="bodyText">Sponsorship and Private Label Events</a><br/>
         Paul Moriarty<br />
         tel: 860.633.5540<br />
         fax: 860.657.4276<br />
         &#160;</p>
     </td>
         
     <td width="50%" align="left" class="bodyText">
         <p><a href="mailto:jmckeown@topcoder.com" class="bodyText">Public Relations</a><br />
         Jim McKeown<br />
         tel: 860.633.5540<br />
         fax: 860.657.4276<br />
         &#160;</p>
     </td>
 </tr>

 <tr valign="top">
     <td width="50%" align="left" class="bodyText">
         <p><a href="mailto:service@topcoder.com" class="bodyText">TopCoder Arena / Web Site Technical Support </a><br />
         Mike Lydon<br />
         tel: 860.633.5540<br />
         fax: 860.657.4276<br />
         &#160;</p>
     </td>
         
     <td width="50%" align="left" class="bodyText">
         <p><a href="mailto:tces@topcoder.com" class="bodyText">Employment Services</a><br />
         Paul Moriarty<br />
         tel: 860.633.5540<br />
         fax: 860.657.4276<br />
         &#160;</p>
     </td>
 </tr>

 <tr valign="top">
     <td width="50%" align="left" class="bodyText">
         <p><a href="mailto:sales@topcodersoftware.com" class="bodyText">TopCoder Software</a><br />
         Mike Morris<br />
         tel: 866.TOP.CODE<br />
         fax: 860.657.4276<br />
         &#160;</p>
     </td>
         
     <td width="50%" align="left" class="bodyText">
         <p><a href="mailto:jdamato@topcoder.com" class="bodyText">Events / College Relations</a><br />
         Jessie D'Amato<br />
         tel: 860.633.5540<br />
         fax: 860.657.4276<br />
         &#160;</p>
     </td>
 </tr>
 <tr valign="top">
     <td width="50%" align="left" class="bodyText">
         <p><a href="mailto:mluce@topcoder.com" class="bodyText">High School Competitions</a><br />
         MaryBeth Luce<br />
         tel: 866.TOP.CODE<br />
         fax: 860.657.4276<br />
         &#160;</p>
     </td>
   </tr>

</table>

            <p><br></p>
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="about"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>
