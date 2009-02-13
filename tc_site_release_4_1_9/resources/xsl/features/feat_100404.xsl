<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/global_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
    <html>
      <head>

        <xsl:call-template name="Preload"/>      

        <title>TopCoder | Features</title>

        <xsl:call-template name="CSS"/>      

        <meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
        <meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

<style>
<!--
p.Code, li.Code, div.Code
	{mso-style-name:Code;
	mso-style-link:"Code Char";
	margin:0in;
	margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	font-size:12.0pt;
	font-family:"Courier New";
	mso-fareast-font-family:"Times New Roman";
	mso-bidi-font-family:"Times New Roman";
	font-weight:bold;
	mso-bidi-font-weight:normal;}
-->
</style>

      </head>

      <body bgcolor="#FFFFFF" topmargin="0" marginheight="0" leftmargin="0" marginwidth="0">

        <xsl:call-template name="Top"/>


<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="180">

            <xsl:call-template name="global_left"/>

        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="4"><img src="/i/table_top_fill.gif" width="4" height="26" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->    
        <td class="bodyText" width="100%">
        
            <xsl:call-template name="BodyTop">
                <xsl:with-param name="image1">white</xsl:with-param>
                <xsl:with-param name="image">features</xsl:with-param>
                <xsl:with-param name="title">&#160;TopCoder Feature</xsl:with-param>
            </xsl:call-template>
            
            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr><td colspan="3"><img src="/i/clear.gif" alt="" width="1" height="21" border="0"/></td></tr>                        
                <tr valign="top">
                    <td width="11"><img src="/i/clear.gif" alt="" width="11" height="1" border="0"/></td>
                    <td class="bodyText" width="100%">         
                        <p><font size="4"><strong>Peer 2 Fear: Solutions for developers for designing secure P2P applications</strong></font><br />
                        Monday, October 4, 2004</p>

                        <p>By&#160;<a class="bodyText" href="/tc?module=MemberProfile&amp;cr=10135324"><strong>AryanI</strong></a><br />
                        <span class="smallText"><em>TopCoder Member</em></span></p>
                        
<p><b>Introduction</b><br/>
Securing P2P data sharing applications is challenging due to their open and autonomous nature. Compared to a client-server system in which servers can be relied upon or trusted to always follow protocols, peers in a P2P system may provide no such guarantee. The environment in which a peer must function is a hostile one in which any peer is welcome to join the network; these peers cannot necessarily be trusted to route queries or respond correctly, store documents when asked to, or serve documents when requested.
<br/><br/>
Peer to peer networking is not specifically a new technology but rather a different model for deploying existing technologies. In terms of implementation, it is still basically client/server, except that every machine runs as both a client and a server. Although Napster, Gnutella and Freenet are often mentioned together, each actually functions quite differently from the others. Napster serves as a broker to a centralized address server; Gnutella makes its connections directly while relying on static IP addresses and Freenet is completely dynamic. All of them turn the Net into a giant, distributed hard drive.
<br/><br/>
Some of the biggest dangers from peer-to-peer networks stem from their 'always connected' status (read 'always vulnerable') and the fact that one is now running servers on machines that are managed by end users -- and the fact that these end users don't know how to securely manage a server.
<br/><br/>
Napster's reliance on a centralized directory may make it especially vulnerable. Because of the directory server, Napster is closer than most other peer-to-peer models to a hybrid of client/server and P2P. The server(s) that host the directory could become a particular target for intruders -- and copyright lawyers.
<br/><br/>
Other problems lie not with the technical structure of peer-to-peer networks but in what's being sent across them.
<br/><br/>
Our trust in a source may be based on digital signatures, but if the key is stored on a disk and not a smart card, that key is vulnerable, regardless of anyone's claim of non-reputability. Worse, even if the key is stored on a smart card, a virus can change the message so that what is being signed is not what the digital signature thought it was signing.
<br/><br/>
Spyware programs are also a huge problem in the P2P community. A Spyware is a program that is usually distributed along with the P2P client and which sends out personal user information.
<br/><br/>
Viruses of course are another potential threat for the P2P community. P2P systems are just another medium over which viruses can spread efficiently, although it is estimated that they are not as dangerous as viruses that are spread over the email.
<br/><br/>
Finally, poorly written P2P Clients are another problem in these networks, since they expose their users to all the security flaws of the particular P2P client. For example, the actual transfer of files in Gnutella is done with the HTTP protocol. This means that each Gnutella Client instantiates a "mini" web-server that is capable of serving other Gnutella Clients after their query was performed over the Gnutella network. These "mini" web-servers are sometimes poorly written making them vulnerable to attacks.
<br/><br/>
P2P has been applied on the landscape of Internet and has to face millions of anonymous users. On the other hand, P2P software is getting more powerful and sophisticated. For instance, some applications grant users the power to limit other user's bandwidth amount while uploading files. But still there are a lot of security risks that are required to be addressed. The common security flaws that I found in 
<br/><br/>
P2P networks in general are related to Denial of Service, Traceability, Leakage, User Interface, Security holes, Privacy, Worms and Viruses, and Architecture.
<br/><br/>
The main aim of writing this article is to suggest some possible solutions and security guidelines, which are the outcome of my research analysis regarding designing and implementing secure P2P applications, to the developer community.
<br/><br/>
I am not describing the possible attacks in P2P networks, but just to mention them the most common are Denial of Service, malicious node, self-replication, pseudospoofing, shilling, ping flooding, SYN flooding, attacks on P2P nodes, attacks on routing like incorrect lookup routing attack, incorrect routing updates attack, partitioning attack, semantic attacks like storage and retrieval and face-off and attacks related to file availability, authenticity and integrity.
<br/><br/>
In the table given below I have listed some of the various possible solutions for different inherent problems in P2P networks.
</p>

<table width="510" class="formFrame" cellpadding="6" cellspacin="2" align="center">
	<tr>
		<td class="sidebarTitle">Solutions</td>
		<td class="sidebarTitle" align="center">Node failure</td>
		<td class="sidebarTitle" align="center">File integrity</td>
		<td class="sidebarTitle" align="center">File authenticity</td>
		<td class="sidebarTitle" align="center">Man in middle</td>
	</tr>
	<tr>
		<td class="sidebarText">Can</td>
		<td class="sidebarText" align="center">Y</td>
		<td class="sidebarText" align="center">&#160;</td>
		<td class="sidebarText" align="center">&#160;</td>
		<td class="sidebarText" align="center">&#160;</td>
	</tr>
	<tr>
		<td class="sidebarText">Chord</td>
		<td class="sidebarText" align="center">Y</td>
		<td class="sidebarText" align="center">&#160;</td>
		<td class="sidebarText" align="center">&#160;</td>
		<td class="sidebarText" align="center">&#160;</td>
	</tr>
	<tr>
		<td class="sidebarText">Pastry</td>
		<td class="sidebarText" align="center">Y</td>
		<td class="sidebarText" align="center">&#160;</td>
		<td class="sidebarText" align="center">&#160;</td>
		<td class="sidebarText" align="center">&#160;</td>
	</tr>
	<tr>
		<td class="sidebarText">Viceroy</td>
		<td class="sidebarText" align="center">Y</td>
		<td class="sidebarText" align="center">&#160;</td>
		<td class="sidebarText" align="center">&#160;</td>
		<td class="sidebarText" align="center">&#160;</td>
	</tr>
	<tr>
		<td class="sidebarText">Cyclic redundancy checks</td>
		<td class="sidebarText" align="center">&#160;</td>
		<td class="sidebarText" align="center">Y</td>
		<td class="sidebarText" align="center">&#160;</td>
		<td class="sidebarText" align="center">&#160;</td>
	</tr>
	<tr>
		<td class="sidebarText">Hashing</td>
		<td class="sidebarText" align="center">&#160;</td>
		<td class="sidebarText" align="center">Y</td>
		<td class="sidebarText" align="center">&#160;</td>
		<td class="sidebarText" align="center">&#160;</td>
	</tr>
	<tr>
		<td class="sidebarText">MACs</td>
		<td class="sidebarText" align="center">&#160;</td>
		<td class="sidebarText" align="center">Y</td>
		<td class="sidebarText" align="center">&#160;</td>
		<td class="sidebarText" align="center">&#160;</td>
	</tr>
	<tr>
		<td class="sidebarText">Digital signatures</td>
		<td class="sidebarText" align="center">&#160;</td>
		<td class="sidebarText" align="center">Y</td>
		<td class="sidebarText" align="center">Y</td>
		<td class="sidebarText" align="center">&#160;</td>
	</tr>
	<tr>
		<td class="sidebarText">Trutella</td>
		<td class="sidebarText" align="center">&#160;</td>
		<td class="sidebarText" align="center">&#160;</td>
		<td class="sidebarText" align="center">&#160;</td>
		<td class="sidebarText" align="center">Y</td>
	</tr>
</table>

<p>
Can, Chord, Pastry and Viceroy provide significant levels of fault tolerance in the face of node failure. Digital signature schemes are limited by the lifetime and security of public/private keys.
<br/><br/>
Intel&#174; proposes Trutella, a solution to Man in the Middle attack. Here, a malicious node answers all incoming requests for information with "Yes, I've got that" and then floods the poor requester with garbage, in essence creating a denial-of-service attack.
<br/><br/>
Intel&#174; solution "Trutella," is a combination of Gnutella and hardware that conforms to the Trusted Computing Platform Alliance (TCPA) for encryption. TCPA -- originally formed by Compaq, HP, IBM, Intel&#174; and Microsoft -- now has over 145 companies as participating members, including Broadcom and Philips Semiconductors. The group has dedicated itself to developing a specification for a trusted computing platform.
<br/><br/>
One approach is to use a Peer-to-Peer Trusted Library that allows software developers to add the element of 'trust' to their peer-to-peer applications. It provides support for digital certificates, peer authentication, secure storage, public key encryption, digital signatures, digital envelopes, and symmetric key encryption. The library also provides simple support for networking and some operating system primitives, such as threads and locks. Applications built with the library are portable to both Win32 and Linux.
<br/><br/>
After analyzing various P2P security models, I have come up with some of the security guidelines that could form the basis for designing robust P2P networks in future.

<ol>
<li>In the future, P2P protocols need to be designed to make it hard for adversaries to construct DoS attacks by taking advantage of loosely constrained protocol features.</li>
<li>It is important to design future P2P protocols such that they do not open up new opportunities for attackers to use as amplifiers and back-door communication channels.</li>
<li>One approach to deal, with the attack that effect the availability of any of the particular resources at a node, is to allocate storage to nodes in a manner proportional to the resources that a node contributes to the network.</li>
<li>Techniques such as hash trees could to be used by the client to incrementally ensure that the server is sending the correct data, and that data is sent at a reasonable rate.</li>
<li>To protect against Man in the Middle attack, one way to defeat attacker is for nodes to authenticate other nodes. This can be achieved by obtaining a node's public key through a secure channel (e.g., a trusted party such as certificate vendor, or through a web of trust like PGP) and validating their fingerprints.</li>
<li>Make firewalls smarter so that peer-to-peer applications can cooperate with the firewall to allow traffic the administrator wants. Firewalls must become more sophisticated, allowing systems behind the firewall to ask permission to run a particular peer-to-peer application.</li>
<li>One problem is the lack of accountability in the Internet architecture. Because any host can connect to any other host, and because connections are nearly anonymous, people can insert Spam into the network at any point. The lesson for peer-to-peer designers is that without accountability in a network, it is difficult to enforce rules of social responsibility.</li>
<li>Use security toolbox like JXTA. Project JXTA has security API's and a library that has implements RSA, RC4, MD5, SHA-1, a psuedo-random number generator, MAC, and digital signatures. There are plans to add more ciphers, and Diffey-Hellman. The default key strength is 512 bits for RSA, and 128 bits for RC4. These are there to fulfill U. S. export requirements for open source. The above toolkit is sufficient to begin the P2P implementation.</li>
</ol>

Finally the above security guidelines and proposed solutions are followed by some research issues that developer community in future have to address: 

<ol>
<li>Some research has been done in particular to address DoS attacks based on query-floods in the Gnutella network. However, more research is necessary to understand the effects of other types of DoS attacks in various P2P networks.</li>
<li>Research is required to develop techniques to deal with fail-stop and byzantine failures that are acceptable from a performance and security standpoint in a P2P context.</li>
<li>Research is required to explore a broad range of fundamental P2P issues such as: peer-node identity, naming, configuration and capabilities; P2P network organization and scope; resource discovery, content lookup, search and distribution; request routing and operation in the presence of mobility; adaptation to expected peer-node instability; monitoring of P2P operations; security of P2P systems involving reputation-based trust for ad-hoc systems or more centralized, CA-like approaches; etc.</li>
<li>In current P2P models the users are unaware of the information about the end users or consumers who has the file to share. On some systems, like Gnutella, this is discoverable; on others, like Freenet, anonymity is designed in. But in order to identify trusted sources one has to have the knowledge about the sources. One solution can be based on ratings of different sources based on trust parameters. Even that solution brings problems. The information must be stored somewhere.  In a P2P system built on the Napster model that would be in a central directory -- once again creating a prime target for a malicious hack. Another answer might be a "source arbitrator," which would inform the peer's computer about both the identity of the source and its trustworthiness but not reveal it to the user -- at least not easily.</li>
</ol>

Since the data does exist somewhere within the peer's computer, odds are whatever programs the programmers use to test the viability of the trust model would be able to screen for this data. 
<br/><br/>
So the problem of identifying the trust of nodes in P2P networks is still an open research problem.
<br/><br/>
I have developed four different P2P applications using RMI, JXTA, JMS and Web Services. And I found as the technology is maturing, the security features are increasing but still the increasing complexity and dynamism brings more security issues on the platform. I think it is like a loop in which you must be ahead of the security threats following you from behind.
<br/><br/>
The further information about security issues in P2P networks can be found at below online resources:
</p>

<ul>
<li>Bo Leuf , "Peer to Peer: Collaboration and sharing over the Internet", Pearson education 2002 </li>
<li>Steven M. Bellovin,  <A href="http://www.usenix.org/events/usenix01/invitedtalks/bellovin.pdf">"Security Aspects of Napster and Gnutella"</A> </li>
<li><A href="http://wiki.cs.uiuc.edu/cs427/Feature+Difference">"Pure (Gnutella) Vs Hybrid (Napster)"</A> </li>
<li>Stefan Saroiu, Krishna P. Gummadi, Steven D. Gribble <A href="http://pdf.textfiles.com/academics/msj.pdf">"Measuring and analyzing the characteristics of Napster and Gnutella hosts"</A> </li>
<li>Demetrios Zeinalipour-Yazti ,<A href="http://pdf.textfiles.com/academics/msj.pdfhttp://www.cs.ucr.edu/&#126;csyiazti/courses/cs260-2/project/html/index.html">"Exploiting the Security Weaknesses of the Gnutella Protocol"</A> </li>
<li>Vorobiev Artem, <A href="http://dataquality.i2r.a-star.edu.sg/hhpang/cs6230/slides/Artem.pdf">"Security in P2P systems"</A>  </li>
<li>Eric Chien,<A href="http://enterprisesecurity.symantec.com/PDF/malicious_threats.pdf?EID=0">"Malicious Threats of Peer-to-Peer Networking"</A> </li>
<li><A href="http://www.bricklin.com/p2p.htm">Thoughts on Peer-to-Peer</A> </li>
<li>Dan S. Wallach, <A href="http://www.cs.rice.edu/&#126;dwallach/pub/tokyo-p2p2002.pdf">"A Survey of Peer-to-Peer Security Issues"</A> </li>
<li>Rakesh Gupta, December 10, 2003, <A href="http://www.cc.gatech.edu/people/home/rgupta/Docs/P2PSecurity.pdf">"A Survey of Security Issues and Protocols in P2P Networks"</A> </li>
<li><A href="http://ntrg.cs.tcd.ie/undergrad/4ba2.02-03/Intro.html">"Peer-to-Peer Working Group"</A> </li>
<li><A href="http://infosecuritymag.techtarget.com/articles/february01/cover.shtml">"P2P, OR NOT P2P?"</A> </li>
<li>R.Perlman, "An Overview of PKI Trust Models," IEEE Network Magazine, Nov/Dec 1999. </li>
<li>P.Zimmermann, <A href="http://www.pgpi.org/doc/whypgp/en">"Why do you need PGP?"</A> </li>
<li>Alfarez Abdul-Rahman and Stephen Hailes, "A Distributed Trust Model" Proceedings of the workshop on New security paradigms workshop, 1997, Pages 48 - 60 </li>
<li>Y Yang et al. <A href="http://www.cs.adfa.oz.au/&#126;yany97/NZ99.html">"Token of Trust: Different Certificates for Different Trust Models"</A> </li>
<li><A href="http://www.cs.adfa.oz.au/&#126;yany97/NZ99.html">"Freenet Protocol 1.0 Specification"</A> (incomplete) or <A href="http://freenet.sourceforge.net/index.php?page=protocol">here</A> </li>
<li><A href="http://freenet.sourceforge.net/index.php?page=r3proto">"Freenet 0.3 Protocol Additions</A> </li>
<li><A href="http://freenet.sourceforge.net/inform0.3.php">"Freenet Inform.php script"</A> </li>
<li><A href="http://www.onion-router.net/">"Onion Routing Research project"</A> </li>
</ul>


                        <p><br/></p>

                        <p>Would you like to <a href="/?&amp;t=features&amp;c=feat_topics" class="bodyGeneric">write a feature?</a></p>
                    </td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
                </tr>                                                                 
            </table>
            <p><br/></p>
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
        <td width="4"><img src="/i/clear.gif" width="4" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="170"><img src="/i/clear.gif" width="170" height="1" border="0"/><br/>

            <xsl:call-template name="public_right_col"/>       

        </td>
<!-- Right Column Ends -->

<!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->
    </tr>
</table>

<!-- Footer begins -->
<xsl:call-template name="Foot"/>
<!-- Footer ends -->

</body>
</html>

  </xsl:template>
</xsl:stylesheet>

