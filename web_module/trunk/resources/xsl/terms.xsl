<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="top.xsl"/>
  <xsl:import href="script.xsl"/>
  <xsl:import href="includes/body_top.xsl"/>  
  <xsl:import href="foot.xsl"/>
  <xsl:import href="authentication/left.xsl"/>
  <xsl:import href="includes/modules/practice_room.xsl"/>
  <xsl:import href="includes/modules/calendar.xsl"/>  
  <xsl:import href="includes/public_right_col.xsl"/> 
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
    <HTML>
      <HEAD>
        <xsl:call-template name="Preload"/>      
        <TITLE>TopCoder :: Terms</TITLE>
        <xsl:call-template name="CSS"/>      
        <!--<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
        <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>-->
        <META NAME="description" CONTENT="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
        <META NAME="keywords" CONTENT="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>
      </HEAD>
      <BODY BGCOLOR="#FFFFFF" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
        <xsl:call-template name="Top"/>
<!-- Body Begins -->
<TABLE WIDTH="100%" HEIGHT="69%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#CCCCCC">
	<TR>
    <!-- Left Column Begins -->
		<TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top">
	<!-- Global Seconday Nav Ends -->	
        <!-- Left Column Include Begins -->
        <xsl:call-template name="BodyLeft"/>
        <!-- Left Column Include Ends -->
	<!-- Global Seconday Nav Ends -->			
	  	</TD>
	<!-- Left Column Ends -->
	<!-- Gutter Begins -->
		<TD WIDTH="4" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="8" BORDER="0"/></TD>
    <!-- Gutter Ends -->

<!-- Body Area -->
	<!-- Center Column Begins -->	
		<TD CLASS="bodyText" WIDTH="100%" BGCOLOR="#CCCCCC" VALIGN="top"><img src="/i/clear.gif" width="240" height="1" VSPACE="5" BORDER="0"/><BR/>
<xsl:call-template name="BodyTop">
  <xsl:with-param name="image1">white</xsl:with-param>
  <xsl:with-param name="image">terms</xsl:with-param>
  <xsl:with-param name="title">&#160;</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
				<TR>
					<TD VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
					<TD CLASS="bodyText" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/><BR/>  
<b>ACCEPTANCE OF TERMS AND REVISIONS</b>
<br/>
<br/>
By using this Web site you are indicating your agreement to these Terms of Use ("Terms").  If you do not agree to these
Terms, please do not use the site and exit now.<BR/>
<BR/>

We may revise these Terms at any time without prior notice by updating this page and such revisions will be effective upon posting to this page.  Please check this page periodically for any changes.  Your continued use of this Web site following the posting of any revisions to these Terms will mean you accept those changes.  We reserve the right to alter, suspend or discontinue any aspect of www.topcoder.com, including your access to it.  Unless explicitly stated, any new features will be subject to these terms and conditions.
<BR/>
<BR/>
<BR/>
<B>PRIVACY</B>
<BR/>

See our complete privacy policy and statement <A HREF="/?c=privacy" CLASS="bodyText">here </A>.<BR/>
<BR/>
<BR/>
<B>PROVISIONS APPLICABLE TO CHINESE CITIZENS AND EXPATRIATES RESIDING IN CHINA</B><BR/>
TopCoder hereby incorporates into these Terms of Use and Privacy Policy the provisions of China's Decision on Safeguarding the Security of the Internet.  
<BR/>
<BR/>
According to Section 1 of Decision on Safeguarding the Security of the Internet, "to ensure operational security of the Internet, the person or organization perpetrating any of the following acts in violation of the criminal law shall be penalized according to the criminal code:
<OL>
	<LI>Unauthorized penetration into the computer and information system of the state affair, national defense or high-tech departments of the state;</LI>
	<LI>Intentional composition or dissemination of computer virus or other destructive programs, or attacking the computer system or telecommunication network and resulting in damage or destruction of such computer systems or telecommunication network;</LI>
	<LI>Unauthorized disruption of operation of the computer network or telecommunication service and resulting in malfunction of such network or telecommunication systems in violation of the laws or regulations of the state." </LI> 
</OL>
<BR/>
<BR/>
According to Section 2 of Decision on Safeguarding the Security of the Internet (the "Decision"), "to protect national security and social stability, the person or organization perpetrating any of the following acts in violation of the criminal law shall be penalized according to the criminal code:
<OL>
	<LI>Disseminating rumor or slander on the Internet, or publishing or diffusing maleficent information to instigate subversion of the state power or socialist system, advocate abruption of the country or harm unity of the country;</LI>
	<LI>Stealing or disclosing the national or military secrets on the Internet;</LI>
	<LI>Instigating inter-ethnic enmity or prejudice, or disrupting ethnic unity on the Internet; and</LI>
	<LI>Establishing or organizing heresies on the Internet and impeding the implementation of laws and regulations of the state."</LI>
</OL>
<BR/>
<BR/>
Section 3 of the Decision also stipulates that "to safeguard the order of the socialist market economy and social stability, the person or organization perpetrating any of the following acts in violation of the criminal law shall be penalized according to the criminal code:
<OL>
	<LI>Selling fake or shoddy goods on the Internet or making false or misleading propaganda of commodities on the Internet;</LI>
	<LI>Hurting others' commercial fame or reputation of products on the Internet;</LI>
	<LI>Infringing upon others' intellectual property rights on the Internet;</LI>
	<LI>Compiling and distributing false information on the Internet to affect securities or futures transactions or disrupt order of the financial markets; and</LI>
	<LI>Establishing pornographic web sites or web pages, providing links to pornographic web sites, or disseminating pornographic magazines, films, audio and videos materials or graphics on the Internet."</LI>
</OL>
<BR/>
<BR/>
Section 4 of the Decision stipulates that "to protect the legal rights of personal safety and property of individuals, legal persons and other organizations, the person or organization perpetrating any of the following acts in violation of the criminal law shall be penalized according to the criminal code:
<OL>
	<LI>Insulting others or drawing up slanders against others on the Internet;</LI>
	<LI>Illegally intercepting, modifying or deleting others' emails or other database materials and infringing rights of the citizen of freedom and secrets in communicating and letter transmitting; and </LI>
	<LI>Perpetrating theft, fraud, or blackmailing on the Internet."</LI>
</OL>
<BR/>
<BR/>
<B>COPYRIGHT, TRADEMARK AND OTHER INTELLECTUAL PROPERTY</B>
<BR/>
<BR/>
<B>Protection</B>
<BR/>
Except as otherwise indicated, this Web site and its entire contents (including, but not limited to, the text, information,
software, graphics, images, sound, and animation are owned by us and are protected by domestic and international copyright,
trademark, patent, and other intellectual property laws.  All copyrightable text and graphics, the selection, arrangement, and
presentation of all materials (including information in the public domain), and the overall design of this Web site are
&#169;2002 TopCoder.  All rights reserved.  Permission is granted to download and print materials from this Web site for the
sole purposes of viewing, reading, and retaining for reference.  Any other copying, distribution, retransmission, or
modification of information or materials on this Web site, whether in electronic or other form, without our express prior
written permission is strictly prohibited.
<BR/>
<BR/>
<B>Notice</B>
<BR/>
All trademarks, service marks, and trade names are proprietary to us or other respective owners that have granted us the
right and license to use their marks.<BR/>
<BR/>
<B>Copyright Complaints</B>
<BR/>
We respect the intellectual property of others, and we ask you to do the same.  We may, in appropriate circumstances and
at our sole discretion, terminate the access of users who infringe the copyright rights of others. <BR/>
<BR/>

If you believe that your work has been copied and is accessible at our Web site in a way that constitutes copyright
infringement, or that our Web site contains links or other references to another online location that contains material or
activity that infringes your copyright rights, you may notify us by providing our copyright agent the information required
by the U.S. Online Copyright Infringement Liability Limitation Act of the U.S. Digital Millennium Copyright Act, 17 U.S.C.
&#167;512 Our agent for notice of claims of copyright infringement on or regarding this Web site can be reached as follows:<BR/>
<BR/>BY E-MAIL: <A HREF="mailto:service@topcoder.com" CLASS="bodyText">service@topcoder.com</A>
<BR/>BY MAIL: John Hughes c/o Tanya Horgan <BR/>TopCoder, Inc.<BR/> 703 Hebron Avenue, <BR/>Glastonbury, CT 06033
<BR/>BY PHONE: 860.633.5540
<BR/>Repeat infringers will be blocked from accessing the TopCoder web site.<BR/>
<BR/>
<BR/>
<B>INDEMNIFICATION AND RELEASE</B>
<BR/>
By accessing our Web site, you agree to indemnify us and any parent, subsidiary or affiliated entities, our officers and employees, and officers and employees of any parent, subsidiary or affiliated entities and hold them harmless from any and all claims and expenses, including attorney's fees, arising from your use of our Web site including any material (including third party material) that you post on our Web ste and any services or products available through our Web site.  In addition, you hereby release us and any parent, subsidiary or affiliated entities, our officers and employees, and officers and employees of any parent, subsidiary or affiliated entities from any and all claims, demands, debts, obligations, damages (actual or consequential), costs, and expenses of any kind or nature whatsoever, whether known or unknown, suspected or unsuspected, disclosed or undisclosed, that you may have against them arising out of or in any way related to such disputes and/or to any services or products available at our Web site.  You hereby agree to waive all laws that may limit the efficacy of such releases.<BR/>
<BR/>
<BR/>
<B>DISCLAIMER</B>
<BR/>

THE MATERIALS AND SERVICES ON OUR WEB SITE ARE PROVIDED "AS IS" AND WITHOUT WARRANTIES OF ANY KIND EITHER EXPRESS OR
IMPLIED.  TO THE FULLEST EXTENT PERMISSIBLE PURSUANT TO APPLICABLE LAW, WE DISCLAIM ALL WARRANTIES, EXPRESS OR IMPLIED,
INCLUDING, BUT NOT LIMITED TO, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.  WE DO NOT
WARRANT THAT THE FUNCTIONS CONTAINED IN THE MATERIALS WILL BE UNINTERRUPTED OR ERROR-FREE, THAT DEFECTS WILL BE CORRECTED,
OR THAT THIS WEB SITE OR THE SERVER(S) THAT MAKES OUR WEB SITE AVAILABLE OR ANY ADVERTISED OR HYPERLINKED SITE ARE FREE
OF VIRUSES OR OTHER HARMFUL COMPONENTS OR THAT OUR SITE, SERVER(S), ADVERTISED OR HYPERLINKED SITES WILL BE ACCESSIBLE AT
ALL TIMES.  WE DO NOT WARRANT THAT SUCH ERRORS, DEFECTS OR INTERRUPTIONS IN SERVICE WILL NOT AFFECT THE RESULTS OF OUR
COMPETITIONS, AND WE DISCLAIM ANY RESPONSIBILITY FOR REDUCED PERFORMANCE IN COMPETITIONS DUE TO SUCH PROBLEMS.  WE DO NOT
WARRANT OR MAKE ANY REPRESENTATIONS REGARDING THE USE OR THE RESULTS OF OUR WEB SITE WITH RESPECT TO CORRECTNESS,
ACCURACY, RELIABILITY OR OTHERWISE.  YOU ASSUME THE ENTIRE COST OF ALL NECESSARY SERVICING, REPAIR OR CORRECTION.
TO THE EXTENT THAT APPLICABLE LAW MAY NOT ALLOW THE EXCLUSION OF IMPLIED WARRANTIES, THE ABOVE EXCLUSIONS MAY NOT APPLY
TO YOU.<BR/>
<BR/>

Documents, graphics and other materials appearing at our Web site may include technical inaccuracies, typographical errors,
and out-of-date information and use of such documents, graphics or other materials is at your own risk.<BR/>
<BR/>
<BR/>
<B>LIMITATION OF LIABILITY</B>
<BR/>
TO THE FULLEST EXTENT PERMISSIBLE PURSUANT TO APPLICABLE LAW, TOPCODER SHALL NOT BE LIABLE FOR ANY DAMAGES
(INCLUDING, BUT NOT LIMITED TO, DIRECT, INDIRECT, INCIDENTAL, SPECIAL OR CONSEQUENTIAL DAMAGES), INCLUDING,
BUT NOT LIMITED TO, DAMAGES FOR LOSS OF WINNINGS, DATA OR OTHER DAMAGE TO ANY OTHER INTANGIBLE PROPERTY, EVEN
IF TOPCODER HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES, RESULTING FROM (i) THE USE OR INABILITY TO USE
THIS WEB SITE, (ii) THE DISCLOSURE OF, UNAUTHORIZED ACCESS TO OR ALTERATION OF ANY TRANSMISSION OR DATA, (iii)
THE STATEMENTS OR CONDUCT OF ANY THIRD PARTY OR (iv) ANY OTHER MATTER RELATING TO TOPCODER.<BR/>
<BR/>
<BR/>
<B>LINKS TO OTHER WEB SITES AND SERVICES</B>
<BR/>
To the extent that our Web site contains links to other Web sites and outside services and resources, we do not control the availability and content of those Web sites, services or resources, nor do we necessarily review or endorse materials available at or through such other Web sites. Viewing other Web sites or utilizing outside services and resources is done at your own risk.  We shall not be liable for any loss or damage caused or alleged to be caused by or in connection with use of or reliance on any such content, goods or services available on or through any such site or resource.
<BR/>
<BR/>
<BR/>
<B>MATERIALS POSTED BY VISITORS</B>
<BR/>
You retain any rights to ownership in any materials posted, uploaded or
otherwise sent to our Web site by you; TopCoder will not gain ownership rights
to this material. By posting, uploading or otherwise sending any source code to us or our Web
site, you grant (or warrant that the owner of such rights has expressly
granted) us a perpetual, royalty-free, irrevocable, non-exclusive right and
license to use,  reproduce and publish such code into any form, medium or
technology.<BR/><BR/>
With respect to any other material posted, uploaded or otherwise sent, you
grant (or warrant that the owner of such rights has expressly granted) us
the same license as pertains to source code with the additional license to
modify, adapt, translate, create derivative works from, and distribute such
materials or incorporate such materials into any form, medium or technology.
<BR/><BR/>
You waive any and all moral rights, including, without limitation, any rights arising under Chapter 7 of the Copyright and Related Rights 
Act 2000 applicable to European Union residents, and all rights of a similar nature in any jurisdiction in any material, including source 
code, which you post, upload or otherwise send to TopCoder or it's website, such waivers being in favor of TopCoder.
<BR/><BR/>
You are allowed to register only once and you must provide true and accurate registration information. You are prohibited from misrepresenting 
your registration information or tampering with the registration process.
<BR/><BR/>
You are also prohibited from posting or otherwise uploading to our Web site:  any material that infringes on any copyright,
trademark or other proprietary rights of another (including publicity and privacy rights); material that is obscene,
offensive, libelous, pornographic, threatening, abusive, contains illegal content, or is otherwise objectionable, that
would constitute or encourage a criminal offense, or that would otherwise give rise to liability or violates any law.
You also represent that you have all necessary rights to use any material that you post or otherwise upload to our
Web site.
<BR/><BR/>
You are further forbidden from distributing or otherwise publishing any material on our Web site that contains any
solicitation of funds, promotion, employment, advertising, or solicitation for goods or services; sending unsolicited commercial
e-mail and other advertising, promotional materials or other forms of solicitation to other users of this site;
harvesting names and e-mail addresses from other users of this site without their permission; soliciting passwords
from other users; impersonating other users; or sending viruses or other
destructive or expropriating content.
<BR/><BR/>
While we do not routinely review the contents of material posted or uploaded to our Web site, we nevertheless reserve
the right to remove any postings or other uploaded materials in response to complaints of infringement, obscenity or
defamation or to otherwise review or edit such materials as appropriate, in our sole discretion and without notice.
<BR/><BR/><BR/>
<B>OTHER RESTRICTIONS ON CONDUCT</B><BR/>
You agree not to disrupt, modify or interfere with the functioning of our Web site or any services provided on or through
our Web site or with any associated software, hardware or servers in any way and you agree not to impede or interfere with
others' use of our Web site. This includes your agreement that you will not cheat; that the idea for the code and/or challenge(s) submitted by you is 
yours alone.  This also includes your agreement that you will not provide your TopCoder information including, but not limited to, your TopCoder handle and rating, to any third 
party for the purpose of pursuing employment opportunities without the written consent of TopCoder. 
If you are contacted by a third-party regarding employment opportunities and/or media interest as a result in your 
participation in TopCoder competitions (including, but not limited to, Single Round Matches and tournaments), you agree 
to promptly notify TopCoder of such contact. You also agree not to alter or tamper with any information or materials on, or 
associated with our Web site or services provided on or through our Web site.
<BR/><BR/>
We do not necessarily endorse, support, sanction, encourage, verify or agree with the comments, opinions, or other
statements made public at our Web site by users through  our competition or Round Tables or other interactive services
available at our Web site.  Any information or material sent by users to such forums, including advice and opinions,
represents the views and is the responsibility of those users and does not necessarily represent our views.
<BR/><BR/>
You agree that no impediment exists to you joining the TopCoder website, and your participation in TopCoder's website and the competitions it 
offers will not interfere with your performance of any other agreement or obligation which has been or will be made with any third party.
<BR/><BR/>
<B>CHOICE OF LAW AND FORUM</B>
<BR/>
This agreement is governed by the laws of the Commonwealth of Massachusetts.  You hereby agree to submit to the exclusive jurisdiction of the courts of the Commonwealth of Massachusetts.  To the extent that applicable laws have mandatory application to this agreement or give you the right to bring action in any other courts, the above limitations may not apply to you.  Use of this Web site is unauthorized in any jurisdiction that does not give full effect to all provisions of these Terms.
<BR/>
<BR/>
<BR/>
<B>SEVERABILITY AND ENFORCEABILITY</B>
<BR/>
If any provision or portion of these Terms is held illegal, invalid, or unenforceable, in whole or in part, it shall be modified to the minimum extent necessary to correct any deficiencies or replaced with a provision which is as close as is legally permissible to the provision found invalid or unenforceable and shall not affect the legality, validity or enforceability of any other provisions or portions of these Terms.
<BR/>
<BR/>
<BR/>
<B>TERMINATION/EXCLUSION</B>
<BR/>
We reserve the right, in our sole discretion, to revoke any and all privileges associated with accessing and/or 
competing on our web site, and to take any other action we deem appropriate including but not limited to terminating or suspending your use of www.topcoder.com, for no reason or any reason whatsoever, including improper use of this site or failure to comply with these Terms.
<BR/>
<BR/>
<BR/>
<b>GENERAL</b>
<BR/>
We may assign, novate or subcontract any or all of our rights and obligations under these terms and conditions at any time.
<BR/>
<BR/>
If you have any questions regarding these Terms, contact us at <A HREF="mailto:service@topcoder.com" CLASS="bodyText">service@topcoder.com</A>.
<P><BR/></P>
		</TD>
					<TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
				</TR>
				<TR>
					<TD COLSPAN="4" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
				</TR>   	
				<TR>
					<TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="11" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" WIDTH="75"><IMG SRC="/i/table_mid_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
				</TR>	
				<TR>
					<TD VALIGN="top" WIDTH="11" ALIGN="right" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="14"><IMG SRC="/i/table_btm_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
				</TR>
			</TABLE>
		</TD>
	<!-- Center Column Ends -->
<!-- Body Area Ends -->

	<!-- Gutter -->
		<TD WIDTH="4" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
	<!-- Right Column Begins -->
		<TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><BR/>
<!-- Right Column Include Begins --> 
        <xsl:call-template name="public_right_col"/>       
<!-- Right Column Include Ends -->       
        </TD>
	<!-- Right Column Ends -->
	<!-- Gutter -->
		<TD WIDTH="25" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="25" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
	</TR>
</TABLE>
<!-- Body Ends -->
        <xsl:call-template name="Foot"/>
      </BODY>
    </HTML>
  </xsl:template>
</xsl:stylesheet>
