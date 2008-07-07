<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2005 TopCoder Open - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="/css/TCO05style.css"/>
<link type="text/css" rel="stylesheet" href="/css/tcStyles.css"/>
<link type="text/css" rel="stylesheet" href="/css/coders.css"/>
</head>
<body>

<!-- Tab barlinks-->
<jsp:include page="links.jsp" >
<jsp:param name="tabLev1" value="component"/>
<jsp:param name="tabLev2" value="design"/>
<jsp:param name="tabLev3" value="summary"/>
</jsp:include>

<table width="100%" border=0 cellpadding=0 cellspacing=0>
<!-- Body-->
   <tr valign=top>
      <td valign=top align=center>
      <div class="bodySpacer">
            
<span class="bigTitle">Component Design Finals Summary</span>
<br><br>
<div class="leadPhoto">
<span class="bodyText" align="center"><p align="center"><a href="/tc?module=Static&d1=tournaments&d2=tco05&d3=photos">See more photos!</a></p></span>
<img src="/i/tournament/tco05/onsite_photos/shot_design.jpg" alt="" class="photoFrameBig" /><br/>
</div>
<img src="/i/m/WishingBone_mug.gif" alt="" width="55" height="61" border="0" align="left" class="myStatsPhoto"/>
<p>by <tc-webtag:handle coderId="286907" context="algorithm"/><br/>
<em>TopCoder Member</em><br />
<br/><br/><br/>

The 2005 TopCoder Open design finalists were asked to produce an usual enhancement design for the Distributed Protocol Factory component. Three separate tasks were presented, from which each designer was required to choose one. Unlike the complexity of the requirement during the online round, the enhancement was geared specifically towards one feature in order to suit the timeframe of the onsite event.
<br><br>
The first task required message packets be compressed during transmission. The mechanism needed to be pluggable and the receiving party had to be able to properly restore the compressed message. The second task required certain nodes to bridge more than one group. The bridge node could work in either masked or unmasked mode, (the difference being whether response from the secondary group(s) affects the primary group -where a message initiates). The third task was about peer authentication. A node needed be capable of verifying that a message comes from trusted (authenticated) source.
<br><br>
Task one and three have something in common, in that they both ask for a new layer of protocol logic. The difference is that authentication will almost always involve extra message exchange for the handshake, while compression does not need to. There is a(?) certain submission that implements compression method negotiation but it is not mandatory. This makes the first task by far the most popular one. The second task is more interesting since the design(er?) has more freedom in choosing the approach. It can work in either the protocol domain or the application domain, but any of them would require the ability to reject a message exposed from lower layers.
<br><br>
As usual an enhancement design encourages efficiency and flexibility. Efficiency means the solution would reuse the original component as much as possible, and modify existing classes as little as possible. What makes the game more interesting is that the designers work upon their own solutions submitted during the online round. They need to judge which requirement can be integrated into their original architecture with minimum effort, so that they could possibly finish with time in hand to polish their work. Placing flexibility in the context of the protocol component, it's better if they can design a more generic enhancement, that can be layered with any implementation adhering to the protocol interfaces, rather than having to come up with merely an enhanced default implementation.
<br><br>
Minus the architectural factors presentation is also important: _ how accurate the diagrams reflect the solution; whether the algorithms are sound and clear, and whether documentation is error-free, etc. These are usually minor issues but a dozen such errors would result in a considerable loss on the scorecard.
<br><br>
All the TCO submissions were of relatively good quality. The winning submission implements the first task. Thanks to its original protocol stack based architecture, it effectively decouples each layer and guarantees minimum modification to the old classes. In addition, it provides a way to propagate parameterized codec to remote peers without requiring any further setup, as well as providing the option to send a message without compression. The documentation for the deliverables is fairly accurate and neat. These attributes make it stand out from the majority of the solutions.
        </div>
      </td>
        
         
<!-- Right Column-->
        <td width=170 align=right>
            <jsp:include page="../../public_right.jsp">
            <jsp:param name="level1" value="tco05"/>
            </jsp:include>
         </td>
      
   </tr>
   
</table>
   
   


<jsp:include page="../../foot.jsp" />

</body>

</html>
