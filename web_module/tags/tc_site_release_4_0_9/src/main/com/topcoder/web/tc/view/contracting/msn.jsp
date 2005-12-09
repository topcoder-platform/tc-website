<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Employment Opportunities</title>

<jsp:include page="../script.jsp" />

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="employment"/>
                <jsp:param name="level2" value="openings"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
        <td class="cardCell" width="100%" align="center">

        <div class="myTCBody">
        <jsp:include page="../page_title.jsp" >
            <jsp:param name="image" value="employmentOpps"/>
            <jsp:param name="title" value="&#160;"/>
        </jsp:include>

      <div align="center">
      <img src="/i/contracting/msn_logo.gif" border=0/>
      </div>
<p align="center">
<a href="/tc?module=JobHit&jid=324&jt=4">Apply now</A>
&#160;|&#160;<A href="/tc?module=Static&d1=contracting&d2=msn_chat_111905">SRM 272 Chat Transcript</A>
</p>

<p>
<b>Did you...</b><br>
...know that one of the main reasons why MSN.com is thrilled to be working with TopCoder is because of <b>YOU</b>, the dedicated, creative and brilliant TopCoder members.  
<br><br>
<b>Do you...</b><br>
...know that we are confident, that <b>YOU</b> are the individuals who possess the ability to solve the technical challenges of the future, which the world has yet to encounter?
<br><br>
<b>Have you...</b><br>
 ...ever stopped to think what it would be like to join MSN.com and help us make our 380+ million unique user's lives more enriched on a daily basis?
<br><br>
<b>Would you...</b><br>
...like to be surrounded by 800+ technical geniuses each day, while you think of, work on, and develop solutions to the world's toughest technical problems, that less then a handful of companies today face?
<br><br>
<b>Is there...</b><br>
...additional information to help you prepare for your conversations with MSN.com?  
<br><br>
<b>Absolutely...</b><br>
...MSN has 400+ million monthly unique users worldwide who come to MSN to connect with information and people that matter most to them.
<br><br>
...With Localized versions available globally in 41 markets and 20 languages, MSN is a world leader in delivering web services to consumers and advertising solutions to businesses worldwide.
<br><br>
...MSN also has grown from our early days of having less than 1 million dial-up customers to 9.1 million subscribers.
<br><br>
...Scalability, Reliability, Privacy and Security are just a few of the things that our developers think about each and every time they begin to focus on a new and exciting technical solutions.
<br><br>
<div align="center">
<b>These are just some of an endless list of reasons why<br> 
we would love to speak with you further<br>
about the employment opportunities that MSN.com has to offer.</b>
</div>
<br><br>
<b>What steps...</b><br>
...do you need to take in order for us to give you a call?  
<br><br>
...the solution to this problem is actually quite simple...  <a href="/tc?module=JobHit&jid=324&jt=4">apply now</A> to be contacted by MSN!
<br><br>
By clicking "apply now" above you will be notifying TopCoder of your interest to be contacted by TopCoder representatives to learn more about MSN’s current career opportunities.  TopCoder will NOT share your information without your prior approval.

        <p><br></p>
        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
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
