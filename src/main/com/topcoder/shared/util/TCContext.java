package com.topcoder.shared.util;

import java.util.*;
import javax.naming.*;
import java.io.*;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.util.XProperties;


public class TCContext {

  private static Logger log = Logger.getLogger(TCContext.class);
  private TCContext() {
  }

  public static Context getInitial() throws NamingException {
    return getContext(ApplicationServer.JNDI_FACTORY, ApplicationServer.HOST_URL);
  }

  public static Context getInitial(String url) throws NamingException {
    return getContext(ApplicationServer.JNDI_FACTORY, url);
  }

  public static Context getContestInitial() throws NamingException {
    return getContext(ApplicationServer.JNDI_FACTORY, ApplicationServer.CONTEST_HOST_URL);
  }

  /**
   * Instatiates a context specifically for the Pacts Message Queue
   * This doesn't seem to make sense because Sample.properties doesn't seem to work anywhere. 
   * 
   *
   * @author   Jason N. Evans (grunt)
   * @version  1.00, 06/14/2002
   * @throws  java.io.FileNotFoundException If there is some problem locating the properties file
   * @throws  java.io.IOException If there is some problem reading the properties file
   * @throws  java.lang.Exception For any other exception
   */
  public static final InitialContext getPactsInitial()
    throws NamingException      {
      Hashtable env = new Hashtable();
      try {
        Properties prop = new XProperties();
        java.io.InputStream in = new java.io.FileInputStream("Sample.properties");
        prop.load(in);
        env.put(javax.naming.Context.INITIAL_CONTEXT_FACTORY, prop.getProperty("JNDI_FACTORY"));
        env.put(javax.naming.Context.PROVIDER_URL, prop.getProperty("PACTS_HOST_URL"));
      } catch (java.io.FileNotFoundException exception1) {
          log.error("Error locating properties file for Pacts context");
      } catch (java.io.IOException exception2) {
          log.error("Error reading properties file for Pacts context");
      } catch (java.lang.Exception exception3) {
          log.error("Error getting context for Pacts");
      }
    return new InitialContext(env);
  }

  private static Context getContext(String initialContextFactory, String providerUrl) throws NamingException {
    Hashtable env=new Hashtable();
    env.put(Context.INITIAL_CONTEXT_FACTORY, initialContextFactory);
    env.put(Context.PROVIDER_URL, providerUrl);
    return new InitialContext(env);
  }

}

