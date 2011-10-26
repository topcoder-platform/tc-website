<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder - Help</title>

<jsp:include page="../script.jsp" />
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
            <jsp:param name="node" value="algo_how_to_compete"/>
         </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
        <td width="100%" align="left" class="bodyText">
         <jsp:include page="../page_title.jsp" >
         <jsp:param name="image" value="alg_support_faqs"/>
         <jsp:param name="title" value="How to Compete"/>
         </jsp:include>

        <h2>How to Compete</h2>

        <p><span class="bodySubtitle"><a href="/tc?module=Static&d1=help&d2=getStarted">General TopCoder Arena Usage / Getting Started</a></span><br/>
            <span class="outline1">1 <a href="/tc?module=Static&d1=help&d2=getStarted#becomemember">Become a TopCoder Member</a></span><br/>
            <span class="outline1">2 <a href="/tc?module=Static&d1=help&d2=getStarted#whatisarena">What is the TopCoder Arena?</a></span><br/>
            <span class="outline1">3 <a href="/tc?module=Static&d1=help&d2=getStarted#howtorun">How to Run the TopCoder Arena</a></span><br/>
                <span class="outline2">3.1 <a href="/tc?module=Static&d1=help&d2=getStarted#whatsoftware">What software will you need to install?</a></span><br/>
                <span class="outline2">3.2 <a href="/tc?module=Static&d1=help&d2=getStarted#runningarena">Running the TopCoder Arena as an Applet or by using Java Web Start</a></span><br/>
                <span class="outline2">3.3 <a href="/tc?module=Static&d1=help&d2=getStarted#localfirewall">Local Firewall and Network Considerations</a></span><br/>
                <span class="outline2">3.4 <a href="/tc?module=Static&d1=help&d2=getStarted#httptunneling">HTTP Tunneling</a></span><br/>
            <span class="outline1">4 <a href="/tc?module=Static&d1=help&d2=getStarted#loggingin">Logging in to the TopCoder Arena</a></span><br/>
            <span class="outline1">5 <a href="/tc?module=Static&d1=help&d2=getStarted#generalusage">General Usage and the Various Lobbies</a></span><br/>
            <span class="outline1">6 <a href="/tc?module=Static&d1=help&d2=getStarted#chatting">Chatting / Asking Questions</a></span><br/>
                <span class="outline2">6.1 <a href="/tc?module=Static&d1=help&d2=getStarted#generalchat">General Chat</a></span><br/>
                <span class="outline2">6.2 <a href="/tc?module=Static&d1=help&d2=getStarted#replyto">ReplyTo</a></span><br/>
                <span class="outline2">6.3 <a href="/tc?module=Static&d1=help&d2=getStarted#whisper">Whisper</a></span><br/>
                <span class="outline2">6.4 <a href="/tc?module=Static&d1=help&d2=getStarted#admin">Admin</a></span><br/>
                <span class="outline2">6.5 <a href="/tc?module=Static&d1=help&d2=getStarted#autochat">Auto-Enhanced Chat</a></span><br/>
                <span class="outline2">6.6 <a href="/tc?module=Static&d1=help&d2=getStarted#emoting">Emoting</a></span><br/>
            <span class="outline1">7 <a href="/tc?module=Static&d1=help&d2=getStarted#othermembers">Other Members in the Arena</a></span><br/>
                <span class="outline2">7.1 <a href="/tc?module=Static&d1=help&d2=getStarted#getinfo">Getting Information about another Member</a></span><br/>
                <span class="outline2">7.2 <a href="/tc?module=Static&d1=help&d2=getStarted#findmember">Finding Another Member</a></span><br/>
                <span class="outline2">7.3 <a href="/tc?module=Static&d1=help&d2=getStarted#seemembers">Seeing Who's in the Arena</a></span><br/>
            <span class="outline1">8 <a href="/tc?module=Static&d1=help&d2=getStarted#movingaround">Moving Around</a></span><br/>
            <span class="outline1">9 <a href="/tc?module=Static&d1=help&d2=getStarted#leaderboard">The Leader Board</a></span><br/>

        <p><span class="bodySubtitle"><a href="/tc?module=Static&d1=help&d2=pracArena">Practicing / Training in the TopCoder Arena</a></span><br/>
            <span class="outline1">1 <a href="/tc?module=Static&d1=help&d2=pracArena#practicerooms">The Practice Rooms</a></span><br/>
                <span class="outline2">1.1 <a href="/tc?module=Static&d1=help&d2=pracArena#timing">Timing in the Practice Room</a></span><br/>
                <span class="outline2">1.2 <a href="/tc?module=Static&d1=help&d2=pracArena#selectingproblems">Selecting a Problem</a></span><br/>
                <span class="outline2">1.3 <a href="/tc?module=Static&d1=help&d2=pracArena#systemtesting">System Testing</a></span><br/>
                <span class="outline2">1.4 <a href="/tc?module=Static&d1=help&d2=pracArena#roomsummary">The Room Summary</a></span><br/>
                <span class="outline2">1.5 <a href="/tc?module=Static&d1=help&d2=pracArena#challenging">Challenging</a></span><br/>
                <span class="outline2">1.6 <a href="/tc?module=Static&d1=help&d2=pracArena#clearingproblems">Clearing Problems</a></span><br/>

        <p><span class="bodySubtitle"><a href="/tc?module=Static&d1=help&d2=ratedEvent">Competing in a Rated Event</a></span><br/>
            <span class="outline1">1 <a href="/tc?module=Static&d1=help&d2=ratedEvent#when">When are the Rated Events?</a></span><br/>
            <span class="outline1">2 <a href="/tc?module=Static&d1=help&d2=ratedEvent#differ">How does a Rated Event Differ from the Practice Room?</a></span><br/>
            <span class="outline1">3 <a href="/tc?module=Static&d1=help&d2=ratedEvent#registration">Registration for a Single Round Match</a></span><br/>
            <span class="outline1">4 <a href="/tc?module=Static&d1=help&d2=ratedEvent#divisions">Division One versus Division Two</a></span><br/>
            <span class="outline1">5 <a href="/tc?module=Static&d1=help&d2=ratedEvent#roomassignments">Room Assignments - Getting to Your Room</a></span><br/>
            <span class="outline1">6 <a href="/tc?module=Static&d1=help&d2=ratedEvent#phases">The Phases of a Rated Event</a></span><br/>
                <span class="outline2">6.1 <a href="/tc?module=Static&d1=help&d2=ratedEvent#coding">The Coding Phase</a></span><br/>
                <span class="outline2">6.2 <a href="/tc?module=Static&d1=help&d2=ratedEvent#challenge">The Challenge Phase</a></span><br/>
                <span class="outline2">6.3 <a href="/tc?module=Static&d1=help&d2=ratedEvent#systemtesting">The System-Testing Phase</a></span><br/>
            <span class="outline1">7 <a href="/tc?module=Static&d1=help&d2=ratedEvent#codeobfuscation">Code Obfuscation</a></span><br/>
            <span class="outline1">8 <a href="/tc?module=Static&d1=help&d2=ratedEvent#extracoderule">Excessive / Extra Code Rule</a></span><br/>
            <span class="outline1">9 <a href="/tc?module=Static&d1=help&d2=ratedEvent#broadcastmessages">Broadcast Messages</a></span><br/>
            <span class="outline1">10 <a href="/tc?module=Static&d1=help&d2=ratedEvent#status">Getting the Status of Other Competitors</a></span><br/>
                <span class="outline2">10.1 <a href="/tc?module=Static&d1=help&d2=ratedEvent#leaderboard">The Leader Board</a></span><br/>
                <span class="outline2">10.2 <a href="/tc?module=Static&d1=help&d2=ratedEvent#roomsummary">The Room Summary Window</a></span><br/>
            <span class="outline1">11 <a href="/tc?module=Static&d1=help&d2=ratedEvent#gettinghelp">Getting Help</a></span><br/>
            <span class="outline1">12 <a href="/tc?module=Static&d1=help&d2=ratedEvent#score">Determining Score</a></span><br/>
            <span class="outline1">13 <a href="/tc?module=Static&d1=help&d2=ratedEvent#ratingchanges">Rating Changes</a></span><br/>
            <span class="outline1">14 <a href="/tc?module=Static&d1=help&d2=ratedEvent#websitestats">Web Site Statistics</a></span><br/>
            <span class="outline1">15 <a href="/tc?module=Static&d1=help&d2=ratedEvent#problems">Problems in the Practice Rooms</a></span><br/>
            <span class="outline1">16 <a href="/tc?module=Static&d1=help&d2=ratedEvent#donotagree">What if You Do Not Agree with the Results?</a></span><br/>
            <span class="outline1">17 <a href="/tc?module=Static&d1=help&d2=ratedEvent#problemanalysis">Problem Set Analysis and Discussion</a></span><br/>
            <span class="outline1">18 <a href="/tc?module=Static&d1=help&d2=ratedEvent#disconnected">Getting Disconnected from the Arena</a></span><br/>
            <span class="outline1">19 <a href="/tc?module=Static&d1=help&d2=ratedEvent#cheating">Cheating at TopCoder</a></span><br/>
            <span class="outline1">20 <a href="/tc?module=Static&d1=help&d2=ratedEvent#prewrittencode">Using Pre-Written Code</a></span><br/>
            <span class="outline1">21 <a href="/tc?module=Static&d1=help&d2=ratedEvent#arenaplugins">TopCoder Arena Plug-ins</a></span><br/>

        <p><span class="bodySubtitle"><a href="/tc?module=Static&d1=help&d2=codingWindow">The Coding Window</a></span><br/>
            <span class="outline1">1 <a href="/tc?module=Static&d1=help&d2=codingWindow#problemstatement">The Problem Statement</a></span><br/>
            <span class="outline1">2 <a href="/tc?module=Static&d1=help&d2=codingWindow#language">Choosing a Language</a></span><br/>
            <span class="outline1">3 <a href="/tc?module=Static&d1=help&d2=codingWindow#createsolution">Creating a Solution</a></span><br/>
            <span class="outline1">4 <a href="/tc?module=Static&d1=help&d2=codingWindow#compiling">Compiling</a></span><br/>
            <span class="outline1">5 <a href="/tc?module=Static&d1=help&d2=codingWindow#usertesting">User Testing</a></span><br/>
            <span class="outline1">6 <a href="/tc?module=Static&d1=help&d2=codingWindow#submitting">Submitting</a></span><br/>
            <span class="outline1">7 <a href="/tc?module=Static&d1=help&d2=codingWindow#saving">Saving</a></span><br/>
            <span class="outline1">8 <a href="/tc?module=Static&d1=help&d2=codingWindow#clearingcode">Clearing the Code</a></span><br/>
            <span class="outline1">9 <a href="/tc?module=Static&d1=help&d2=codingWindow#thetimer">The Timer</a></span><br/>

        <p><span class="bodySubtitle"><a href="/tc?module=Static&d1=help&d2=problemArguments">The Problem Arguments Window</a></span><br/>
            <span class="outline1">1 <a href="/tc?module=Static&d1=help&d2=problemArguments#examples">Examples</a></span><br/>
            <span class="outline1">2 <a href="/tc?module=Static&d1=help&d2=problemArguments#simpledata">Simple Data Types</a></span><br/>
            <span class="outline1">3 <a href="/tc?module=Static&d1=help&d2=problemArguments#complexdata">Complex Data Types</a></span><br/>

        <p><span class="bodySubtitle"><a href="/tc?module=Static&d1=help&d2=roomSummary">The Room Summary Window</a></span><br/>
            <span class="outline1">1 <a href="/tc?module=Static&d1=help&d2=roomSummary#spectating">Spectating</a></span><br/>
            <span class="outline1">2 <a href="/tc?module=Static&d1=help&d2=roomSummary#challenging">Challenging</a></span><br/>
            <span class="outline1">3 <a href="/tc?module=Static&d1=help&d2=roomSummary#divisionsummary">Division Summary</a></span><br/>

         <p><br/></p>
         </td>
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<!-- Gutter Ends -->

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
