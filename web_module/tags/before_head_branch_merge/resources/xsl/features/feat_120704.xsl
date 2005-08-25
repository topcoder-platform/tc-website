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
                        <p><font size="4"><strong>More on Encryption and Security</strong></font><br />
                        Tuesday, December 7, 2004</p>

                        <p>By&#160;<a class="bodyText" href="/tc?module=MemberProfile&amp;cr=10407399"><strong>timmac</strong></a><br />
                        <span class="smallText"><em>TopCoder Member</em></span></p>
                        
<p>
In the first article, we discussed some of the basics of encryption, including a brief history, some basic methods, and some fundamentals behind data encoding and security.  That brings us up to today; what do all of the theoretical ideas mean in practical implementation?  How does it make the world secure?
<br/><br/>
<span class="bodySubtitle">Strong Encryption</span><br/>
Previously, some of the challenges with encryption security were pointed out, particularly the issue of encoding a file where a large chunk of data has a known decryption.  The first step in increasing encryption strength is to increase the block size.  That is to say, the encryption algorithm will process a larger piece of data at one time.  Many strong encryptions today use block sizes of 64, 128, or 256 bits.  Another major element is using a combination of many different types of operations.  For instance, a typical XOR encryption would be far more secure if, as a second step, the algorithm reshuffled the bits according to a permutation generated from the encryption key.  In that case, a bit-by-bit comparison of encrypted text with known plain text would not suffice to determine the original encryption key.  Similarly, as one adds more (carefully chosen) operations to the encryption process, the harder it becomes to reverse engineer.  
<br/><br/>
<span class="bodySubtitle">A Little More Classic Encryption</span><br/>
With all the fancy mathematical terms thrown around in describing modern computerized encryption, it might lead one to think that "old fashioned" pencil and paper systems-like the one designed by Vigen&#232;re-are now obsolete, and hence insecure.  While it is probably fair to say they are obsolete, their relative security is another matter.
<br/><br/>
Some classical encryptions, like the simple substitution ciphers (where each letter is replaced by some other letter universally) that are found in the newspaper as a game, are certainly very weak, cryptographically speaking.  On the other extreme, sitting in the courtyard of the CIA headquarters stands a sculpture known as Kryptos, which contains on it a message written in encrypted text.  The secret message is divided into four parts.  The first three parts have been cracked, but the fourth and final part, composed of a mere 97 characters, has eluded many, including the author of this article:
<br/><br/>
?OBKR<br/>
UOXOGHULBSOLIFBBWFLRVQQPRNGKSSO<br/>
TWTQSJQSSEKZZWATJKLUDIAWINFBNYP<br/>
VTTMZFPKWGDKZXTJCDIGKUHUAUEKCAR
<br/><br/>
While this is more for entertainment than anything else, it does show just how hard it can be to reverse engineer an encryption scheme when you know very little about the method of encryption, the key used for encryption, or what the resultant message should look like.
<br/><br/>
<span class="bodySubtitle">Modern Challenges</span><br/>
Other companies, using more modern cryptographic techniques, sometimes offer official challenge contests.  The aim of such a contest is sometimes to demonstrate the strength of a new cryptographic technique, to learn more about weaknesses in encoding techniques, or sometimes simply to promote the advancement of the field of study.  Certicom currently has an ongoing challenge for anyone who solves public key cryptograms that use an algorithm based upon elliptic curves.  Their aim is to demonstrate that elliptic curve encryption is easier to calculate than discrete exponents, but with the same level of security.  The top prize is $100,000, and "being highly considered for a job" with the company.
<br/><br/>
<span class="bodySubtitle">Beyond Encoding</span><br/>
So far our discussion of security has only touched upon making data unreadable.  But security has another huge concern: trust.  Step outside of the computing realm for a moment and consider a familiar scenario.  Imagine you are out with several other people, and you were the driver.  (Lucky you!)  Suppose it starts getting chilly outside and someone says to you, "Hey, I need to grab my coat from you car... can I have your keys?"  Most likely, you will not even think twice about tossing your car keys to your friend.
<br/><br/>
Now, suppose instead you are at home when you get a phone call from someone saying, "Hey, I'm Jack's cousin.  He told me that he left his jacket at your house last night, so leave your door open tonight and I'll just come grab it."  This scenario poses several complications, in particular that you don't really know Jack's cousin very well, but furthermore, you have no way of knowing who it actually is on the other end of the telephone.  Whether or not you leave your door open is a much more complicated decision.  If you are so inclined, you might even give your friend Jack a call, just to verify everything you heard from his cousin.  Assuming he confirms that he left his jacket, and that his cousin was planning on running to the store that night to grab milk, and was going to be in your area, this might help to put your mind at ease.
<br/><br/>
<span class="bodySubtitle">Computers and Trust</span><br/>
The above examples suggest an important question that exists in every application of computer security.  How can you trust a source?  That is to say, when you get an e-mail message, how do you know where it actually came from?  What if you received an e-mail message that appeared to be from your boss, in which he asked questions about a highly secretive project, held in strict confidence to avoid losing a competitive edge?  Do you respond with the sensitive information?  What if you send back protected information, only to find out the e-mail had been spoofed by a (less than scrupulous) competitor?
<br/><br/>
Public key encryption provides some good answers to some of these issues.  The ability to use a pair of encryption keys, public and private, to encrypt and decrypt data,  helps to verify someone's identity.  When a message is encrypted using one of the two keys from a corresponding pair (either the public or the private), only the other corresponding key will correctly decrypt the message.  Suppose you receive a message from a friend that was encrypted using their private key.  Since you already know their public key, you can easily decrypt it, and the fact that it properly decrypts confirms, for you, that it was originally encrypted by your friend's private key, and thus it must have actually come from your friend.
<br/><br/>
<span class="bodySubtitle">Message Integrity and Signatures</span><br/>
Back in the early days of computing, data transmission errors were a common thing, and verifying that data was correctly transmitted from one party to another was essential.  What is the best way to do this?  Compare for a moment, computer data transfer, to talking to a friend on the telephone.  When you are talking to someone, and trying to give important directions, you might repeat yourself one or more times, or have the other party repeat back to you what you just said.  During this repeat, you are not actually exchanging any new information, but rather just confirming that no data was corrupted in your previous exchange.  If the list is particularly long, rather than repeat it verbatim, you might take a shortcut and simply say "Now, you should have ten steps on your list."  In this case, you know right away if there was a major problem communicating.  Notice that you did not actually confirm if, in fact, every detail was correct, but this is still far better than simply saying "Got it okay?" and getting a "yes" or "no" response. 
<br/><br/>
Computing works in much the same way to verify data integrity.  The basic problem is that there needs to be some way to identify an error, however resending an entire message is time consuming and costly.  One common scheme is "checksum".  The basic idea is to divide a message into small blocks (bytes work well), and add the value of each block to generate a sum.  The same operation is performed on both ends, and if the two sums do not match, you can be certain there was an error.  Notice that changing the value of any given byte in a message will therefore change the value of the sum, and hence this method will catch a majority of transmission errors.
<br/><br/>
Of course, checksum is far from foolproof.  If one byte is off by a margin of +1, and another byte by a margin of -1, then the sum will still be the same, but the message will have an error.  While a scenario such as this may not be terribly common in actual application, given an expected checksum value, it is not difficult for a malicious third party to "forge" a message that has a given checksum.
<br/><br/>
The answer to this problem, similar to strong encryption, is a strong "hashing" algorithm.  In much the same manner as a strong encryption algorithm uses a variety of operations to encode a message, a strong hashing algorithm uses a comparably complex set of operations to generate a "message digest" of a given message.  For example, the SHA-1 algorithm, which is currently a good standard for strong hashing, generates a 160-bit signature value based upon any given message.  Obviously, not every single possible message will have a unique signature, however the statistical likelihood of duplication is so small that, in practice, it does not happen.  In addition, changing anything about the original message will alter the signature.  Finally, from a given signature, it is difficult (read as: "thought to be impossible") to construct a message having that signature.  This makes it a secure way to verify that a message is received in exactly the same way it was sent.
<br/><br/>
As a further measure of security, a message can then be "signed" by a person.  This means encrypting the message digest using their private key.  In effect, the "signing" party is verifying the authenticity and authorship of the original message.  This is especially effective for maintaining trust in a situation where the originator of a message and the end recipient do not know each other, but have one or more trusted friends in common.  For example, suppose Joe from the US office needs to send some confidential data to Dan working in the European facility, but the two have not previously communicated, and have not shared any public key information.  However, suppose that Ted, the operations manager, who frequently travels, and knows both of them, has already established communications with them.  Using digital signatures, Joe could author a message, which Ted then signs.  Dan, in Europe, is then able to verify Ted's signature, confirming that Joe's original message is authentic.  Similarly, Dan could publish his public key information, and have Ted sign it.  Joe would then be able to trust that he had accurate public key information for Dan.
<br/><br/>
In theory, one can develop a "web of trust" involving several links of middlemen.  In reality, it would quickly become impractical to maintain such a web beyond a few links, and in practice how far one let's their trust extend probably depends highly upon the nature of the data in question.  Larger, more complex trust relationships also bring an inherent complication.  Suppose a person's private key information is compromised for some reason.  This means, among other things, that anything sent to or from that individual can no longer be trusted as secure.  Furthermore, the authenticity of anything signed by that individual immediately becomes questionable.  There are numerous certificate issuing authorities and similar services devoted to simply keeping track of whose information is whose, and what is still valid.  When the total number of people involved climbs into the millions, it is not difficult to see why it is so complicated.
<br/><br/>
<span class="bodySubtitle">In Conclusion</span><br/>
While this article does not specifically intend to suggest that security is, in general, difficult to realize, it is intended to put things into a realistic perspective.  If the way encryption and hashing play into security, trust and signatures all seems very complicated, that is a frighteningly accurate summation.  Spies, traitors, and double agents have been around as long as civilized society.  Becoming a technical society did not make such deviance obsolete, but rather it brings up new and interesting scenarios that require equally innovate solutions.
</p>

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

