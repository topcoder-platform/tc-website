package com.topcoder.web.common;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.rmi.RemoteException;
import java.util.Hashtable;
import java.util.Properties;

import javax.ejb.CreateException;
import javax.naming.InitialContext;
import javax.naming.NamingException;

import com.topcoder.security.admin.PrincipalMgrRemote;
import com.topcoder.security.admin.PrincipalMgrRemoteHome;
import com.topcoder.shared.util.logging.Logger;

/**
 * because this will used frequently, it is possible to supply some on-the-fly
 * modifications tracking of properties file
 * 
 * @author djFD
 * @version  $Revision$
 */
public class AppContext {
    private static Logger log = Logger.getLogger(AppContext.class);
    private static AppContext me = null;
    private Properties appProperties = null;
    private InitialContext jndiInitialContext = null;
    private PrincipalMgrRemoteHome principalMgrRemoteHome = null;
    private DatabaseContext databaseContext = null;

	/**
	 * 
	 * @see java.lang.Object#Object()
	 */
	private AppContext() {}
	
	
	public static AppContext getInstance() throws IOException, FileNotFoundException, NamingException {
		return getInstance(null);
	}


    /**
     * 
     * @param propertiesFileName
     * @return Context
     * @throws IOException
     * @throws FileNotFoundException
     * @throws NamingException
     */
	public static AppContext getInstance(String propertiesFileName) 
										throws IOException, FileNotFoundException, NamingException
	{
		if( me != null ) return me;
		synchronized( log ) {
			if( me == null ) {
				me = new AppContext();
				// populate from properties
				me.appProperties = new Properties();
				if( propertiesFileName != null ) {
					me.appProperties.load(new FileInputStream(propertiesFileName));
				}
				me.doInit();
			}
		}
		return me;
	}    

	/**
	 * 
	 * @throws NamingException
	 */
	private void doInit() throws NamingException {
		Hashtable envir = new Hashtable();
        
        // if these will be nulls then current ejb container will provide own default stuff
        String initialContextFactory = appProperties.getProperty("jndi-initial-context-factory"); 
		if( initialContextFactory != null ) {
            envir.put(javax.naming.Context.INITIAL_CONTEXT_FACTORY, initialContextFactory );
        }

        String providerURL = appProperties.getProperty("jndi-provider-url");
        if( providerURL != null ) {
    		envir.put(javax.naming.Context.PROVIDER_URL, providerURL );
        }
		jndiInitialContext = new InitialContext(envir);

        Object  l = jndiInitialContext.lookup(PrincipalMgrRemoteHome.EJB_REF_NAME);
        principalMgrRemoteHome = (PrincipalMgrRemoteHome)l;
	}

	/**
	 * Returns the jndiInitialContext.
	 * @return InitialContext
	 */
	public InitialContext getJndiInitialContext() {
		return jndiInitialContext;
	}

    /**
     * 
     * @return PrincipalMgrRemote
     * @throws CreateException
     * @throws RemoteException
     * @throws NamingException
     */    
    public PrincipalMgrRemote getRemotePrincipalManager() throws CreateException, RemoteException, NamingException
    {
        if(principalMgrRemoteHome == null ) {
            doInit();
        }
        return principalMgrRemoteHome.create(); 
    }
    
    /**
     * Returns current context of database.
     * @return DatabaseContext for this application context
     */
    public DatabaseContext getDBContext() {
        return databaseContext;
    }
}

