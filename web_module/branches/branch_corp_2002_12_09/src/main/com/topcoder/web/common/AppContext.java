package com.topcoder.web.common;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.rmi.RemoteException;
import java.rmi.server.RMIClassLoader;
import java.util.Hashtable;
import java.util.Properties;

import javax.ejb.CreateException;
import javax.naming.InitialContext;
import javax.naming.NamingException;

import com.topcoder.security.admin.PrincipalMgrRemote;
import com.topcoder.security.admin.PrincipalMgrRemoteHome;
import com.topcoder.shared.dataAccess.DatabaseContext;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.corp.stub.PersistStore;

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
    private PersistStore persistStore = null;

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
                    log.debug("---- props file name ---- "+propertiesFileName);
					me.appProperties.load(new FileInputStream(propertiesFileName));
				}
				me.doInit(propertiesFileName);
			}
		}
		return me;
	}    

	/**
	 * 
	 * @throws NamingException
	 */
	private void doInit(String propertiesFileName) throws NamingException {
        // DEBUG - TIME //
        // instantiate persistent store
        if( propertiesFileName != null ) {
            File dir = new File((new File(propertiesFileName)).getParent());
            if( dir == null ) {
                System.err.println("-- dir --"+dir);
            }
            else {
                System.err.println("-- dir path --"+dir.getAbsolutePath());
            }
                
            persistStore = PersistStore.getInstance(dir);
        } 
        
        
        
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
        try {
        System.err.println(l.getClass().getClassLoader());
        System.err.println(Class.forName("com.topcoder.security.admin.PrincipalMgrRemoteHome").getClassLoader());
        System.err.println("------"+RMIClassLoader.getClassLoader("http://mframe:8083/")+"------");
        }
        catch(Exception e) {
        }
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
            doInit(null);
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

    /**
     * Returns persistent store.
     * 
     * @return PersistStore
     */
    public PersistStore getStore() {
        return persistStore;
    }
}

