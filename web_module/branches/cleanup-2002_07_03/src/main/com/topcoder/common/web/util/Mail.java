package com.topcoder.common.web.util;

import javax.jms.*;
import java.util.*;
import java.io.*;
import javax.naming.*;
import com.topcoder.shared.messaging.*;
import com.topcoder.ejb.Util.*;
import com.topcoder.common.web.data.*;
import com.topcoder.common.web.error.*;
import com.topcoder.shared.docGen.xml.*;
import com.topcoder.common.*;
import com.topcoder.utilities.email.*;

public class Mail {

  ////////////////////////////////////////////////////////////////////////////////
  public static final boolean sendMail(EMailMessage mail) throws TCException {
  ////////////////////////////////////////////////////////////////////////////////
    InitialContext ctx = null;
    QueueMessageSender qMessSender = null;
    try {
      ctx = TCContext.getInitial( ApplicationServer.HOST_URL );
      HashMap props = new HashMap();
      props.put( "MailSubject", mail.getMailSubject() );
      props.put( "MailSentDate", new Long(mail.getMailSentDate().getTime()) );
      props.put( "MailToAddress", mail.getMailToAddress() );
      props.put( "MailFromAddress", mail.getMailFromAddress() );
      props.put( "MailFromPersonal", mail.getMailFromPersonal() );
      props.put( "CoderId", new Integer(mail.getCoderId()) );
      props.put( "Mode", mail.getMode() );
      qMessSender = new QueueMessageSender(DBMS.JMS_FACTORY, DBMS.EMAIL_QUEUE, ctx);      
      qMessSender.setFaultTolerant(true);
      boolean retVal = qMessSender.sendMessage(props, mail.getMailText());
      if (retVal) {
        Log.msg("Mail sent.");
        UtilHome home = (UtilHome) ctx.lookup ( ApplicationServer.UTIL );
        Util temp = home.create();
        temp.logMail( mail );
      } else {
        Log.msg("ERROR: Could not send mail.");
      }
      return retVal;
    } catch (Exception e) {
      Log.msg("ERROR: Could not send mail.");
      e.printStackTrace();
      return false;
    } finally {
      qMessSender.close();
      qMessSender = null;
      if (ctx!=null) {
        try {
          ctx.close();
        } catch (Exception ignore) {}
      }
    }
  }

  ////////////////////////////////////////////////////////////////////////////////
  public static void sendActivationMail ( int coderId, String toAddress,  
    String code, String url ) throws TCException {
  ////////////////////////////////////////////////////////////////////////////////
    try {
      EMailMessage mail = new EMailMessage();
      mail.setMailSubject("TopCoder Activation");
      mail.setMailSentDate( new java.sql.Date(DateTime.getCurrentTimestamp().getTime()) );
      StringBuffer msgText = new StringBuffer(1000);

      msgText.append ( "Your TopCoder activation code is ");
      msgText.append ( code);
      msgText.append ( "\n\n");
      msgText.append ( "To activate your account:\n\n");
      msgText.append ( "1) Navigate to the following WWW URL:\n");
      msgText.append ( url);
      //msgText.append ( "?");
      //msgText.append ( param);
      //msgText.append ( "=");
      msgText.append ( code);
      msgText.append ( "\n");
      msgText.append ( "If you can not click on the web address above, please copy the address ");
      msgText.append ( "into your web browser to continue.  If the address spans two lines, ");
      msgText.append ( "please make sure you copy and paste both sections without any spaces between ");
      msgText.append ( "them.\n\n");
      msgText.append ( "2) Login to TopCoder with your handle and password.\n");
      msgText.append ( "\n\nThank You for registering with TopCoder!\n");
      msgText.append ( "\n\nThis is an automated message.  ");
      msgText.append ( "Please do not reply to this email.");

      mail.setMailText( msgText.toString() );
      mail.setMailToAddress( toAddress );
      mail.setMailFromAddress( "service@topcoder.com" );
      mail.setMailFromPersonal( "TopCoder Service" );
      mail.setCoderId( coderId );
      mail.setReason( "Activation Mail" );
      mail.setMode( "S" );
      Mail.sendMail( mail );
    } catch (Exception e) {
      throw new TCException("common.web.util.Mail:sendActivationMail:ERROR\n"+e);
    }
  }

}
