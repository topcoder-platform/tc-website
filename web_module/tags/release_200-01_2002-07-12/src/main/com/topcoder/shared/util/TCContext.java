package com.topcoder.shared.util;

import java.util.*;
import javax.naming.*;
import java.io.*;


public class TCContext {


  private TCContext() {
  }

  public static Context getInitial() throws NamingException {
    return getContext(ApplicationServer.JNDI_FACTORY, ApplicationServer.HOST_URL);
  }

  private static Context getContext(String initialContextFactory, String providerUrl) throws NamingException {
    Hashtable env=new Hashtable();
    env.put(Context.INITIAL_CONTEXT_FACTORY, initialContextFactory);
    env.put(Context.PROVIDER_URL, providerUrl);
    return new InitialContext(env);
  }

}

