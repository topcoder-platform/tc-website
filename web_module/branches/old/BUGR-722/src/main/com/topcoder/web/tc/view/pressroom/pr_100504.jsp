<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Tournaments</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_main"/>
</jsp:include>
<script language="JavaScript">
function changeImage(image, newImage) {
document[image].src=newImage;
return;
}
function open_window(url) {
mywin =
window.open(url,"win",'toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=0,width=433,height=288');
}
</script>
</head>

<body>

<jsp:include page="/top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="press_room"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<TD class="bodyText" width="100%" valign="top">
<div style="margin: 0px 10px 0px 10px;">

<jsp:include page="/page_title.jsp">
    <jsp:param name="image" value="press_room"/>
    <jsp:param name="title" value="TopCoder Press Release"/>
</jsp:include>

<div align="center">
<p><span class="bodyTitle">Google announces 50 Google Code Jam Finalists</span><br />
<span class="bodySubTitle"><em>Programmers from Around the World to Compete in Finals at Google Headquarters</em></span></p>
</div>

<p><strong>MOUNTAIN VIEW, Calif., October 5, 2004&#151;</strong>
Google Inc. today announced the 50 finalists in the second annual Google Code Jam, Google's online coding competition consisting of a series of problem-solving challenges that invite participants to select a programming language and use their programming skills to code solutions to the problems. The following finalists will be flown to Google headquarters to compete in the Championship Round on October 15:
</p>
<ul>
<li>Reid Barton, Arlington, Mass.</li>
<li>Tomasz Czajka, West Lafayette, Ind.</li>
<li>John Dethridge, Glen Iris, Australia</li>
<li>Chuong Do, Richardson, Texas</li>
<li>Tomas Dzetkulic, Michalovce, Slovakia</li>
<li>Bjarke Ebert, Tranbjerg, Denmark</li>
<li>Erling Ellingsen, Trondheim, Norway</li>
<li>Ambrose Feinstein, Orlando, Fla.</li>
<li>Batholomew Furrow, Vancouver, Canada</li>
<li>Dima Germanov, Ufa, Russian Federation</li>
<li>Oyvind Grotmol, Trondheim, Norway</li>
<li>Alexander Grushetsky, Kiev, Ukraine</li>
<li>Lars Hellsten, Toronto, Canada</li>
<li>Hubert Hwang, Brookline, Mass.</li>
<li>Tomasz Idziaszek, Lomianki, Poland</li>
<li>Anders Jonsson, Amherst, Mass.</li>
<li>JongMan Koo, Seoul, Korea</li>
<li>Eryk Kopczynski, Warszawa, Poland</li>
<li>Erik-Jan Krijgsman, Enschede, The Netherlands</li>
<li>Jan Kuipers, Utrecht, The Netherlands</li>
<li>Gilbert Lee, Victoria, Canada</li>
<li>Justin Legakis, Sunnyvale, Calif.</li>
<li>Po-Ru Loh, Pasadena, Calif.</li>
<li>Tim Lovell-Smith, Christchurch, New Zealand</li>
<li>Jimmy Mardell, Stockholm, Sweden</li>
<li>Tim McDonald, Goffstown, N.H.</li>
<li>Joshua Metzler, Ann Arbor, Mich.</li>
<li>Tor Myklebust, Waterloo, Canada</li>
<li>David Narum, Lovenstad, Norway</li>
<li>Steve Newman, Portola Valley, Calif.</li>
<li>Robin Nittka, Ehingen, Germany</li>
<li>Pawel Parys, Kalety, Poland</li>
<li>Martin Pettai, Viljandi, Estonia</li>
<li>David Pritchard, Boston, Mass.</li>
<li>Lovro Puzar, Zagreb, Croatia</li>
<li>Xin Qi, Ithaca, NY</li>
<li>Berinde Radu, Cambridge, Mass.</li>
<li>Sergio Sancho, Capital Federal, Argentina</li>
<li>Aleksandrs Saveljevs, Riga, Latvia</li>
<li>Zheng Shuo, Urbana, Ill.</li>
<li>Jeff Shute, Kitchener, Canada</li>
<li>Bogdan Stanescu, Rockville, Md.</li>
<li>Bolek Szewczyk, Warsaw, Poland</li>
<li>Jeff Tamer, Urbana, Ill.</li>
<li>Peter Tang, Hong Kong</li>
<li>Joris van Rantwijk, Waddinxveen, The Netherlands</li>
<li>Mathijs Vogelzang, Groningen, The Netherlands</li>
<li>Brian Watkins, Salt Lake City, Utah</li>
<li>Jonathan Wills, DeLand, Fla.</li>
<li>You Zhou, Cambridge, Mass.</li>
</ul>

<p>
"The Google Code Jam is one way Google encourages and supports the engineering, programming and computer science communities around the world," said Alan Eustace, vice president, Engineering, Research and Systems Lab, Google Inc.  "We're continually exploring new opportunities to reach out to smart, talented people who enjoy solving problems. This is a fun way of finding, rewarding and potentially recruiting some of those people to Google."
<br/><br/>
This year's Championship Round will be held at Google headquarters in Mountain View, Calif., on October 15, 2004. Finalists will compete for $50,000 in prize money, including $10,000 for the first place winner, $7,000 for the second place winner, and $5,000 for the third place winner. 
<br/><br/>
The Google Code Jam is powered by TopCoder, the leader in online programming competition, skills assessment and competitive software development. Registration for the competition began Sept. 1, and attracted more than 7,500 participants from more than 100 countries.
<br/><br/>
This is the second year of the Google Code Jam.  In 2003, Jimmy Mardell of Stockholm, Sweden, took home the grand prize.  Prior to the first Google Code Jam, Google held a smaller programming contest and hired the winner, who is now part of Google's New York-based engineering team.  More information about Google Code Jam 2004 can be found at http://www.google.com/codejam.  
<br/><br/>
<span class="bodySubtitle">About Google Inc.</span><br/>
Google's innovative search technologies connect millions of people around the world with information every day. Founded in 1998 by Stanford Ph.D.students Larry Page and Sergey Brin, Google today is a top web property in all major global markets. Google's targeted advertising program, which is the largest and fastest growing in the industry, provides businesses of all sizes with measurable results, while enhancing the overall web experience for users. Google is headquartered in Silicon Valley with offices throughout North America, Europe, and Asia. For more information, visit www.google.com.
<br/><br/>
Google is a registered trademark of Google Inc. All other company and product names may be trademarks of the respective companies with which they are associated.
<br/><br/>
<b>Contact:</b><br/>
Barry Schnitt<br/>
650.623.4194<br/>
barry@google.com
<br/><br/>
Eileen Rodriguez<br/>
650.623.4235<br/>
eileen@google.com
</p>

<p>###</p>



   <br><br>
</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="/public_right.jsp">
               <jsp:param name="level1" value="default"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="/foot.jsp" />

</body>

</html>
