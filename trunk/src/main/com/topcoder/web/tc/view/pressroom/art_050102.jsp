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
						<div align="center"><IMG SRC="/i/pressroom/drdobbs.gif" ALT="Dr. Dobb's" BORDER="0"/></div><BR/>
						<p><span class="bodyTitle">And the winner is&#8230;</span></p>
                        </div>
						<p>
						Okay, I'll grant you that programming contests don't have the, well, sex appeal of a celebrity boxing match between Tonya Harding and Paula Jones. Nor, for that matter, do they have the excitement of Stone Cold Steve Austin and Diamond Dallas Page slam-bamming in the ring, or Jeff Gordon and Rusty Wallace bumping and grinding around the track. Still, considering that countless coding contests are going on at any one time, you have to wonder - what's the big deal?
						<br><br>
						Programming competitions come in every color and flavor, and are held for all sorts of reasons, the least of which is that they can be both instructive and fun. Even DDJ has sponsored its share of competitions, the "Data Compression Contest" (February 1991) and "Handwriting Recognition Contest" (January 1993) come to mind. On top of that, DDJ has published articles by contest winners like Eric McRae who discussed his winning project for a Motorola 68HC16 design contest (see "Avoiding Microcontroller Processing Pile-ups," October 1993) and Friedger M&#252;ffke's Moving Letter Box in "The Curl Programming Environment" (September 2001). Then there's the University of Lethbridge's GoFigure contest (mentioned last month in this space), which challenged high-school students to decipher an encrypted message in order to win a scholarship.
						<br><br>
						One reason for putting on a contest is publicity. That's likely what's behind NEC Electronics' recently announced "Esprit de K0RE" 8-bit microcontroller design contest (http://www.necel.com/K0REcontest). Just for entering, you get the K0RE System Design Kit (assembler, C compiler, flash programmer, and target board), and for winning an NEC-Mitsubishi 50-inch Plasma Sync flat-panel display. Likewise, Borland has again cranked up its community contests (<A href="http://codecentral.borland.com/codecentral/ccweb.exe/contests">http://codecentral.borland.com/codecentral/ccweb.exe/contests</A>. Although the first one is likely over by the time you read this, you can still learn from reviewing the entries.
						<br><br>
						The Google search-engine folks have a different reason for sponsoring a programming contest they have a problem that needs solving. They want to know what interesting things you can do with 900,000 of Google's web pages (<A href="http://www.google.com/programming-contest/">http://www.google.com/programming-contest/</A>). The grand prize of $10,000 sounds okay, too.
						<br><br>
						Another reason to hold a contest is to make money. That's what Topcoder (<A href="/">http://www.topcoder.com/</A>), a business that designs and hosts ongoing coding competitions as a commercial endeavor, is all about. Depending on the contest, you can take home thousands of dollars. For its part, Topcoder makes its money from corporate sponsors and companies that use contests as an employment screening tool.
						<br><br>
						Then there are the more academic-like contests, such as the Loebner Prize (<A href="http://www.loebner.net/Prizef/2002_Contest/loebner-prize-rules-2002.html">http://www.loebner.net/Prizef/2002_Contest/loebner-prize-rules-2002.html</A>) which presents an annual cash award to the designer of a computer system that best succeeds in passing a variant of the Turing Test. The International Olympiads in Informatics (IOI) has for more than a decade been the premier academic Olympiads for high-school students worldwide. Organized by the United Nations Educational, Scientific, and Cultural Organization (UNESCO), IOI's goal is to promote the art and science of computer programming. And for the first time this year, IOI will be hosted in the United States, on the campus of the University of Wisconsin-Parkside (<A href="http://www.uwp.edu/academic/mathematics/usaco/ioi2003web/index.htm">http://www.uwp.edu/academic/mathematics/usaco/ioi2003web/index.htm</A>). Similar to IOI, the American Computer Science League (<A href="http://www.acsl.org/acsl/">http://www.acsl.org/acsl/</A>) has organized computer-science and programming contests for junior and senior high-school students around the world for more than 20 years. Forget about the big bucks, however. Winning schools receive copies of Microsoft-donated software (Visual C++, Visual Basic, and the like), along with trophies, and top-scoring students get programming books.
						<br><br>
						For students, the big kahuna of coding contests is the ACM Intercollegiate Programming Contest (<A href="http://icpc.baylor.edu/icpc/">http://icpc.baylor.edu/icpc/</A>). Every year since 1970, more than 17,000 students representing 1300-plus universities from 67 countries have competed for scholarships, prizes, and bragging rights.
						<br><br>
						One of my favorite contests is the legendary International Obfuscated C Code Contest (<A href="http://www.ioccc.org/">http://www.ioccc.org/</A>), where the challenge is to write the most obscure/obfuscated C program, while illustrating the importance of programming style. Interestingly, the 1986 grand winner of the Obfuscated C contest was Larry Wall of Perl fame. Of course, Perl now has its own Obfuscated Perl Code Contest (<A href="http://www.sysadminmag.com/tpj/obfuscated/">http://www.sysadminmag.com/tpj/obfuscated/</A>) where the tongue-in-cheek objective is "to determine who can write the most devious, inhuman, disgusting, amusing, amazing, and bizarre Perl code." Now and again, proponents of other languages - Visual Basic, Java, PHP, and the like - hold obfuscated code contests of their own.
						<br><br>
						This isn't to say that every contest is worth the salt that seasons it. Some are outright scams. More often than not, however, the good in coding competitions outweighs the bad. Programming contests generate interest and enthusiasm. They provide instruction and recognition. They stimulate creativity and reward intellectual achievement. And then, of course, there are the prizes. Some of them have really cool prizes.
						<br><br>
						Jonathan Erickson<BR/>
						editor-in-chief<BR/>
						jerickson@ddj.com
						</p>
						<br>
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
