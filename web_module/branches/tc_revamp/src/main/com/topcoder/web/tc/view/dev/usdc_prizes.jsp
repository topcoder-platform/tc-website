<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
<title>Ultimate Software Development Contest</title>

<jsp:include page="/script.jsp"/>
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value="development"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="topcoder_tournaments"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
<td class="bodyText" WIDTH="100%"><img src="/i/clear.gif" width="400" height="1" vspace="5" border="0"><br />


<!-- Tab bar links-->
<jsp:include page="usdc_links.jsp" >
   <jsp:param name="selectedTab" value="prizes"/>
</jsp:include>


<h2>Prizes</h2>
<ul><li><a href="#design">Design Prizes</a></li>
<li><a href="#development">Development Prizes</a></li></ul>
<a name="design"></a>
<h3><a href="#top"><img src="/i/tournament/tccc04/back_to_top.gif" alt="back to top" width="83" height="23" border="0" align="right">
            </a>Design Prizes</h3>			
<p align="center"><strong>*Prizes are in addition to component payments.*</strong></p>
			<table width="550" align="center" border="0" cellpadding="5" cellspacing="2" class="sidebarBox">
                <tr>
                    <td colspan="2" class="sidebarTitle"><strong>Design Contest</strong> - The Design contest will award the following prizes:</td>
                </tr>
                
                <tr>
                    <td width="20%" class="sidebarText" valign="top"><strong>Weekly Prizes</strong></td>
                    <td width="80%" class="sidebarText"><strong>$1,200 each week</strong><br/>
                    The following Weekly Prizes will be awarded to the designer who:
                    <ol>
                    <li>Is the first to submit a component with a winning review score:	$300</li>
                    <li>Receives the highest passing score for a Level 1 component: $250</li>
                    <li>Receives the highest passing score for a Level 2 component:	$350</li>
                    <li>Submits the most solutions with passing scores (min. of 2):	$300</li>
                    </ol>
                    </td>
                </tr>
                
                <tr>
                    <td width="20%" class="sidebarText" valign="top"><strong>Monthly Prizes</strong></td>
                    <td width="80%" class="sidebarText"><strong>$3,500 each month*</strong><br/>
                    The following Monthly Prizes will be awarded to the 3 designers with the highest placement score achieved during the month (min. of 3 submissions):
                    <ol>
                    <li>First Place: $2,000</li>
                    <li>Second Place: $1,000</li>
                    <li>Third Place: $500</li>
                    </ol>
                    </td>
                </tr>
                
                <tr>
                    <td width="20%" class="sidebarText" valign="top"><strong>Quarterly Prizes</strong></td>
                    <td width="80%" class="sidebarText"><strong>$9,000 each quarter*</strong><br/>
                    The following Quarterly Prizes will be awarded to the 3 designers with the highest placement score achieved during the quarter (min. of 8 submissions):	
                    <ol>
                    <li>First Place: $6,000</li>
                    <li>Second Place: $2,000</li>
                    <li>Third Place: $1,000</li>
                    </ol>
                    </td>
                </tr>
            </table>
            <p>*View scoring details <a href="/tc?module=Static&d1=dev&d2=usdc_rules">here</a>.</p>  
                    
            <img src="/i/clear.gif" width="400" height="10" vspace="5" border="0">
            <a name="development"></a>
            <h3><a href="#top"><img src="/i/tournament/tccc04/back_to_top.gif" alt="back to top" width="83" height="23" border="0" align="right">
            </a>Development Prizes</h3>
			<p align="center"><strong>*Prizes are in addition to component payments.*</strong></p>
			<table width="550" align="center" border="0" cellpadding="5" cellspacing="2" class="sidebarBox">
                <tr>
                    <td colspan="2" class="sidebarTitle"><strong>Development Contest</strong> - The Development contest will award the following prizes:</td>
                   
                </tr>                
                
                <tr>
                    <td width="20%" class="sidebarText" valign="top"><strong>Weekly Prizes</strong></td>
                    <td width="80%" class="sidebarText"><strong>$400 each week</strong><br/>
                    The following Weekly Prizes will be awarded to the Developer who:
                    <ol>
                    <li>Is the first to submit a component with a winning review score:	$100</li>
                    <li>Receives the highest passing score for a Level 1 component: $75</li>
                    <li>Receives the highest passing score for a Level 2 component:	$125</li>
                    <li>Submits the most solutions with passing scores (min. of 2):	$100</li>
                    </ol>
                    </td>
                </tr>
                
                <tr>
                    <td width="20%" class="sidebarText" valign="top"><strong>Monthly Prizes</strong></td>
                    <td width="80%" class="sidebarText"><strong>$1,750 each month*</strong><br/>
                    The following Monthly Prizes will be awarded to the 3 developers with the highest placement score achieved during the month (min. of 3 submissions):
                    <ol>
                    <li>First Place: $1,000</li>
                    <li>Second Place: $500</li>
                    <li>Third Place: $250</li>
                    </ol>
                    </td>
                </tr>
                
                <tr>
                    <td width="20%" class="sidebarText" valign="top"><strong>Quarterly Prizes</strong></td>
                    <td width="80%" class="sidebarText"><strong>$4,500 each quarter*</strong><br/>
                    The following Quarterly Prizes will be awarded to the 3 developers with the highest placement score achieved during the quarter (min. of 8 submissions):		
                    <ol>
                    <li>First Place: $3,000</li>
                    <li>Second Place: $1,000</li>
                    <li>Third Place: $500</li>
                    </ol>
                    </td>
                </tr>
            </table>
            <p>*View scoring details <a href="/tc?module=Static&d1=dev&d2=usdc_rules">here</a>.</p>  
			<p></br></p>
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
         <td width="180">
            <jsp:include page="../public_right.jsp">
        <jsp:param name="level1" value="default"/>
    </jsp:include>

         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="2"><img src="/i/clear.gif" width="2" height="1" border="0"></td>
<!-- Gutter Ends -->

    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>
