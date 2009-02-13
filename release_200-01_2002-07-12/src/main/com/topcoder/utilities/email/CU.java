package com.topcoder.utilities.email;

import java.io.*;
import java.util.*;
import java.sql.*;
import com.topcoder.common.*;
import com.topcoder.common.web.data.*;
import com.topcoder.common.web.util.*;
import java.text.DateFormat;

public class CU {

  //////////////////////////////////////////////////////////////////////////////// 
  public static void main(String args[]) throws SQLException, Exception
  //////////////////////////////////////////////////////////////////////////////// 
  {
    if (args.length < 3)
    {
      System.out.println("");
      String msg="Usage: java com.topcoder.email.CU subject list_filename email_addr_from [<live>:default=false]";
      System.out.println(msg);
      System.out.println("");
      return;
    }
 
    String mailSubject = args[0];
    String listFileName = args[1];
    String fromAddress = args[2];
    boolean live = false;
    if ( args.length==4 ) {
      live = Boolean.valueOf(args[3]).booleanValue();
    }
    String mailMode = "S";
    EMailMessage mail = new EMailMessage();
    String handle = "";
    String email = "";
    String code = "";
    String emailBody = "";
    StringBuffer msg = new StringBuffer(128);
    String line = null;
    FileReader fr = null;

    try {
      fr = new FileReader(listFileName);
    } catch(Exception e){
      System.out.println("ERROR: Could not open file: " + listFileName);
      return;
    }
    BufferedReader br = new BufferedReader(fr);
    try {
      while ( true ) {
        line = br.readLine();
        if (line == null) {
          break; 
        } else {
          StringTokenizer rec = new StringTokenizer ( line, "|" );
          handle = rec.nextToken();
          email = rec.nextToken();
          code = rec.nextToken();
          System.out.println("HANDLE:"+handle+" EMAIL TO:"+email+" CODE:"+code);
          emailBody = setText ( handle, code );
          // Pause... so as not to overload mail server (or message queue)
          try {
            Thread.sleep(500);
          } catch(Exception e1) {}
          // Set mail attributes and try to put email on message queue
          try {
            mail.setCoderId(0);
            mail.setMailSubject(mailSubject);
            mail.setReason("bulk");
            mail.setMailSentDate( new java.sql.Date(System.currentTimeMillis()) );
            mail.setMailText(emailBody);
            mail.setMailFromAddress(fromAddress);
            mail.setMode(mailMode);
            if ( live ) {
              mail.setMailToAddress(email);
            } else {
              mail.setMailToAddress("sburrows@topcoder.com");
            }
            Mail.sendMail(mail);
            if ( !live ) break;
          } catch(Exception e){
            e.printStackTrace();
          }
          line = null;
        }
      }
      fr.close();
    }catch(Exception e){
      System.out.println("ERROR: Error reading through file.");
      e.printStackTrace();
    }

  }


  ////////////////////////////////////////////////////////////////////////////////
  public static String setText(String handle, String actCode) {
  ////////////////////////////////////////////////////////////////////////////////
    StringBuffer msg = new StringBuffer(256);
    String activationURL = "http://" + ApplicationServer.SERVER_NAME + "/?Task=authentication&ActivationCode=" + actCode;
    msg.append ( "Hello, " + handle + ".");
    msg.append ( "\n\n");
    msg.append ( "I noticed that you went all the way through the registration process for TopCoder a while ago.  ");
    msg.append ( "However, as of today, you have not yet taken the last step of activating your account.  ");
    msg.append ( "The final step is simply to click on this URL:");
    msg.append ( "\n\n");
    msg.append ( activationURL);
    msg.append ( "\n\n");
    msg.append ( "Once you have clicked, you will be a member of TopCoder and can take advantage of all we have to offer.  ");
    msg.append ( "This includes the opportunity to participate in two Single Round Matches every week and a chance to win ");
    msg.append ( "individual prize money up to $300 (3 of every 8 Coders win cash).  ");
    msg.append ( "\n\n");
    msg.append ( "If you are a college student in the U.S., activating your account makes you eligible to compete in those ");
    msg.append ( "matches AND may entitle you to participate in the 2002 Sun Microsystems and TopCoder $150,000 Collegiate ");
    msg.append ( "Challenge Tournament.  The Collegiate Challenge starts in February with the top 512 rated members invited ");
    msg.append ( "to compete.  So you must compete quickly to earn a rating strong enough for an invite to the Tournament.");
    msg.append ( "\n\n");
    msg.append ( "The next match is this evening, Wednesday, January 30th at 9:00 PM EST.  ");
    msg.append ( "Registration begins at 7:30 PM EST and closes at 8:55 PM.  The schedule for other matches are on the website.");
    msg.append ( "\n\n");
    msg.append ( "If you do not activate this account within one week, we will remove your information from our system.  ");
    msg.append ( "This will not preclude you from registering again in the future, but you will have to start from the beginning.");
    msg.append ( "\n\n");
    msg.append ( "If you have any questions about this email or about your TopCoder registration information, just let me know.");
    msg.append ( "\n\n");
    msg.append ( "I hope to see you in the Arena.");
    msg.append ( "\n\n");
    msg.append ( "Tom Longo");
    msg.append ( "\n");
    msg.append ( "Vice President of Membership");
    msg.append ( "\n");
    msg.append ( "TopCoder, Inc.");
    return msg.toString();
  }

}
