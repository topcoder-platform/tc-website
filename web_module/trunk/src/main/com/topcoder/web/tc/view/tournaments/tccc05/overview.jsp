<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2005 TopCoder Collegiate Challenge - Computer Programming Tournament</title>

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
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="level1" value="events"/>
                <jsp:param name="level2" value="tournaments"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
         <td class="bodyText" width="100%">

<table width="550" align="center" border="0" cellpadding="0" cellspacing="10">
	<tr><td colspan="2" class="bodyText">
		<div align="center"><img src="/i/tournament/tccc05/monitor_logo.jpg" width="424" height="336" border="0"/></div>

		<p><strong>The 2005 TopCoder Collegiate Challenge is an international programming tournament that<br/>
		will bring together some of the world's best young minds in head-to-head competition. The tournament has two tracks:</strong></p>

	</td></tr>
	<tr>
		<td valign="top">
            <table width="250" height="750" align="center" border="0" cellpadding="5" cellspacing="2" class="sidebarBox">
                <tr >
                    <td class="sidebarTitle">ALGORITHM COMPETITION</td>
                </tr>

                <tr>
                    <td class="sidebarText">WHAT:<br/>
                    	<ul>
                    		<li>A timed coding competition with immediate results</li>
                    	</ul>
                    </td>
                </tr>

                <tr>
                    <td class="sidebarText">WHEN:

                    	<ul>
                    		<li>Registration opens - December 20, 2004</li>
							<li>One qualification round - January 11-12, 2005 </li>
							<li>Four elimination rounds - January 15, 19, 26, February 2, 2005</li>
							<li>Semifinal and Championship rounds - March 10 & 11, 2005 </li>
						</ul>

					</td>
                </tr>

                <tr>
                    <td class="sidebarText">WHERE:
                    	<ul>
                    		<li>One qualification round - Online</li>
							<li>Four elimination rounds - Online </li>
							<li>Semifinal and Championship rounds - Santa Clara, CA </li>
						</ul>
					</td>
                </tr>

                <tr>
                    <td class="sidebarText">PRIZES:
                    	<ul>
                    		<li>$60,000 cash prize purse</li>
							<li><strong>Champion will receive $20,000</strong></li>
							<li>Participatory t-shirt, branded with sponsor logos </li>
						</ul>

					</td>
                </tr>

                <tr>
                    <td class="sidebarText">WHO CAN PARTICIPATE:
                    	<ul>
                    		<li>Any TopCoder member* who is 18 years of age or older and a matriculated full-time student at an accredited college or university can participate</li>
							<li>The top 24 finishers in the online rounds will advance to the onsite Semifinal and Championship rounds</li>
						</ul>
						<p>*If you're not already a TopCoder member<br/><a href="/reg/index.jsp">click here</a> to register.</p>
					</td>
                </tr>
            </table>
		</td>
		<td>
            <table width="250" height="750" align="center" border="0" cellpadding="5" cellspacing="2" class="sidebarBox">
                <tr>
                    <td class="sidebarTitle">COMPONENT COMPETITION</td>
                </tr>

                <tr>
                    <td class="sidebarText">WHAT:<br/>
                    	<ul>
                    		<li>A competition to design and develop functional, reusable software components</li>
                    	</ul>
                    </td>
                </tr>

                <tr>
                    <td class="sidebarText">WHEN:
                    	<ul>
                    		<li>Registration opens - December 20, 2004</li>
							<li>Participation rounds - January 3, 2004 - February 3, 2005</li>
							<li>Championship round - March 10, 2005</li>
						</ul>
					</td>
                </tr>

                <tr>
                    <td class="sidebarText">WHERE:
                    	<ul>
                    		<li>Participation rounds - Online</li>
							<li>Championship round - Onsite - Santa Clara, CA</li>
						</ul>
					</td>
                </tr>

                <tr>
                    <td class="sidebarText">PRIZES:
                    	<ul>
                    		<li>$90,000 cash prize purse</li>
							<li><strong>Design Champion will receive $25,000; Development Champion will receive $13,000</strong></li>
							<li>Participatory t-shirt, branded with sponsor logos</li>
						</ul>
					</td>
                </tr>

                <tr>
                    <td class="sidebarText">WHO CAN PARTICIPATE:
                    	<ul>
                    		<li>Any TopCoder member* who is 18 years of age or older and a matriculated full-time student at an accredited college or university can participate</li>
							<li>The top 4 Designers and the top 4 Developers will advance to the onsite Championship Round.</li>
						</ul>
						*If you're not already a TopCoder member<br/><a href="/reg/index.jsp">click here</a> to register.
					</td>
                </tr>


            </table>
        </td>
     </tr>
     <tr><td colspan="2" class="bodyText">

		<p><strong>If you're a Student Rep for the TCCC05, <a href="/tc?module=TCCC05StudentReps">click here</a> to view your referral count. </strong></p>



	</td></tr>
</table>






         <p><br/></p>
         </td>
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../../public_right.jsp">
               <jsp:param name="level1" value="tccc05"/>
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
