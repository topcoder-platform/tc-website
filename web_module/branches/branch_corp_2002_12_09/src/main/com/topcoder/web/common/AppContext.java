package com.topcoder.web.common;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.rmi.RemoteException;
import java.util.Hashtable;
import java.util.Properties;

import javax.ejb.CreateException;
import javax.naming.InitialContext;
import javax.naming.NamingEnumeration;
import javax.naming.NamingException;
import javax.transaction.NotSupportedException;
import javax.transaction.SystemException;
import javax.transaction.Transaction;
import javax.transaction.TransactionManager;

import com.topcoder.security.admin.PrincipalMgrRemote;
import com.topcoder.security.admin.PrincipalMgrRemoteHome;
import com.topcoder.security.login.LoginRemote;
import com.topcoder.security.login.LoginRemoteHome;
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
    private static final Logger log = Logger.getLogger(AppContext.class);
    private static AppContext me = null;
    private Properties appProperties = null;
    private DatabaseContext databaseContext = null;
    private PersistStore persistStore = null;
    private Hashtable securityContextEnvironment = null;
    private Hashtable transactionContextEnvironment = null;
    private String txManagerJndiName = null;
    

	/**
	 * 
	 * @see java.lang.Object#Object()
	 */
	private AppContext() {}
	
	/**
     * 
	 * @return AppContext
	 * @throws IOException
	 * @throws FileNotFoundException
	 * @throws NamingException
	 */
	public static AppContext getInstance()
    throws IOException, FileNotFoundException
    {
		return getInstance(null);
	}

    /**
     * 
     * 
     * @return LoginRemote
     * @throws NamingException
     * @throws CreateException
     * @throws RemoteException
     */
    public LoginRemote getRemoteLogin()
    throws NamingException, CreateException, RemoteException
    {
        InitialContext ic = getSecurityContext();
        log.debug("remote security context is: " +ic);
        NamingEnumeration e = (NamingEnumeration)ic.list((String)"");
        while(e.hasMoreElements()) {
            log.debug("jndi-node: "+e.nextElement());
        }
         
        Object  l = ic.lookup(LoginRemoteHome.EJB_REF_NAME);
        ic.close();
        return ((LoginRemoteHome) l).create();
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
    throws IOException, FileNotFoundException
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
				me.doInit(propertiesFileName);
			}
		}
		return me;
	}    

	/**
	 * 
	 * @throws NamingException
	 */
	private void doInit(String propertiesFileName) {
//        // DEBUG - TIME //
//        // instantiate persistent store
//        if( propertiesFileName != null ) {
//            File dir = new File((new File(propertiesFileName)).getParent());
//            persistStore = PersistStore.getInstance(dir);
//        } 
        
        securityContextEnvironment = new Hashtable();
        transactionContextEnvironment = new Hashtable();
        
        // if these will be nulls then current ejb container will provide own default stuff
        String initialContextFactory = appProperties.getProperty("security-initial-context-factory"); 
		if( initialContextFactory != null ) {
            securityContextEnvironment.put(
                javax.naming.Context.INITIAL_CONTEXT_FACTORY,
                initialContextFactory
            );
        }

        String providerURL = appProperties.getProperty("security-provider-url");
        if( providerURL != null ) {
    		securityContextEnvironment.put(
                javax.naming.Context.PROVIDER_URL,
                providerURL
            );
        }
        
        // if these will be nulls then current ejb container will provide own default stuff
        initialContextFactory = appProperties.getProperty("jta-initial-context-factory");
        if( initialContextFactory != null ) {
            transactionContextEnvironment.put(
                javax.naming.Context.INITIAL_CONTEXT_FACTORY,
                initialContextFactory
            );
        }

        providerURL = appProperties.getProperty("jta-provider-url");
        if( providerURL != null ) {
            transactionContextEnvironment.put(
                javax.naming.Context.PROVIDER_URL,
                providerURL
            );
        }
        
        txManagerJndiName = appProperties.getProperty("jta-tx-manager-name");
	}

	/**
	 * Returns the jndiInitialContext.
	 * @return InitialContext
	 */
	public InitialContext getSecurityContext() throws NamingException {
		return new InitialContext(securityContextEnvironment);
	}

    /**
     * 
     * @return PrincipalMgrRemote
     * @throws CreateException
     * @throws RemoteException
     * @throws NamingException
     */    
    public PrincipalMgrRemote getRemotePrincipalManager() throws CreateException, RemoteException, NamingException, FileNotFoundException
    {
        InitialContext ic = getSecurityContext(); 
        Object  l = ic.lookup(PrincipalMgrRemoteHome.EJB_REF_NAME);
        ic.close();
        PrincipalMgrRemoteHome principalMgrRemoteHome = (PrincipalMgrRemoteHome)l;
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
    
    /**
     * Begins remote transaction in EJB container. To give EJB to work in the
     * managed transactional environment they must have &lt;transaction-type&gt;
     * Container&lt;/transaction-type&gt; in deployment descriptor (DD) and,
     * (optionally) have per-method transactions modes set in assembly
     * descriptor of DD.
     * 
     * @return Transaction newly started transaction transaction 
     * 
     * @throws NamingException There were some problems when trying to find
     * remote tarnsaction manager
     * @throws SystemException most probably there was failure trying to start
     * transaction in the DB
     * @throws NotSupportedException underlying DB does not support transactions
     */
    public Transaction beginTransaction()
    throws NamingException, SystemException, NotSupportedException
    {
        InitialContext ic = new InitialContext(transactionContextEnvironment);
        TransactionManager tm;
        tm = (TransactionManager) ic.lookup(txManagerJndiName);
        ic.close();
        tm.begin();
        return tm.getTransaction();
    }
}

