package com.topcoder.common;

import java.util.*;
import javax.naming.*;
import java.io.*;
import org.apache.log4j.*;
import com.topcoder.common.web.XProperties;


public class TCContext {

    private static Category log = Category.getInstance(TCContext.class.getName());

    ////////////////////////////////////////////////////////////////////////////////
    public static final InitialContext getInitial() throws NamingException {
    ////////////////////////////////////////////////////////////////////////////////
      Hashtable env = new Hashtable();
      env.put(javax.naming.Context.INITIAL_CONTEXT_FACTORY, ApplicationServer.JNDI_FACTORY);
      env.put(javax.naming.Context.PROVIDER_URL, ApplicationServer.HOST_URL);
      return new InitialContext(env);
    }


  ////////////////////////////////////////////////////////////////////////////////
  public static final InitialContext getInitial(String url) throws NamingException {
  ////////////////////////////////////////////////////////////////////////////////
    Hashtable env = new Hashtable();
    env.put(javax.naming.Context.INITIAL_CONTEXT_FACTORY, ApplicationServer.JNDI_FACTORY);
    env.put(javax.naming.Context.PROVIDER_URL, url);
    return new InitialContext(env);
  }


  ////////////////////////////////////////////////////////////////////////////////
  public static final InitialContext getLocalInitial() throws NamingException {
  ////////////////////////////////////////////////////////////////////////////////
    return new InitialContext();
  }


  ////////////////////////////////////////////////////////////////////////////////
  public static final InitialContext getContestInitial() throws NamingException {
  ////////////////////////////////////////////////////////////////////////////////
    Hashtable env = new Hashtable();
    env.put(javax.naming.Context.INITIAL_CONTEXT_FACTORY, ApplicationServer.JNDI_FACTORY);
    env.put(javax.naming.Context.PROVIDER_URL, ApplicationServer.CONTEST_HOST_URL);
    return new InitialContext(env);
  }

  ////////////////////////////////////////////////////////////////////////////////
  public static final InitialContext getMPSQASInitial() throws NamingException {
  ////////////////////////////////////////////////////////////////////////////////
    Hashtable env = new Hashtable();
    env.put(javax.naming.Context.INITIAL_CONTEXT_FACTORY, ApplicationServer.JNDI_FACTORY);
    env.put(javax.naming.Context.PROVIDER_URL, ApplicationServer.MPSQAS_HOST_URL);
    return new InitialContext(env);
  }

  /**
   * Instatiates a context specifically for the Pacts Message Queue
   *
   * @author   Jason N. Evans (grunt)
   * @version  1.00, 06/14/2002
   * @throws  java.io.FileNotFoundException If there is some problem locating the properties file
   * @throws  java.io.IOException If there is some problem reading the properties file
   * @throws  java.lang.Exception For any other exception
   */
  ////////////////////////////////////////////////////////////////////////////////
  public static final InitialContext getPactsInitial()
    throws NamingException      {
    ////////////////////////////////////////////////////////////////////////////////
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
}

