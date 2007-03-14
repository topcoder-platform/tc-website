package com.topcoder.web.studio.controller.request;

import java.rmi.RemoteException;
import java.util.Hashtable;

import javax.ejb.CreateException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.ejb.pacts.PactsServices;
import com.topcoder.web.ejb.pacts.PactsServicesHome;

/**
 * 
 *
 * @author Bauna
 * @version 1.0
 */
public class ServiceLocator {
    protected static final Logger log = Logger.getLogger(ServiceLocator.class);
   
    private static final ServiceLocator instance = new ServiceLocator();
    private static InitialContext context;
    
    private ServiceLocator() {}
    
    public static ServiceLocator getInstance(String providerURL) throws ServiceLocatorNamingException {
        if (context == null) {
            
            Hashtable props = new Hashtable();
            props.put(Context.INITIAL_CONTEXT_FACTORY, "org.jnp.interfaces.NamingContextFactory");
            props.put(Context.PROVIDER_URL, providerURL);
            props.put(Context.URL_PKG_PREFIXES, "org.jboss.naming:org.jnp.interfaces");
            log.debug("Service JNDI Address: " + props.get(Context.PROVIDER_URL));
            try {
                context = new InitialContext(props);
            } catch (NamingException e) {
                throw new ServiceLocatorNamingException(e);
            }
        }
        return instance;
    }
    
    public InitialContext getInitialContext() {
        return context;
    }
    
    public PactsServicesHome getPactsServicesHome() throws ServiceLocatorNamingException {
        try {
            return (PactsServicesHome) PortableRemoteObject.narrow(
                    getInitialContext().lookup("com.topcoder.web.ejb.pacts.PactsServicesHome"),
                    PactsServicesHome.class);
        } catch (NamingException e) {
            throw new ServiceLocatorNamingException(e);
        }
    }
    
    public PactsServices getPactsServices() throws ServiceLocatorNamingException, ServiceLocatorCreateException {
        try {
            return getPactsServicesHome().create();
        } catch (RemoteException e) {
            throw new ServiceLocatorCreateException("error creating PactsServices",e);
        } catch (CreateException e) {
            throw new ServiceLocatorCreateException("error creating PactsServices", e);
        }
//      PactsServicesHome home = (PactsServicesHome) PortableRemoteObject.narrow(
//              getInitialContext().lookup("com.topcoder.web.ejb.pacts.PactsServicesHome"),
//              PactsServicesHome.class);
//      try {
//          PactsServices pactsServices = home.create();
//          List l =  pactsServices.getAssignmentDocumentByProjectId(23308946);
//          for (Iterator i = l.iterator(); i.hasNext();) {
//              AssignmentDocument ad = (AssignmentDocument) i.next();
//              System.out.println("ad: " + ad.getComponentProjectId() + 
//                      ", " + ad.getStatus().getDescription());
//          }
//          System.out.println("pactsServices.getUserTypes(): " + pactsServices.getAssignmentDocumentByProjectId(23308946));
//          return pactsServices;
//      } catch (Exception e) {
//          e.printStackTrace();
//          throw new RuntimeException(e);
//      } 
        
    }
}
