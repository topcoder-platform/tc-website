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
                <jsp:param name="level1" value="my_home"/>
                <jsp:param name="level2" value="employmentOpps"/>
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
      <img src="/i/contracting/jumptrading_logo.gif" border=0/>
		</div>

		<p>
      <span class="bodySubtitle">Professional Trader</span>
      <br/><br/>
      Trading at Jump is about being in control of your own destiny and being the best you can possibly be at what you do. Nowhere is the entrepreneurial spirit more alive than in the profession of trading, and Jump does everything possible to nurture that entrepreneurial spirit. We believe people are best able to fulfill their potential when their performance is rewarded on the basis of merit. As a trader at Jump you will be part of a challenging and dynamic working environment. Each trade brings with it a new problem to be solved, and the better you are at solving the problem, the better you will be at trading.
      <br/><br/>
      As a new trader at Jump, we will teach you how to trade while you are on salary. You will be a proprietary trader for the house's account, electronically trading a variety of products, including Dow, Nasdaq, and S&P futures. As a member of Jump's team, you will have access to our electronic trading systems and trading methodology. You will have the advantage of learning in a simulated environment until you have had enough consecutive profitable days to go 'live'. Throughout your career at Jump, experienced traders will be available to help you analyze your individual trades, your overall trading style, and to help you become as successful as possible.
      <br/><br/>
      As technology is becoming more important in the electronic trading world, it is crucial that candidates possess outstanding programming skills. C++ and Visual Basic are required.
      <br/><br/>
      We are looking for driven, competitive, academically successful candidates. Ideally, candidates will have a GPA of 3.5 or higher.
      <br/><br/>
      Location: Chicago, IL
      <br/><br/>
      <a href="/tc?module=JobHit&jid=267&jt=4">Register for this position here!</a>
		<br/><br/>
		</p>

        </div>
        <p><br/></p>
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
