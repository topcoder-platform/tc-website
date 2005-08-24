package com.topcoder.web.ejb;

import junit.framework.*;

import java.util.*;
import javax.naming.*;
import javax.rmi.*;

public abstract class EJBTestCase extends TestCase {

  private final static String IP= "172.16.20.41"; //outside: 65.112.118.210  inside: 172.16.20.41

  private final static int PORT=8050;

  public EJBTestCase(String _name) {
    super(_name);
  }

  public static InitialContext getContext() {
    InitialContext ctx=null;
    try {
      Hashtable env = new Hashtable();
      env.put(Context.INITIAL_CONTEXT_FACTORY,
              "weblogic.jndi.WLInitialContextFactory");
      env.put(Context.PROVIDER_URL,"t3://"+IP+":"+PORT);
      ctx=new InitialContext(env);
    }
    catch (NamingException _ne) {
      _ne.printStackTrace();
      ctx=null;
    }
    return(ctx);
  }

};
