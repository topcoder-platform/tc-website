/*
 * AdminLoginBean.java
 * 6 September 2002
 * 1.0
 *
 * Copyright (c) 2002, TopCoder, Inc.
 * All rights reserved.
 */


package com.topcoder.dde.admin;

import com.topcoder.security.GeneralSecurityException;
import com.topcoder.security.RolePrincipal;
import com.topcoder.security.TCSubject;
import com.topcoder.security.login.LoginRemote;
import com.topcoder.security.login.LoginRemoteHome;
import com.topcoder.util.config.*;

import javax.ejb.CreateException;
import javax.ejb.EJBException;
import javax.ejb.SessionBean;
import javax.ejb.SessionContext;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;
import java.rmi.RemoteException;
import java.util.Enumeration;
import java.util.Vector;


/**
 * The implementation of the methods of AdminLoginEJB.
 *
 * @version 1.0, 6 September 2002
 * @author  Albert Mao
 * @see     AdminLogin
 * @see     AdminLoginHome
 */
public class AdminLoginBean implements SessionBean, ConfigManagerInterface {

    private static final String
            CONFIG_NAMESPACE = "com.topcoder.dde.admin.AdminLoginBean";

    private SessionContext ejbContext;
    private LoginRemote authenticator;


    public AdminLoginBean() {
    }


    public void ejbCreate() throws CreateException {
        try {
            ConfigManager config = ConfigManager.getInstance();
            if (config.existsNamespace(CONFIG_NAMESPACE)) {
                config.refresh(CONFIG_NAMESPACE);
            } else {
                config.add(CONFIG_NAMESPACE,
                        ConfigManager.CONFIG_PROPERTIES_FORMAT);
            }
            /*
            Hashtable principalMgrEnvironment=new Hashtable();
            principalMgrEnvironment.put(Context.INITIAL_CONTEXT_FACTORY, "org.jnp.interfaces.NamingContextFactory");
            //Object url = contexts.getObject(key);
            principalMgrEnvironment.put(Context.PROVIDER_URL, config.getString(CONFIG_NAMESPACE,"securitymanagerip"));
            Context remoteContext = new InitialContext(principalMgrEnvironment);
            */
            Context remoteContext = new InitialContext();
            LoginRemoteHome loginHome = (LoginRemoteHome)
                    PortableRemoteObject.narrow(
                            remoteContext.lookup(LoginRemoteHome.EJB_REF_NAME),
                            LoginRemoteHome.class);
            authenticator = loginHome.create();
        } catch (ConfigManagerException exception) {
            throw new EJBException(
                    "Failed to obtain configuration data: " + exception.toString());
        } catch (NamingException exception) {
            throw new EJBException(exception.toString());
        } catch (RemoteException exception) {
            throw new EJBException(exception.toString());
        }
    }

    public TCSubject login(String username, String password)
            throws GeneralSecurityException {
        if (username == null) {
            throw new GeneralSecurityException(
                    "Null specified for username");
        }
        if (password == null) {
            throw new GeneralSecurityException(
                    "Null specified for password");
        }

        TCSubject subject;
        try {
            subject = authenticator.login(username, password);
        } catch (RemoteException exception) {
            throw new EJBException(exception.toString());
        }

        String principalName;
        long principalId;
        try {
            ConfigManager config = ConfigManager.getInstance();
            if (config.existsNamespace(CONFIG_NAMESPACE)) {
                config.refresh(CONFIG_NAMESPACE);
            } else {
                config.add(CONFIG_NAMESPACE,
                        ConfigManager.CONFIG_PROPERTIES_FORMAT);
            }
            principalName = config.getString(CONFIG_NAMESPACE,
                    "admin_principal_name");
            principalId = Long.parseLong(
                    config.getString(CONFIG_NAMESPACE, "admin_principal_id"));
        } catch (ConfigManagerException exception) {
            throw new GeneralSecurityException(
                    "Failed to obtain configuration data: " + exception.toString());
        } catch (NumberFormatException exception) {
            throw new GeneralSecurityException(
                    "Configuration data contains invalid id: " + exception.toString());
        }
        if (!subject.getPrincipals().contains(
                new RolePrincipal(principalName, principalId))) {
            throw new com.topcoder.security.login.AuthenticationException(
                    "Specified user does not have the administrator role");
        }
        return subject;
    }

    public String getNamespace() {
        return CONFIG_NAMESPACE;
    }

    public Enumeration getConfigPropNames() {
        Vector propNames = new Vector();
        propNames.add("admin_principal_id");
        propNames.add("admin_principal_name");
        return propNames.elements();
    }

    public void ejbActivate() {
    }

    public void ejbPassivate() {
        /*
         * All fields are either remote interfaces of other enterprise beans or
         * instances of <code>SessionContext</code>, so nothing needs to be done
         * to enable serialization.
         */
    }

    public void ejbRemove() {
    }

    public void setSessionContext(SessionContext context) {
        ejbContext = context;
    }

}





