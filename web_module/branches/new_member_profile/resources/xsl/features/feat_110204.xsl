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
                        <p><font size="4"><strong>Encryption Algorithms</strong></font><br />
                        Tuesday, November 2, 2004</p>

                        <p>By&#160;<a class="bodyText" href="/tc?module=MemberProfile&amp;cr=10407399"><strong>timmac</strong></a><br />
                        <span class="smallText"><em>TopCoder Member</em></span></p>
                        
<p>
<span class="bodySubtitle">What is Encryption?</span><br/>
Encryption is one of those fancy terms that sometimes gets thrown around in computer science, and the sound of the word might have a subtle reminder of the CIA or some other covert operation.  In fact, encryption has a lot to do with information security.  Simply defined, encryption is the process of encoding information so that others cannot interpret it.  In theory, this sounds simple enough.  In practice, it involves incredible creativity, and sits on the shoulders of decades of research in advanced mathematics.
<br/><br/>
<span class="bodySubtitle">A Brief History</span><br/>
Encryption has been around in one form or another for thousands of years.  Perhaps the best-known early form of encryption, attributed to Julius Caesar, is the so-called "Caesar Cipher".  To encrypt with this method, take each letter of a message, and shift it up or down the alphabet by a given amount (wrapping at the beginning/end).  Therefore, with a shift three, the message "Hello World" would become "Khoor Zruog".  Assuming the sender and recipient are the only individuals who know the amount of the shift, then the message is theoretically secure between them.  In reality, a brute force attack requires, in the worst case, 26 iterations, and so as humanity became more sophisticated, this encryption quickly became obsolete.
<br/><br/>
Over a thousand years later, Blaise de Vign&#232;re would come along with an improved version of the Caesar cipher, whereby a keyword determines the shift of each individual letter.  Specifically, 'A' means be no shift; 'B' means shift by one position; 'C' means shift two positions, etc.  Thus, to encode a message, you write your message, and write the keyword beneath it (and repeat the keyword over and over), then encode each letter:

<br/><br/>
<center>
<table cellspacing="1" cellpadding="3" class="formFrame" width="500" align="center">
<tr><td class="sidebarTitle">Input:</td><td class="sidebarText">T</td><td class="sidebarText">H</td><td class="sidebarText">I</td><td class="sidebarText">S</td><td class="sidebarText">I</td><td class="sidebarText">S</td><td class="sidebarText">A</td><td class="sidebarText">T</td><td class="sidebarText">E</td><td class="sidebarText">S</td><td class="sidebarText">T</td><td class="sidebarText">M</td><td class="sidebarText">E</td><td class="sidebarText">S</td><td class="sidebarText">S</td><td class="sidebarText">A</td><td class="sidebarText">G</td><td class="sidebarText">E</td></tr>
<tr><td class="sidebarTitle">Key:</td><td class="sidebarText">K</td><td class="sidebarText">E</td><td class="sidebarText">Y</td><td class="sidebarText">W</td><td class="sidebarText">O</td><td class="sidebarText">R</td><td class="sidebarText">D</td><td class="sidebarText">K</td><td class="sidebarText">E</td><td class="sidebarText">Y</td><td class="sidebarText">W</td><td class="sidebarText">O</td><td class="sidebarText">R</td><td class="sidebarText">D</td><td class="sidebarText">K</td><td class="sidebarText">E</td><td class="sidebarText">Y</td><td class="sidebarText">W</td></tr>
<tr><td class="sidebarTitle">Output:</td><td class="sidebarText">D</td><td class="sidebarText">L</td><td class="sidebarText">G</td><td class="sidebarText">O</td><td class="sidebarText">W</td><td class="sidebarText">J</td><td class="sidebarText">D</td><td class="sidebarText">D</td><td class="sidebarText">I</td><td class="sidebarText">Q</td><td class="sidebarText">P</td><td class="sidebarText">A</td><td class="sidebarText">V</td><td class="sidebarText">V</td><td class="sidebarText">C</td><td class="sidebarText">E</td><td class="sidebarText">E</td><td class="sidebarText">A</td></tr>
</table>
</center>
<br/><br/>

Clearly, this is much better, as brute force is much harder to pull off.  Nonetheless, Charles Babbage described a way to break this encoding scheme by examining letter frequencies.  I will leave it to the reader to research the details of how this works.  Other, stronger methods of encryption would eventually arise, particularly during World War II.  This included such systems as Playfair, which operated on letter pairs instead of single letters, and the infamous German Enigma, which used a series of rotors that would constantly change the encoding as the message progressed.  Based on more advanced logic, they were far harder to break, and the algorithms demonstrate some basic principles that would become cornerstones of modern, digital encryption schemes.
<br/><br/>
<span class="bodySubtitle">Computer Encryption</span><br/>
There are three basic types of digital encryption... keyless, single-key (also known as symmetric key), and dual-key (or public key) encryption.  Each of these has a different logical basis, and a different intended purpose, which I will attempt to describe.
<br/><br/>Keyless encryption involves a piece of software that takes some input data stream (e.g. the "plain text"), and performs some kind of computation or transformation on it, and outputs a resulting data stream (e.g. the "cipher text").  Then, this same piece of software, ideally, only reverses the process in a secured setting, such as after validating a user's login.  The advantage here is that it is simple, and nobody has to keep track of any passwords as part of the encryption process.  The problem is that the algorithm performs an identical process on every set of input data, and thus the security of such a scheme relies entirely upon the algorithm remaining a secret.
A good, recent example of a keyless system is Microsoft's "Windows Script Encoder".  The idea here was that web developers who used scripts like ASP wanted a way to be sure that their code which, unlike compiled programs, could be read plainly, could still be protected from tampering or copying.  The script encoder takes an ASP page, or JavaScript file, and encodes it as a series of letters, numbers, and punctuation that is incomprehensible, and in theory can only be decoded by the web server processing the script.  This was simple and easy to use.  However, as soon as the homegrown "Windows script decoder" cropped up on the Internet, it was even clearer that such encryption systems do not offer much real security.  As a common saying goes, "security through obscurity" never works.
<br/><br/>
<span class="bodySubtitle">Single-Key Encryption</span><br/>
A single-key encryption system (also known as "symmetric key encryption", since the same key is used for both encryption and decryption) works by means of an algorithm that transforms the input data based upon the value of an encryption key, using some combination of mathematical and logical operations.  To decrypt, the algorithm runs the same set of operations in reverse, using the same key value.  The Vignere cipher is a very simple example of this, where the algorithm is simply to add the input value to the corresponding key value.  Decrypting a Vignere cipher is simply a matter of subtracting.  It is plain to see that attempting to decrypt using the wrong key will simply yield unreadable gibberish.
<br/><br/>
When working with a stream of binary data, instead of just letters, it is necessary to adjust the algorithm a bit.  One approach is to perform the same basic operation as a Caesar or Vignere cipher, but essentially using an alphabet with 256 letters.  However, perhaps a more common approach is to make use of the logical XOR operation.  The XOR operation operates bit by bit, according to the following truth table:

<br/><br/>
<center>
<table cellspacing="1" cellpadding="3" class="formFrame" width="200" align="center">
<tr align="center"><td class="sidebarTitle">Input</td><td class="sidebarTitle">Key</td><td class="sidebarTitle">Output</td></tr>
<tr align="center"><td class="sidebarText">0</td><td class="sidebarText">0</td><td class="sidebarText">0</td></tr>
<tr align="center"><td class="sidebarText">0</td><td class="sidebarText">1</td><td class="sidebarText">1</td></tr>
<tr align="center"><td class="sidebarText">1</td><td class="sidebarText">0</td><td class="sidebarText">1</td></tr>
<tr align="center"><td class="sidebarText">1</td><td class="sidebarText">1</td><td class="sidebarText">0</td></tr>
</table>
</center>
<br/><br/>

One very important observation here is that applying an XOR operation of an output bit by the same key bit returns the input bit.  Study the chart as long as necessary to convince yourself that this is true.  This means that any encryption algorithm based solely upon an XOR operation uses an identical process to perform both encryption and decryption.  This is extremely convenient.  An even more interesting, though much less obvious result is that one can encrypt an input stream using XOR encryption multiple times, with multiple keys, and then decrypt using the same keys <i>regardless of order</i>.
<br/><br/>
So, then, why the need for all sorts of fancy encryption schemes like Blowfish, Skipjack, Rijnadel, Serpent, and MARS?  (And why do all the names sound like IM handles?)  Simply put, XOR based encryption suffers from a number of fundamental weaknesses that make it easy to break-a problem that persists in more complicated algorithms as well.
<br/><br/>
<span class="bodySubtitle">Breaking Single-Key Encryption</span><br/>
Much like many SRM problems, the first naive attempt at a solution is simple brute force.  In this case, our goal is to determine the original key used for encrypting a document.  Let us assume, for sake of example, that some algorithm, using a 5-character key, has encrypted a document.  If each character is eight bits in length, then our 40-bit key has roughly 1 trillion possible values.  With a small handful of computers working in parallel to check all possible key values to see which decryption attempt results in readable text, we could have our solution in a manner of days at most.  If we assume that each character of the key is one of perhaps 80 characters that can easily be typed on the keyboard, then we immediately reduce our search space to about 3 billion possible keys; a number that can be checked within days (at worst) on just a single machine, or in just seconds on a large group of machines working in parallel.  If we know that the key is composed of only lower case letters, then there are a mere 11 million possible keys, a number easily searched on a single computer in seconds.  If we know even further that the key is an actual dictionary word, then we completely trivialize the problem.
<br/><br/>
Notice also that I did not even specifically mention what encryption algorithm we were trying to break-because it does not matter.  Even the world's best encryption scheme will crumble at the sight of a poorly chosen key.  The point here is simply that a well-chosen and sufficiently lengthy key is paramount to good security-always.
<br/><br/>
Okay, so, we just make sure to always use a key that is 200 characters long, and we will never have a problem, right?  Unfortunately, this is far from the truth.  Suppose you have an encrypted file, and you know what type of file it is-a word document, for instance.  For many typical document types, the first several bytes constitute "header" information, and may be nearly identical from one file to the next.  Therefore, this means that, at least for the first block of data, we have encrypted data, and the expected decryption.  Here is where the strength of the algorithm comes into play.  In the case of a simple XOR encryption, if we perform an XOR between the encrypted data, and the assumed decrypted data, what we get is the original key data used to perform the encryption.  It is then simple to take that same key data to subsequently decrypt the rest of the file.  For other encryption algorithms, it may not be so easy to determine the key, even given both encrypted and decrypted data.  In light of the example just given, this is a very important consideration in analyzing the strength of any encryption algorithm.
<br/><br/>
<span class="bodySubtitle">Dual-Key Encryption Systems</span><br/>
Suppose two parties, located on opposite sides of the world, wish to exchange data securely, but have not previously agreed on an encryption key.  This situation arises in situations such as secured online transactions.  A person browsing a web site who wishes to exchange sensitive data (such as a credit card number) needs a way to transmit that data securely.  The same problem exists with e-mail, when the sender and recipient may not have a secure channel for transmitting an encryption key.  At least two solutions exist, key exchange systems, or dual-key (also know as public key) encryption systems.  The fundamental theory supporting both is actually nearly identical, while the implementation is very different.
<br/><br/>
In a key exchange system, two parties need to agree upon an encryption key in such a way that even if a third party intercepts all of their communication, the key cannot be reconstructed.  One such method is "Exponential Key Exchange".  The basic idea is to pick a very large prime number n, and a number g, which is a generator for n.  (A generator is a number whose powers cycle through all possible values mod n.)  Each party generates, on their own, a random number, call them a and b.  From those values, generate <i>A = g<sup>a</sup> (</i>MOD<i> n), B = g<sup>b</sup> (</i>MOD<i> n)</i>.  <i>A</i> and <i>B</i> are then exchanged.  The first party calculates <i>B<sup>a</sup> (</i>MOD<i> n) = g<sup>ab</sup></i>.  The other party likewise calculates <i>A<sup>b</sup> (</i>MOD<i> n) = g<sup>ab</sup></i>.  <i>g<sup>ab</sup> (</i>MOD<i> n)</i> then becomes the agreed upon key.  This works because even given <i>g<sup>a</sup> (</i>MOD<i> n)</i> and <i>g<sup>b</sup> (</i>MOD<i> n)</i>, there is no easy way to calculate <i>g<sup>ab</sup></i> without knowing <i>a</i> or <i>b</i>.  This is the discrete logarithm problem, and is a hard problem.
<br/><br/>
This is very similar to public-key encryption.  The principle is to generate a pair of corresponding keys, one public-for encrypting messages, and another private-for decrypting messages.  The trick here is to generate the key pair in such a way that the private key cannot be easily deduced from the public key.  The most common algorithms for this involve picking two very large prime numbers <i>p</i> and <i>q</i>, letting <i>n = pq</i>, and generating a key pair, <i>d</i> and <i>e</i>, based upon <i>p</i>, <i>q</i>, and <i>n</i>.  (The exact mathematics is a bit complicated to get into here.)  Then, <i>d</i> and <i>n</i> are the public key; <i>e</i> and <i>n</i> are the private key; and discard <i>p</i> and <i>q</i>.  If <i>M</i> is the input data, then the encrypted data is <i>E = M<sup>d</sup> (</i>MOD<i> n)</i>, and decryption is accomplished by <i>M = E<sup>e</sup> (</i>MOD<i> n)</i>.  With <i>p</i> and <i>q</i> discarded, reverse engineering the public key breaks down to the problem of factoring a very large number, which, like the discrete logarithm problem, is a hard problem.
<br/><br/>
One drawback to public-key encryption is that the mathematical grinding of such large numbers can be somewhat time consuming, relatively speaking.  One workaround, implemented by systems such as PGP (Pretty Good Privacy, which is commonly used for e-mail), is to encrypt the message using a symmetric-key system with a randomly generated key, then to encrypt only the key using public-key encryption.  This is the best of both worlds... fast and secure.
<br/><br/>
As technology advances, and increasing numbers of faster computers become available to perform more calculations quicker, encryption technology has to advance as well.  What was good security yesterday is trivial to break today.  For each new breakthrough in secure encryption, the discovery of a new subtle flaw is right on its heels.  One thing is certain - encryption will continue to push the barriers of creativity and insight among the best and brightest of mathematicians and programmers alike.
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

