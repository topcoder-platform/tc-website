package com.topcoder.utilities.email;

/*****************************
-------------------
com.topcoder.utilities.email.Affidavit
-------------------
This class compiles a list of
contest winners, composes and
sends the congrats email to
each winner, and then makes
a list of winners report
to send to the REPORT ADDRESS
*****************************/

import java.io.*;
import java.util.*;
import java.sql.*;
import com.topcoder.common.web.data.EMailMessage;
import com.topcoder.common.web.util.Mail;
import com.topcoder.server.common.*;
import com.topcoder.server.services.CoreServices;
import java.text.SimpleDateFormat;
import java.text.FieldPosition;
import java.text.DateFormat;




///////////////////////
public class Affidavit {
///////////////////////

  private static boolean LIVE                = false;
  private static String  TEST_ADDRESS        = "sburrows@topcoder.com";
  private static String  REPORT_ADDRESS      = "mbiondi@topcoder.com";
  private static String  FROM_ADDRESS        = "competitions@topcoder.com";
  private static String  FROM_NAME           = "TopCoder Competitions";
  private static String  SUBJECT             = "Congratulations!";
  private static int     PRIZE_PLACES        = 3;
  private static int     SLEEP_MILLISECONDS  = 500;


  //////////////////////////////////////////////////////////////////////////////// 
  public static void syntaxMsg () {
  //////////////////////////////////////////////////////////////////////////////// 
    StringBuffer msg = new StringBuffer ( 500 );
    msg.append ( "COMMAND SYNTAX:\n\n" );
    msg.append ( "[OPTION]... " );
    msg.append ( "<round_id> " );
    msg.append ( "[<live>:default=false]\n\n" );
    msg.append ( "OPTIONS:\n\n" );
    msg.append ( " -s milliseconds\n" );
    msg.append ( "    sleep milliseconds to between mail sends. Default is 300.\n" );
    msg.append ( " -t test_email_address\n" );
    msg.append ( "    address to send test emails to (ignored for live). Default is 'sburrows@topcoder.com'.\n" );
    System.out.println ( msg.toString() );
    System.exit(0);
  }

  //////////////////////////////////////////////////////////////////////////////// 
  public static void main ( String args[] ) throws SQLException, Exception {
  //////////////////////////////////////////////////////////////////////////////// 
    try {  
      int roundId = 0;
      int argLen = args.length;
      for ( int i = 0; i < argLen; i++ ) {
        if ( args[i].charAt(0) == '-' ) {
          if ( args[i].length() == 2 ) {
            switch ( args[i].charAt(1) ) {
              case 's':
                if ( (i+1) < argLen ) {  
                  try {
                    SLEEP_MILLISECONDS = Integer.parseInt ( args[i+1] );
                  } catch ( Exception badInt ) {
                    System.out.println ( "bad sleep parameter " + args[i+1] );
                    syntaxMsg();
                  }
                  i++;
                } else {
                  syntaxMsg();
                }
                break;
              case 't':
                if ( (i+1) < argLen ) { 
                  TEST_ADDRESS = args[i+1];
                  i++;
                } else {
                  syntaxMsg();
                }
                break;
              default:
                syntaxMsg();
            }
          } else {
            syntaxMsg();
          }
        } else if ( args[i].compareToIgnoreCase("true")==0 ) {
          System.out.println ( "Setting LIVE to true..." );
          LIVE = true;
        } else {
          try {
            roundId = Integer.parseInt ( args[i] );
          } catch ( Exception badInt ) {
            System.out.println ( "bad sleep parameter " + args[i+1] );
            syntaxMsg();
          }
        }
      }
      if ( roundId == 0 ) {
        syntaxMsg();
      }
      String mailMode             = "S";

      StringBuffer report         = new StringBuffer ( 5000 );
      report.append ( "Room" );
      report.append ( "|" );
      report.append ( "Place" );
      report.append ( "|" );
      report.append ( "Money" );
      report.append ( "|" );
      report.append ( "Handle" );
      report.append ( "|" );
      report.append ( "Email" );
      report.append ( "|" );
      report.append ( "FirstName" );
      report.append ( "|" );
      report.append ( "LastName" );
      report.append ( "|" );
      report.append ( "Address1" );
      report.append ( "|" );
      report.append ( "Address2" );
      report.append ( "|" );
      report.append ( "City" );
      report.append ( "|" );
      report.append ( "State" );
      report.append ( "|" );
      report.append ( "Country" );
      report.append ( "|" );
      report.append ( "Zip" );
      report.append ( "|" );
      report.append ( "ReferredBy" );
      report.append ( "\n" );
      EMailMessage mail = new EMailMessage();

      ContestRound round = CoreServices.getContestRound( roundId, roundId, false );
      String contestName = round.getContestName();
      HashMap rooms = CoreServices.getAffidavitRecipients( roundId );

      boolean tested = false;
      for ( Iterator i = rooms.keySet().iterator(); i.hasNext(); ) {
        HashMap roomPlaces = (HashMap) rooms.get ( i.next() );
        for ( Iterator j = roomPlaces.keySet().iterator(); j.hasNext(); ) {
          ArrayList coders = (ArrayList) roomPlaces.get ( j.next() );
          for ( int k = 0; k < coders.size(); k++ ) {
            AffidavitRecipient recipient = (AffidavitRecipient) coders.get(k);
            String roomDesc = recipient.getRoomDesc();
            if ( roomDesc.indexOf("Room ") == 0 ) {
              report.append ( roomDesc.substring(5) );
            } else { 
              report.append ( recipient.getRoomDesc() );
            }
            report.append ( "|" );
            report.append ( recipient.getPlaced() );
            report.append ( "|" );
            report.append ( recipient.getMoney() );
            report.append ( "|" );
            report.append ( recipient.getUserName() );
            report.append ( "|" );
            report.append ( recipient.getEmail() );
            report.append ( "|" );
            report.append ( recipient.getFirstName() );
            report.append ( "|" );
            report.append ( recipient.getLastName() );
            report.append ( "|" );
            report.append ( recipient.getAddress1() );
            report.append ( "|" );
            report.append ( recipient.getAddress2() );
            report.append ( "|" );
            report.append ( recipient.getCity() );
            report.append ( "|" );
            report.append ( recipient.getState() );
            report.append ( "|" );
            report.append ( recipient.getCountry() );
            report.append ( "|" );
            report.append ( recipient.getZip() );
            report.append ( "|" );
            report.append ( recipient.getReferredBy() );
            report.append ( "\n" );
            String msgText = setText ( recipient );
            // Pause... so as not to overload mail server (or message queue)
            if ( LIVE ) {
              try {
                Thread.sleep(SLEEP_MILLISECONDS);
              } catch(Exception e1) {}
            }
            // Set mail attributes and try to put email on message queue
            mail.setMailSubject     ( SUBJECT );
            mail.setMailSentDate    ( new java.sql.Date(System.currentTimeMillis()) );
            mail.setMailText        ( msgText );
            mail.setMailFromAddress ( FROM_ADDRESS );
            mail.setMailFromPersonal ( FROM_NAME );
            mail.setMode            ( mailMode );
            if ( LIVE ) {
              mail.setMailToAddress ( recipient.getEmail() );
              Mail.sendMail         ( mail );
            } else {
              mail.setMailToAddress ( TEST_ADDRESS );
              if ( !tested ) {
                Mail.sendMail         ( mail );
                tested = true;
              }
            }
          }
        }
      }
      if ( contestName != null ) {
        System.out.println ( "COMPILING RESULTS FOR SPREADSHEET..." );
        // Set mail attributes and try to put email on message queue
        mail.setMailSubject     ( contestName );
        mail.setMailSentDate    ( new java.sql.Date(System.currentTimeMillis()) );
        mail.setMailText        ( report.toString() );
        mail.setMailFromAddress ( FROM_ADDRESS );
        mail.setMode            ( mailMode );
        if ( LIVE ) {
          mail.setMailToAddress ( REPORT_ADDRESS );
          Mail.sendMail         ( mail );
        } else {
          mail.setMailToAddress ( TEST_ADDRESS );
          Mail.sendMail         ( mail );
        }
        System.out.println ( "RESULTS SENT TO " + mail.getMailToAddress() );
      }

    } catch ( Exception report ) {
      report.printStackTrace();
    }
    try {
      Thread.sleep(SLEEP_MILLISECONDS);
    } catch(Exception e1) {}
  }

  //////////////////////////////////////////////////////////////////////////////// 
  public static String setText ( AffidavitRecipient recipient ) {
  //////////////////////////////////////////////////////////////////////////////// 
    StringBuffer result = new StringBuffer(700);
    result.append ( "Congratulations, " + recipient.getUserName() + ":");
    result.append ( "\n\n");

    result.append ( "You finished ");
    if ( recipient.getTied() > 1 ) {
      result.append ( "tied for ");
    } else {
      result.append ( "in ");
    }
    switch ( recipient.getPlaced() ) {
      case 1:
        result.append ( "first ");
        break;
      case 2:
        result.append ( "second ");
        break;
      case 3:
        result.append ( "third ");
        break;
      default:
        result.append ( recipient.getPlaced());
        result.append ( " ");
        break;
    }
    result.append( "place in" );
    if( recipient.isUnrated() )
    {
        result.append( " the non-rated" );
    }
    else
    {
        result.append( " your" );
    }
    result.append( " division " );
    if( !recipient.isUnrated() )
    {
        result.append ( recipient.getDivision());
        result.append ( " ");
    }
    result.append ( "room for the ");
    result.append ( recipient.getContestName());
    //result.append ( " held on ");
    //String strDate = dateToString ( recipient.getContestStart() );
    //StringTokenizer dateTokenizer = new StringTokenizer ( strDate, " " );
    //if ( dateTokenizer.hasMoreTokens() ) {
      //result.append ( dateTokenizer.nextToken() );
    //}
    result.append ( ".  For this, you have won ");
    result.append ( java.text.NumberFormat.getCurrencyInstance().format(recipient.getMoney()));
    result.append ( ".\n\n");
    result.append ( "As a condition of winning and redeeming your prize, you must return the following documents to TopCoder within 60 days of this email:" );
    result.append ( "\n\n");
    result.append ( "1.  A completed Affidavit of Eligibility and Liability and Publicity Release.  " );
    result.append ( "\n\n");
    result.append ( "2.  IRS Form W-9 or W-8BEN, as appropriate. " );
    result.append ( "\n\n");
    result.append ( "TopCoder requires any member who receives money from TopCoder (whether in the form of prizes, referral commissions or compensation) to have one (1) notarized affidavit and one (1) appropriate IRS tax form on file with TopCoder before payment is made.  If you have not had a previous affidavit notarized, you must do so for this Single Round Match before you will be paid.  As long as you have a notarized affidavit on file, all subsequent winnings will be paid upon receipt of a completed and signed affidavit.  If you are unsure of whether you have a notarized affidavit or appropriate IRS tax form on file at TopCoder, you may inquire by email to mbiondi@topcoder.com.  " );
    result.append ( "\n\n");
    result.append ( "These documents are posted on TopCoder's website.  Navigate to http://www.topcoder.com/?t=affidavit&c=list.  " );
    result.append ( "You will be prompted to login to view your instructions and affidavit list.  " );
    result.append ( "\n\n");
    result.append ( "If you fail to return these documents as specified, or if you provide false information in these forms, you will be disqualified and the prize money you won will be forfeited.  " );
    result.append ( "\n\n");
    result.append ( "Please mail these documents to:" );
    result.append ( "\n\n");
    result.append ( "TopCoder" );
    result.append ( "\n");
    result.append ( "703 Hebron Avenue" );
    result.append ( "\n");
    result.append ( "Glastonbury, CT 06033" );
    result.append ( "\n\n");
    result.append ( "Payment will be sent to the address indicated in your TopCoder member profile, so please make sure that this information is current.  " );
    result.append ( "\n\n");
    result.append ( "Congratulations once again, and good luck in future competitions." );
    return result.toString();
  }


  /**
   * Converts a Date to a String.
   * The String have to be in 'MM/DD/YYYY' format
   */
  ////////////////////////////////////////////////////////
  public static String dateToString(java.sql.Date dDate) {
  ////////////////////////////////////////////////////////
    if (dDate == null)
      return null;
    // first, check date format
    SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy hh:mm:ss aaa");
    format.setLenient(false);
    StringBuffer sDate = new StringBuffer();
    sDate= format.format(dDate, sDate, new FieldPosition(0));
    if (sDate == null) return "";
    return sDate.toString();
  }



}
