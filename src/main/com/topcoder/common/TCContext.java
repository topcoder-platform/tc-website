package com.topcoder.common;

import java.util.*;
import javax.naming.*;


public class TCContext {


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
  

}
