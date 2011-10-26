<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Press Room</title>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
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

<div align="right"><tc-webtag:forumLink forumID="530420" message="Discuss this press release" /></div>
                        
<div align="center">
<p><span class="bodyTitle">Online B2B Marketplaces: Should You Dive In?</span><br />
<span class="bodySubTitle"><em>Business-to-business marketplaces are proliferating on the Web. Here's how to tell a site is right for you.</em></span></p>
</div>
                        
<p>Minda Zetlin<br />
Wednesday, September 2, 2009</p>

<p>Ron Burhkart was frustrated. His company, <a href="http://www.onpointtech.com/">On Point Technology, Inc.</a>, provides software to help state unemployment insurance agencies weed out false claims, but getting the software written was proving to be a challenge. "We were dissatisfied with traditional models," says Burkhart, who is vice president of product development. "As a small company, there are times when we need variable resources. We tried the 'body shop' approach, where we hired a programmer to come work in our office, and we also worked with an offshore development company. But neither met our expectations. In both cases, there were problems, not only with the quality of the code, but with the quality of the resource pool." In other words, the coders themselves didn't have a wide enough skill set to fill all of On Point's needs.</p>

<p>So Burkhart decided to try <a href="http://ww.topcoder.com">Topcoder</a>, an online marketplace where 176,000 software developers compete to create software components and win prize money from customers, instead of traditional fees. (Developers who work on Topcoder projects full-time can earn up to $150,000 a year, and even those who never win a contest receive money in a complex point system that rewards both skill and participation.)</p>

<p>That was three years ago, and Burkhart isn't planning to go back to hiring developers the traditional way. "We've wound up with better, more stable code by leveraging their knowledge base," he says. "It's better than we could do internally, or that I could hire locally." Three of On Point's five products were built using Topcoder, he adds.</p>

<p>It seems like nearly every week, there's news of another B2B marketplace springing up online where businesses can trade in everything from automobile components to laser engraving, with a specialized marketplace for nearly every industry. On Point's experience shows how using these marketplaces can benefit your business, but how can you tell if a marketplace is right for you? Here are some questions to ask:
<ol>
	<li><strong>Is the market for this product fragmented?</strong><br />
	If there's no good central way to reach the core group of buyers or sellers in your industry, an online marketplace can dramatically improve efficiency. "Our industry is particularly fragmented," explains Jeff R. Lamb, president of <a href="http://www.domedia.com/">DOmedia</a>, an online marketplace for alternative and out-of-home advertising that includes everything from billboards to skywriting to printed cocktail napkins. "It's difficult for someone who wants to reach a particular audience to navigate that market."</li>
	<li><strong>How big and well-established is the marketplace?</strong><br />
	"You want enough participants to be able to make a difference, and some history of what they've done and how they've done it," notes Jack Hughes, chairman and co-founder of Topcoder, Inc. "We're going to have a whole bunch of new marketplaces that hook people up, but the outcome won't be very good, because it's too easy for people to promote themselves. There should be some mechanism for making sure you get a high-quality outcome."</li>
	<li><strong>Is it easy to see how the marketplace works?</strong><br />
	"A marketplace should encourage transparency," Lamb says. "Everyone should understand what's going on behind the scenes, and it should make sense to all players." Avoid marketplaces that seem to favor either buyers or sellers, or appear to be hiding information, he advises.</li>
	<li><strong>Does the size of participating companies matter?</strong><br />
	As a small company, the last thing you want is to feel invisible next to the marketplace's large players. For instance, at DOmedia, all advertising opportunities are listed equally, whatever the size of the company offering them. "They compete solely on the quality of the opportunity and the data they provide," Lamb says.</li>
	<li><strong>Is there an objective rating for sellers?</strong><br />
	"I don't think user ratings, which work well in consumer product marketplaces, will work well in a marketplace like this one, because it can be easy to manipulate them," Hughes says. Instead, look for an objective rating system, provided either by the marketplace itself or an industry association.</li>
	<li><strong>Does the marketplace encourage you to share your views?</strong><br />
	The best marketplaces function as online communities devoted to the industries they serve, and buyers and sellers can share industry info and advice along with their transactions. A good marketplace should actively encourage users to participate -- and to provide feedback on the marketplace itself. "We are constantly making an effort to reach out and get more feedback," Lamb notes. "It's our job to make the marketplace fit users' needs."</li>
	</ol>
</p>

<p>"DOmedia reminds us to update our billboards and other information," notes Ashley Robinson, producer at <a href="http://www.massivemediainc.com/">Massivemedia</a>, which sells billboards and street-level marketing (such as chariot-like promotional Segways). She appreciates the reminders, because it's easy to forget such matters in the crush of day-to-day tasks. But, she says, it's worth taking the time over if you want to use an online marketplace successfully. "I've learned participation is important," she says.</p>

                        <p><br /><br /></p>
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
