package com.topcoder.web.studio.controller.request;

import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.TCContext;
import com.topcoder.web.ejb.pacts.PactsClientServices;
import com.topcoder.web.ejb.pacts.PactsClientServicesHome;

import javax.ejb.CreateException;
import javax.naming.Context;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;
import java.rmi.Remote;
import java.rmi.RemoteException;

/**
 * Locator for pacts services
 */
public class PactsServicesLocator {
    private static PactsClientServicesHome home;
    
    public static PactsClientServices getService() throws NamingException, RemoteException, CreateException {
        PactsClientServicesHome h = home;
        if (h != null) {
            try {
                return h.create();
            } catch (Exception e) {
                //Let's create a new home
            }
        }
        h = getHome();
        PactsClientServices services = h.create();
        home = h;
        return services;
    }
    
    
    private static PactsClientServicesHome getHome() throws NamingException {
        Context ctx = TCContext.getInitial(ApplicationServer.PACTS_HOST_URL);
        try {
            Object objRef =  ctx.lookup("com.topcoder.web.ejb.pacts.PactsClientServicesHome");
            if (Remote.class.isAssignableFrom(PactsClientServicesHome.class))
                return (PactsClientServicesHome) PortableRemoteObject.narrow(objRef, PactsClientServicesHome.class);
             else
                return (PactsClientServicesHome) objRef;
        } finally {
            ctx.close();
        }
    }
 }

