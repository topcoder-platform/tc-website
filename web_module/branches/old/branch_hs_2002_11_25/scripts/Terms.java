import com.topcoder.shared.util.*;
import com.topcoder.web.ejb.termsofuse.*;

import java.rmi.*;
import javax.ejb.*;
import javax.naming.*;
import javax.servlet.*;

public class Terms {

  public static void main(String _argv[]) {
    try {
      Context ctx=TCContext.getInitial();
      System.out.println("got context");
      TermsOfUseHome touh=(TermsOfUseHome)
                                        ctx.lookup(TermsOfUseHome.EJB_REF_NAME);
      System.out.println("got home");
      TermsOfUse tou=touh.create();
      System.out.println("create bean");
      long terms_of_use_id=tou.createTermsOfUse();
      System.out.println("create terms of use: "+terms_of_use_id);
      tou.setTermsOfUseTypeId(terms_of_use_id,1);
      System.out.println("set status");
      tou.setText(terms_of_use_id,TEXT);
      System.out.println("set text");
    }
    catch (Exception _e) {
      _e.printStackTrace();
    }
  }

  private final static String TEXT=
"            ACCEPTANCE OF TERMS\n"+
"\n"+
"By using this Web site you are indicating your agreement to these Terms of Use (\"Terms\").  If you do not agree to these Terms, please do not use the site and exit now.\n"+
"\n"+
"We may revise these Terms at any time without prior notice by updating this page and such revisions will be effective upon posting to this page.  Please check this page periodically for any changes.  Your continued use of this Web site following the posting of any revisions to these Terms will mean you accept those changes.  We reserve the right to alter, suspend or discontinue any aspect of http://highschool.topcoder.com, including your access to it.  Unless explicitly stated, any new features will be subject to these terms and conditions.\n"+
"\n"+
"PRIVACY\n"+
"\n"+
"Because we value privacy as much as we value programmers, TopCoder is committed to protecting the privacy of our users.  We want to provide a safe, secure user experience.  We will use reasonable commercial efforts to ensure that the information you submit to us remains private.  Your personal information is immediately transferred from our web server to behind our firewall, where it remains isolated from a direct connection to the Internet.\n"+
"\n"+
"Our security and Privacy Commitment are periodically reviewed and enhanced as necessary.  However, you should understand that \"perfect security\" does not exist on the Internet.  The information that you submit to us is used only for the purposes as set forth herein, as required by law, or when we believe in good faith that disclosure is legally required to protect our rights.  We will not use your personal information for any other purpose other than as set out here without first obtaining your permission.  The following reflects our commitment to you.\n"+
"\n"+
"Information About All TopCoder Visitors\n"+
"We gather information about all of our users collectively, including (a) what area users visit most frequently, (b) their Internet domain and their computer's IP address, (c) the type of browser and operating system they use and (d) if the user linked to our Web site from another Web site, the address of that other Web site.  This information does not in any way personally identify a user; we only use this data anonymously and in the aggregate.  We use this information to analyze trends and statistics to help us improve our services, plan site enhancements and measure overall site effectiveness.  From time to time we may reveal general, anonymous, aggregated statistical information about our site, services and users, such as the number of visits and users and what site features they use.\n"+
"\n"+
"Information About You Specifically\n"+
"If you choose to register as a member in order to participate in TopCoder High School competitions, you will provide us with additional information about yourself, including name, email address and high school. If you are a winner in a competition and / or tournament, we may also request your address and date of birth.  In addition, if you are a U.S. person (including U.S resident aliens), we will request your social security number (or taxpayer identification number) on IRS form W-9.  If you are a winner, and you are not a U.S person, we will request a Certificate of Foreign Status of Beneficial Owner for United States Tax Withholding on IRS form W-8BEN.  We use this information to verify your eligibility to participate in specific tournaments, and to contact you and properly notify the IRS should you be a winner.  From time to time, we may use the contact information to alert members of new competitions and communicate news, events and reminders.  If you do not want to be alerted of any of these items, you can send us an e-mail at service@topcoder.com asking to be removed as a member of TopCoder High School.  During competition, users participating will be shown and identified only by their handles, which are their public login names.  A TopCoder High School member's handle, rating, date registered, winnings to date, skill set, and personal quote will be publicly available to any participants of the TopCoder High School web site and competition applications.\n"+
"\n"+
"Spectators are allowed to view the competition by simply logging into the competition applet with their TopCoder High School handle.  Competition participants must be members and must login to prove it.  All source code created during the competition will be available to anyone - spectators, members and sponsors and may be subject to challenge from other members.  Your performance in a competition will allow us to help balance the competition.  It will be recorded to calculate competition rating values and it will be posted on the web site and in the competition area.  Winners' names may also be released to governmental authorities as required by law and to those requesting such information from TopCoder.\n"+
"\n"+
"Only TopCoder will have access to view your demographic information and contact information.\n"+
"\n"+
"The personal information you provide must be accurate and complete and all registration details (where applicable) must contain your real name, address and other requested details. You are solely responsible for your personal information and we may take any action with respect to your personal information we deem necessary or appropriate if we believe it may cause us to suffer any loss, liability or commercial damage.\n"+
"\n"+
"Cookies\n"+
"To enhance your experience at TopCoder High School, we may use a feature on your Internet browser called a \"cookie\".  As you may already know, cookies are small files that your Web browser places on your computer's hard drive.  We use cookies for remembering user names and passwords and preferences, tracking click streams, and for load balancing.  Because of our use of cookies, we can deliver faster service, consistent, updated results, and a more personalized site experience.  You have the option of setting your browser to reject cookies.  However, doing this may hinder performance and negatively impact your experience on our site.\n"+
"\n"+
"Feedback\n"+
"TopCoder may ask you for feedback and comments about the site or the tournaments and we encourage your participation.  Any feedback that is submitted becomes the property of TopCoder.  We may use this feedback, such as success stories, for marketing purposes, or to contact you for further feedback on the site.\n"+
"\n"+
"Links to Other Sites\n"+
"We may provide links to other Web sites that we believe can offer you useful information.   However, we are not responsible for the privacy policies of other Web sites, including those sites on which our logo or other information supplied by us appears.  We suggest that you access these sites' online policies regarding their data collection.\n"+
"\n"+
"Access to Your Information\n"+
"TopCoder will provide you with an opportunity to review at any time the information that it has compiled about you, as well as the opportunity to correct any erroneous information.  To view or correct your information, contact us at service@topcoder.com.\n"+
"\n"+
"Privacy Commitment Changes\n"+
"If we decide to change our privacy commitment for TopCoder High School, we will post those changes here so that you will always know what information we gather, how we might use that information, and whether we will disclose it to anyone.  In the event that we make any significant changes to our Privacy Statement, we will also provide you with the opportunity to consent to different uses of your personal information.  If, at any time, you have questions or concerns about TopCoder High School's privacy commitment, please feel free to e-mail us at service@topcoder.com.\n"+
"\n"+
"\n"+
"COPYRIGHT, TRADEMARK AND OTHER INTELLECTUAL PROPERTY\n"+
"\n"+
"Protection\n"+
"Except as otherwise indicated, this Web site and its entire contents (including, but not limited to, the text, information, software, graphics, images, sound, and animation) are owned by TopCoder, Inc. and are protected by domestic and international copyright, trademark, patent, and other intellectual property laws.  All copyrightable text and graphics, the selection, arrangement, and presentation of all materials (including information in the public domain), and the overall design of this Web site are ©2002 TopCoder.  All rights reserved.  Permission is granted to download and print materials from this Web site for the sole purposes of viewing, reading, and retaining for reference.  Any other copying, distribution, retransmission, or modification of information or materials on this Web site, whether in electronic or other form, without our express prior written permission is strictly prohibited.\n"+
"\n"+
"Notice\n"+
"All trademarks, service marks, and trade names are proprietary to us or other respective owners that have granted us the right and license to use their marks.\n"+
"\n"+
"Copyright Complaints\n"+
"We respect the intellectual property of others, and we ask you to do the same.  We may, in appropriate circumstances and at our sole discretion, terminate the access of users who infringe the copyright rights of others.\n"+
"\n"+
"If you believe that your work has been copied and is accessible at our Web site in a way that constitutes copyright infringement, or that our Web site contains links or other references to another online location that contains material or activity that infringes your copyright rights, you may notify us by providing our copyright agent the information required by the U.S. Online Copyright Infringement Liability Limitation Act of the U.S. Digital Millennium Copyright Act, 17 U.S.C.  §512 Our agent for notice of claims of copyright infringement on or regarding this Web site can be reached as follows:\n"+
"\n"+
"BY E-MAIL: service@topcoder.com\n"+
"BY MAIL: John Hughes c/o Tanya Horgan TopCoder, Inc. 703 Hebron Avenue, Glastonbury, CT 06033\n"+
"BY PHONE: 860.633.5540\n"+
"Repeat infringers will be blocked from accessing the TopCoder web site.\n"+
"\n"+
"INDEMNIFICATION AND RELEASE\n"+
"\n"+
"By accessing our Web site, you agree to indemnify us and any parent, subsidiary or affiliated entities, our officers and employees, and officers and employees of any parent, subsidiary or affiliated entities and hold them harmless from any and all claims and expenses, including attorney's fees, arising from your use of our Web site including any material (including third party material) that you post on our Web site and any services or products available through our Web site.  In addition, you hereby release us and any parent, subsidiary or affiliated entities, our officers and employees, and officers and employees of any parent, subsidiary or affiliated entities from any and all claims, demands, debts, obligations, damages (actual or consequential), costs, and expenses of any kind or nature whatsoever, whether known or unknown, suspected or unsuspected, disclosed or undisclosed, that you may have against them arising out of or in any way related to such disputes and/or to any services or products available at our Web site.  You hereby agree to waive all laws that may limit the efficacy of such releases.\n"+
"\n"+
"DISCLAIMER\n"+
"\n"+
"THE MATERIALS AND SERVICES ON OUR WEB SITE ARE PROVIDED \"AS IS\" AND WITHOUT WARRANTIES OF ANY KIND EITHER EXPRESS OR IMPLIED.  TO THE FULLEST EXTENT PERMISSIBLE PURSUANT TO APPLICABLE LAW, WE DISCLAIM ALL WARRANTIES, EXPRESS OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.  WE DO NOT WARRANT THAT THE FUNCTIONS CONTAINED IN THE MATERIALS WILL BE UNINTERRUPTED OR ERROR-FREE, THAT DEFECTS WILL BE CORRECTED, OR THAT THIS WEB SITE OR THE SERVER(S) THAT MAKES OUR WEB SITE AVAILABLE OR ANY ADVERTISED OR HYPERLINKED SITE ARE FREE OF VIRUSES OR OTHER HARMFUL COMPONENTS OR THAT OUR SITE, SERVER(S), ADVERTISED OR HYPERLINKED SITES WILL BE ACCESSIBLE AT ALL TIMES.  WE DO NOT WARRANT THAT SUCH ERRORS, DEFECTS OR INTERRUPTIONS IN SERVICE WILL NOT AFFECT THE RESULTS OF OUR COMPETITIONS, AND WE DISCLAIM ANY RESPONSIBILITY FOR REDUCED PERFORMANCE IN COMPETITIONS DUE TO SUCH PROBLEMS.  WE DO NOT WARRANT OR MAKE ANY REPRESENTATIONS REGARDING THE USE OR THE RESULTS OF OUR WEB SITE WITH RESPECT TO CORRECTNESS, ACCURACY, RELIABILITY OR OTHERWISE.  YOU ASSUME THE ENTIRE COST OF ALL NECESSARY SERVICING, REPAIR OR CORRECTION.  TO THE EXTENT THAT APPLICABLE LAW MAY NOT ALLOW THE EXCLUSION OF IMPLIED WARRANTIES, THE ABOVE EXCLUSIONS MAY NOT APPLY TO YOU.\n"+
"\n"+
"Documents, graphics and other materials appearing at our Web site may include technical inaccuracies, typographical errors, and out-of-date information and use of such documents, graphics or other materials is at your own risk.\n"+
"\n"+
"LIMITATION OF LIABILITY\n"+
"TO THE FULLEST EXTENT PERMISSIBLE PURSUANT TO APPLICABLE LAW, TOPCODER SHALL NOT BE LIABLE FOR ANY DAMAGES (INCLUDING, BUT NOT LIMITED TO, DIRECT, INDIRECT, INCIDENTAL, SPECIAL OR CONSEQUENTIAL DAMAGES), INCLUDING, BUT NOT LIMITED TO, DAMAGES FOR LOSS OF WINNINGS, DATA OR OTHER DAMAGE TO ANY OTHER INTANGIBLE PROPERTY, EVEN IF TOPCODER HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES, RESULTING FROM (i) THE USE OR INABILITY TO USE THIS WEB SITE, (ii) THE DISCLOSURE OF, UNAUTHORIZED ACCESS TO OR ALTERATION OF ANY TRANSMISSION OR DATA, (iii) THE STATEMENTS OR CONDUCT OF ANY THIRD PARTY OR (iv) ANY OTHER MATTER RELATING TO TOPCODER.\n"+
"\n"+
"LINKS TO OTHER WEB SITES AND SERVICES\n"+
"\n"+
"To the extent that our Web site contains links to other Web sites and outside services and resources, we do not control the availability and content of those Web sites, services or resources, nor do we necessarily review or endorse materials available at or through such other Web sites. Viewing other Web sites or utilizing outside services and resources is done at your own risk.  We shall not be liable for any loss or damage caused or alleged to be caused by or in connection with use of or reliance on any such content, goods or services available on or through any such site or resource.\n"+
"\n"+
"MATERIALS POSTED BY VISITORS\n"+
"\n"+
"You retain any rights to ownership in any materials posted, uploaded or otherwise sent to our Web site by you; TopCoder will not gain ownership rights to this material.  By posting, uploading or otherwise sending any source code to us or our Web site, you grant (or warrant that the owner of such rights has expressly granted) us a perpetual, royalty-free, irrevocable, non-exclusive right and license to use, reproduce and publish such code into any form, medium or technology.\n"+
"\n"+
"With respect to any other material posted, uploaded or otherwise sent, you grant (or warrant that the owner of such rights has expressly granted) us the same license as pertains to source code with the additional license to modify, adapt, translate, create derivative works from, and distribute such materials or incorporate such materials into any form, medium or technology. You waive any and all moral rights, including, without limitation, any rights arising under Chapter 7 of the Copyright and Related Rights Act 2000 applicable to European Union residents, and all rights of a similar nature in any jurisdiction in any material, including source code, which you post, upload or otherwise send to TopCoder or it's website, such waivers being in favor of TopCoder.\n"+
"\n"+
"You are allowed to register only once and you must provide true and accurate registration information.  You are prohibited from misrepresenting your registration information or tampering with the registration process.\n"+
"\n"+
"You are also prohibited from posting or otherwise uploading to our Web site:  any material that infringes on any copyright, trademark or other proprietary rights of another (including publicity and privacy rights); material that is obscene, offensive, libelous, pornographic, threatening, abusive, contains illegal content, or is otherwise objectionable, that would constitute or encourage a criminal offense, or that would otherwise give rise to liability or violates any law.  You also represent that you have all necessary rights to use any material that you post or otherwise upload to our Web site.\n"+
"\n"+
"You are further forbidden from distributing or otherwise publishing any material on our Web site that contains any solicitation of funds, promotion, employment, advertising, or solicitation for goods or services; sending unsolicited commercial e-mail and other advertising, promotional materials or other forms of solicitation to other users of this site; harvesting names and e-mail addresses from other users of this site without their permission; soliciting passwords from other users; impersonating other users; or sending viruses or other destructive or expropriating content.\n"+
"\n"+
"While we do not routinely review the contents of material posted or uploaded to our Web site, we nevertheless reserve the right to remove any postings or other uploaded materials in response to complaints of infringement, obscenity or defamation or to otherwise review or edit such materials as appropriate, in our sole discretion and without notice.\n"+
"\n"+
"OTHER RESTRICTIONS ON CONDUCT\n"+
"\n"+
"You agree not to disrupt, modify or interfere with the functioning of our Web site or any services provided on or through our Web site or with any associated software, hardware or servers in any way and you agree not to impede or interfere with others' use of our Web site. This includes your agreement that you will not cheat; that the idea for the code and/or challenge(s) submitted by you is yours alone. This also includes your agreement that you will not provide your TopCoder High School information including, but not limited to, your TopCoder High School handle and rating, to any third party for any purpose without the written consent of TopCoder. If you are contacted by a third-party as a result in your participation in TopCoder competitions (including, but not limited to, High School Matches and tournaments), you agree to promptly notify TopCoder of such contact. You also agree not to alter or tamper with any information or materials on, or associated with our Web site or services provided on or through our Web site.\n"+
"\n"+
"We do not necessarily endorse, support, sanction, encourage, verify or agree with the comments, opinions, or other statements made public at our Web site by users through our competitions or other interactive services available at our Web site.  Any information or material sent by users to such forums, including advice and opinions, represents the views and is the responsibility of those users and does not necessarily represent our views.\n"+
"\n"+
"You agree that no impediment exists to you joining the TopCoder High School website, and your participation in TopCoder High School's website and the competitions it offers will not interfere with your performance of any other agreement or obligation which has been or will be made with any third party.\n"+
"\n"+
"CHOICE OF LAW AND FORUM\n"+
"\n"+
"This agreement is governed by the laws of the Commonwealth of Massachusetts.  You hereby agree to submit to the exclusive jurisdiction of the courts of the Commonwealth of Massachusetts. To the extent that applicable laws have mandatory application to this agreement or give you the right to bring action in any other courts, the above limitations may not apply to you. Use of this Web site is unauthorized in any jurisdiction that does not give full effect to all provisions of these Terms.\n"+
"\n"+
"SEVERABILITY AND ENFORCEABILITY\n"+
"\n"+
"If any provision or portion of these Terms is held illegal, invalid, or unenforceable, in whole or in part, it shall be modified to the minimum extent necessary to correct any deficiencies or replaced with a provision which is as close as is legally permissible to the provision found invalid or unenforceable and shall not affect the legality, validity or enforceability of any other provisions or portions of these Terms.\n"+
"\n"+
"TERMINATION/EXCLUSION\n"+
"\n"+
"We reserve the right, in our sole discretion, to revoke any and all privileges associated with accessing and/or competing on our web site, and to take any other action we deem appropriate including but not limited to terminating or suspending your use of http://highschool.topcoder.com, for no reason or any reason whatsoever, including improper use of this site or failure to comply with these Terms.\n"+
"\n"+
"GENERAL\n"+
"\n"+
"We may assign, novate or subcontract any or all of our rights and obligations under these terms and conditions at any time.\n"+
"\n"+
"If you have any questions regarding these Terms, contact us at service@topcoder.com.\n";

};
