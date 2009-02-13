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
						<div align="center"><IMG SRC="/i/pressroom/geek_com.gif" ALT="" border="0"/></div><BR/>
						<p><span class="bodyTitle">Coding competition for cash</span><BR/></p>
                        </div>
						posted 9:53am EST Thu Aug 30 2001<BR/><BR/>
						<b>NEWS</b><BR/>
						TopCoder.com's 2001 Invitational Programming Tournament is set to begin on September 12. Cash prizes will come from a US$250,000 purse, with $100,000 going to the winner. By registering on the TopCoder.com website, U.S. residents (including Guam, Puerto Rico, and the U.S. Virgin Islands) and Canadian residents (except for Quebec folks) 18 or over who program in Java or C++ can compete in qualifying contests to get into the top 256 rated programmers on the site. Those 256 contestants will compete online as the field is narrowed to 16. Those 16 will then be brought to the Foxwoods Resort Casino in Connecticut for the final competition on November 2nd and 3rd. This is TopCoder's second large-scale programming contest; in June of this year, Jason Woolever from M.I.T. got $100,000 as the winner of the 2001 TopCoder Collegiate Challenge.<BR/><BR/>
						Founded last year, TopCoder.com is a programming community/business "committed to identifying and promoting top-notch computer programming talent." The site's founders wanted to come up with some objective way of differentiating "the best in the profession ... from the rest of the pack" to help great programmers get the salaries they deserve. The various competitions TopCoder sponsors (mostly online) serve as that skill ranking mechanism and offer cash incentives to winners (single-round matches can get you $300). Even if you don't satisfy the competition requirements above, you can still participate in Round Tables and observe the competitions, and you also get access to employment opportunities offered to/by select corporate partners.<BR/><BR/>
						Very simply, TopCoder competitions have three phases:<BR/><ul>
						<li>Coding, where all participants get an hour to code and submit solutions to three algorithmic problems (easy, medium, and difficult)</li><BR/>
						<li>Challenge, where you can pick apart other contestants' submissions; successful challenges are rewarded with points, while those successfully challenged lose them</li><BR/>
						<li>System-Testing, where Challenge survivors' submissions are tested automatically on the TopCoder server</li></ul><BR/>
						The scoring procedure (an "objective assessment model and unique rating system") is detailed and extensively outlined on the website, focusing on "intensity, or the ability to use a particular coding language while under the pressure of competition; and velocity, the ability to write good code quickly and accurately." The rights to submitted solutions remain with the contestants, but TopCoder gets a "perpetual, royalty-free, irrevocable, non-exclusive right and license to use, reproduce and publish such code."<BR/><BR/>
						Registration (asking for General Information, Education, Experience, and Skills) is free, and there are some upcoming Single Round Matches on September 4, 6, 10, and 17. Please see TopCoder.com for much more detail.<BR/><BR/>
						<b>SAM'S OPINION</b><BR/>
						If you're a C++ or Java programmer this sounds like a no-lose experience. If you're good, you might actually win some money for working on basic algorithm solutions; if you're not, you can get better by watching people dissect your code and participating in Round Tables and such. If you submit code that you're particularly proud of, it's still yours to do with as you will, so even if TopCoder has some nefarious dudes in the background assembling good algorithm solutions into some sort of super program the company will sell later, you can still put your own competitive version out there. :)<BR/><BR/>
						I'd never heard of this site before, but it seems like a really great idea all around. I'm not sure if the founders' desire to set up some sort of objective programmer rating system will really impact programmers' salaries, but I imagine it couldn't hurt to stick your TopCoder rating or current standing on a resume ... the concept is certainly excellent. I'm also not clear on how partner corporations benefit from being partners with TopCoder (besides getting some access to good programming talent), but the site doesn't seem to hold anything back in terms of detail (check out the website--you won't believe how much info is there), so I'd be surprised if there were anything shady going on.<BR/><BR/>
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
