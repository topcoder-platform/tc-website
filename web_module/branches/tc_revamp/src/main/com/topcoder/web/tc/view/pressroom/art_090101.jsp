<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Press Room</title>

<jsp:include page="../script.jsp" />
<jsp:include page="../style.jsp">
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
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="node" value="press_room"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
         <td width="100%" align="center">


            <table border="0" cellspacing="0" cellpadding="10" width="100%">
                <tr valign="top">
                    <td class="prText" width="100%"><img src="/i/clear.gif" alt="" width="400" height="1" border="0"/><br />
                    <jsp:include page="../page_title.jsp" >
                        <jsp:param name="image" value="press_room"/>
                        <jsp:param name="title" value="Article"/>
                    </jsp:include>
                        <div align="center">
						<div align="center"><IMG SRC="/i/pressroom/softdev_logo.gif" ALT="" border="0"/></div><BR/>
						<p><span class="bodyTitle">If You Build It, They Will Come&#8230;</span><BR/></p>
                        </div>
						The community-development-for-profit angle gets a new tilt.<BR/><BR/>
						TopCoder Inc., a company dedicated to rating and promoting computer programmers, has organized its first annual Invitational Programming Tournament. The competition, which will award $100,000 in prize money to one of its top 256 member programmers, kicked off its first online round of competition on September 19, 2001. A handful of MIT and Stanford students are currently among the leading contestants. Elimination rounds will whittle the group to 16 "top coders" to compete at Foxwoods Resort Casino in Connecticut on November 2 and 3, 2001.<BR/><BR/>
						Since its inception in March 2001, TopCoder has awarded $376,133 in prize money and garnered over 3,300 members. According to the company, their online and off-line Java and C++ programming competitions have attracted an elite group of software developers - and there's the rub. Access to the "powerful community of its members is granted to corporate partners who both promote, and profit from, the relationship."<BR/><BR/>
						What's Mine Is Mine?<BR/>
						While all code submitted to TopCoder competitions remains the property of the programmer, answers on the Web site's Frequently Asked Questions section are less reassuring regarding the privacy of contest participants. TopCoder isn't a nonprofit; the company defines itself as a "commercial endeavor" and intends to make money, in part, by charging corporate sponsors and subscribers for querying the competition statistics of its members (to date, none of TopCoder's competitions have yet garnered corporate support). Membership profiles and other information collected by TopCoder in competitions and elsewhere could be used for employment or marketing purposes.<BR/><BR/>
						The Web site declares that members have a right to keep "private information private, and to benefit any time someone uses [their] information." Developers could benefit by getting a chance to sharpen their programming skills and win cold cash. The cost? A possible flood of targeted marketing offers via snail mail and more spam in their in-box-if TopCoder's search for corporate partners succeeds.<BR/><BR/>
						- Tamara Carter<BR/><BR/>
            </TD></TR>                                                                 
<p><br></p>
                    </td>
                </tr>
            </table>
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
