package com.topcoder.server.util;

import java.util.*;
import java.net.*;
import java.lang.*;
import java.io.*;
import org.apache.log4j.Category;
import javax.mail.*;
import javax.mail.internet.*;
import javax.mail.internet.MimeUtility;

/**
 * The TCSEmailMessage class represents a single email message.
 *
 * @author   Eric Ellingson
 * @version  $Revision$
 * @internal Log of Changes:
 *           $Log$
 *           Revision 1.1.2.2  2002/04/17 12:43:17  apps
 *           Fixed some compiler issues.
 *
 *           Revision 1.1.2.1  2002/04/17 12:34:11  apps
 *           Initial implementation.
 *
 */
public class TCSEmailMessage extends TCSMessage {

    private static Category trace = Category.getInstance( TCSEmailMessage.class.getName() );
    private InternetAddress from = null;
    private InternetAddress to[][] = new InternetAddress[3][0];
    private String subject = "";
    private String body = "";
    public static final int TO = 0;
    public static final int CC = 1;
    public static final int BCC = 2;
    
 /**
  * Set the from address.
  */
    public void setFromAddress(String addr) throws Exception {
        try {
            from = new InternetAddress(addr);
        } catch (AddressException e) {
            throw new Exception("Invalid Address");
        }
    }
    
 /**
  * Set the from address.
  */
    public void setFromAddress(String addr, String personal) throws Exception {
        try {
            from = new InternetAddress(addr, personal);
        } catch (UnsupportedEncodingException e) {
            throw new Exception("Invalid Address");
        }
    }
    
 /**
  * Set the address of the specified type (TO, CC, or BCC).
  * Any to addresses this type that have already been set will be discarded.
  */
    public void setToAddress(String addr, int type) throws Exception {
        if (type < 0 || type >= to.length) throw new Exception("Invalid type");
        to[type] = new InternetAddress[0];
        addToAddress(addr, type);
    }
    
 /**
  * Set the address of the specified type (TO, CC, or BCC).
  * Any to addresses this type that have already been set will be discarded.
  */
    public void setToAddress(String addr, String personal, int type) throws Exception {
        if (type < 0 || type >= to.length) throw new Exception("Invalid type");
        to[type] = new InternetAddress[0];
        addToAddress(addr, personal, type);
    }
    
 /**
  * Add an additional to address fo the specified type (TO, CC, BCC).
  */
    public void addToAddress(String addr, int type) throws Exception {
        if (type < 0 || type >= to.length) throw new Exception("Invalid type");
        to[type] = addAddress(to[type], new InternetAddress(addr));
    }
    
 /**
  * Add an additional to address fo the specified type (TO, CC, BCC).
  */
    public void addToAddress(String addr, String personal, int type) throws Exception {
        if (type < 0 || type >= to.length) throw new Exception("Invalid type");
        to[type] = addAddress(to[type], new InternetAddress(addr, personal));
    }
    
 /**
  * Set the subject of the message.
  */
    public void setSubject(String subject) {
        this.subject = subject;
    }
    
 /**
  * Set the body of the message.
  */
    public void setBody(String body) {
        this.body = body;
    }

 /**
  * Returns the formatted from address for the message.
  *
  * @return     The formatted from address that has been set for the message or null if the address has not been set.
  */
    public Address getFromAddress() {
        return from;
    }
    
 /**
  * Returns a list of formatted to addresses of the specified type.
  *
  * @return     A list of formatted addresses.
  * If no addresses of the given type have been set, the returned array will be of length 0.
  */
    public Address [] getToAddress(int type) throws Exception {
        if (type < 0 || type >= to.length) throw new Exception("Invalid type");
        return dup(to[type]);
    }
    
 /**
  * Returns the subject of the message.
  *
  * @return     The subject of the message or a 0 length string if no subject has been set.
  */
    public String getSubject() {
        return subject;
    }
    
 /**
  * Returns the body of the message.
  *
  * @return     The body of the message or a 0 length string if no body has been set.
  */
    public String getBody() {
        return body;
    }

 /**
  * Adds an address to the list of addresses using a shallow copy.
  */
    private InternetAddress [] addAddress(InternetAddress [] src, InternetAddress add) {
        InternetAddress dst[] = new InternetAddress[src.length+1];
        for (int i=0; i<src.length; i++) {
            dst[i] = src[i];
        }
        dst[src.length] = add;
        return dst;
    }    

 /**
  * Returns a deep copy of the Address list.
  */
    private InternetAddress [] dup(InternetAddress [] src) {
        InternetAddress dst[] = new InternetAddress[src.length];
        for (int i=0; i<dst.length; i++) {
            try {
                dst[i] = new InternetAddress(src[i].getAddress(), src[i].getPersonal());
            } catch (Exception e) {
                dst[i] = src[i];
            }
        }
        return dst;
    }    
    
}

