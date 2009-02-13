<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder $HOME</title>

<jsp:include page="../../script.jsp" />

</head>

<body>

<jsp:include page="../../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../../includes/global_left.jsp">
                <jsp:param name="level1" value="my_home"/>
                <jsp:param name="level2" value="index"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->
 
<!-- Center Column Begins -->
         <td class="cardCell" width="100%" align="center">

         <div class="myTCBody">
        <jsp:include page="../page_title.jsp" >
            <jsp:param name="image" value="my_home"/>
            <jsp:param name="title" value="&#160;"/>
        </jsp:include>

            <table border=0 cellpadding=5 cellspacing=0 width="100%">
                <tr>
                    <td class="bodyText" valign=top width=150><A href="/Registration"><img src="/i/my_home/profile.gif" border=0/></A></td>
                    <td class="bodyText" valign=top>Want to make your member profile more personalized?  Click <A href="/Registration">here</A> to update your profile.  You can add or change your quote.  You can upload a personal photo of yourself so your peers know who they're competing with.  Do you already have a photo on the site, but it's so old you don't recognize yourself?  Just upload a new one.  You can even upload a resume to help the right recruiter find you.</td>
                </tr>
            </table>

            <br/>

            <table border=0 cellpadding=5 cellspacing=0 width="100%">
                <tr>
                    <td class="bodyText" valign=top width=150><A href="/tc?module=ViewReferrals"><img src="/i/my_home/referrals.gif" border=0/></A></td>
                    <td class="bodyText" valign=top>The TopCoder Referral Program increases the number of skilled coders who participate in TopCoder competitions, and rewards those members who spread the word. The referring member (you) will receive a referral commission equal to 10% of any amounts earned or won by the referred member during the 12 months following registration. Click <A href="/tc?module=ViewReferrals">here</A> to find out more.</td>
                </tr>
            </table>

            <br/>

            <table border=0 cellpadding=5 cellspacing=0 width="100%">
                <tr>
                    <td class="bodyText" valign=top width=150><A href="/tc?module=Static&d1=card&d2=description"><img src="/i/my_home/c_and_b.gif" border=0/></A></td>
                    <td class="bodyText" valign=top>Ever wanted to show off your TopCoder skills? Want that ace in the hole at your next job interview? The TopCoder <A href="/tc?module=Static&d1=card&d2=description">Member Badges and Cards</A> are the answer!  Choose a badge from our selection and put it on your website, resume, or even make a giant poster!  Our member cards are an exciting way to post your stats on your own website and offer a great tool for recruiters to look at.</td>
                </tr>
            </table>

            <br/>

            <table border=0 cellpadding=5 cellspacing=0 width="100%">
                <tr>
                    <td class="bodyText" valign=top width=150><A href="/tc?module=Static&d1=contracting&d2=index"><img src="/i/my_home/employmentOpps.gif" border=0/></A></td>
                    <td class="bodyText" valign=top>Register <A href="/tc?module=Static&d1=contracting&d2=index">here</A> to enroll in TopCoder Employment Opportunities.  Whether you're looking for just a couple days of work or a full-time permanent position, TopCoder can help set you up with work that matches both your skills and availability.</td>
                </tr>
            </table>

        </div>
        <p><br/></p>
        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../../foot.jsp" />

</body>

</html>
