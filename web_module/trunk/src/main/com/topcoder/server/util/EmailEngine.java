package com.topcoder.server.util;

import java.util.*;
import java.net.*;
import java.lang.*;
import java.io.*;
import org.apache.log4j.Category;
import javax.mail.*;
import javax.mail.internet.*;

/**
 * The EmailEngine is responsible for sending email.
 *
 * @author   Eric Ellingson
 * @version  $Revision$
 * @internal Log of Changes:
 *           $Log$
 *           Revision 1.1.2.4  2002/05/01 05:48:52  apps
 *           SB
 *
 *           Revision 1.1.2.4  2002/04/30 23:58:57  chuck
 *           fixed line that calls send to use configurable host and port
 *           (not constants SMTP_HOST_PORT and SMPT_HOST_ADDR)
 *
 *           Revision 1.1.2.3  2002/04/27 01:45:57  sord
 *           Added test for at least on TO address.
 *
 *           Revision 1.1.2.2  2002/04/17 12:43:17  apps
 *           Fixed some compiler issues.
 *
 *           Revision 1.1.2.1  2002/04/17 12:34:11  apps
 *           Initial implementation.
 *
 */
public class EmailEngine {

    public static final String SMTP_HOST_TYPE = "smtp";
    public static final String SMTP_HOST_ADDR = "172.16.20.41";
    public static final int SMTP_HOST_PORT = 25;

    private static Category trace = Category.getInstance( EmailEngine.class.getName() );
    
 /**
  * Send an email message.
  *
  * The email message must contain at least one primary address.
  *
  * @throws     Exception - if the message does not have a primary address.
  * @throws     Exception - if the a SMTP server can not be contacted.
  * @throws     Exception - if the SMPT server rejects the message.
  * @return     none
  */
    public static void send(TCSEmailMessage message) throws Exception {
        Address from = message.getFromAddress();
        Address to[] = message.getToAddress(TCSEmailMessage.TO);
        Address cc[] = message.getToAddress(TCSEmailMessage.CC);
        Address bcc[] = message.getToAddress(TCSEmailMessage.BCC);
        String subject = message.getSubject();
        String data = message.getBody();
        String host = SMTP_HOST_ADDR;
        int port = SMTP_HOST_PORT;
        
        if (to.length < 1)
            throw new Exception("There must be at least one TO: address");
        
        try {
            ResourceBundle resource = ResourceBundle.getBundle("EmailEngineConfig");
            host = resource.getString("smtp_host_addr");
            port = Integer.parseInt(resource.getString("smtp_host_port"));
        } catch (Exception e) {
            trace.warn("Failed to read/parse the 'EmailEngineConfig' resource file: " + e.getMessage());
            // ignore it and use the defaults.
        }
        
        try {
            send(host, port, 
                from, to, cc, bcc, subject, data);
        } catch (SendFailedException e) {
            throw new Exception("One or more addresses were not accepted.");
        }
    }
    
 /**
  * This function actually contacts a SMTP server and transmits the 
  * message.
  *
  * @return     a list of addresses that the SMTP server didn't accept.
  */
    private static void send(String host, int port,
            Address from, Address [] to, Address [] cc, Address [] bcc,
            String subject, String data) throws SendFailedException, Exception {
        Address [] ret = new Address[0];
        javax.mail.Session eMailSession = null;
        Transport eMailTransport = null;
        javax.mail.Message eMailMessage = null;
        Properties props = new Properties();
        props.put("mail.smtp.host", host);
        props.put("mail.transport.protocol", SMTP_HOST_TYPE);
        props.put("mail.host", host);
        props.put("mail.from", from);

        try {
            eMailSession = javax.mail.Session.getDefaultInstance(props, null);
            eMailMessage = new MimeMessage(eMailSession);
            eMailTransport = eMailSession.getTransport(SMTP_HOST_TYPE);
            eMailTransport.connect(host, 25, "", "");
            eMailMessage.setRecipients(javax.mail.Message.RecipientType.TO, to);
            if (cc != null)
                eMailMessage.setRecipients(javax.mail.Message.RecipientType.CC, cc);
            if (bcc != null)
                eMailMessage.setRecipients(javax.mail.Message.RecipientType.BCC, bcc);
            eMailMessage.setFrom(from);
            eMailMessage.setSubject(subject);
            Date sentDate = new Date();
            eMailMessage.setSentDate(sentDate);
            eMailMessage.setContent(data, "text/plain");
            eMailTransport.send(eMailMessage);
        } catch (NoSuchProviderException e) {
            trace.error("SMTP transport type not accepted", e);
            throw new Exception("Internal configuration error. SMTP transport not accepted.");
        } catch (MessagingException e) {
            trace.error("Failed to contact SMTP server", e);
            throw new Exception("Possible configuration error. SMTP server is not responding.");
        } finally {
            if (eMailTransport != null) {
                try {  
                    eMailTransport.close();
                } catch ( Exception ignore ) {
                }
            }
        }
    }
}

