package com.topcoder.web.studio.controller.request;

import java.rmi.Remote;
import java.rmi.RemoteException;

import javax.ejb.CreateException;
import javax.naming.Context;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;

import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.TCContext;
import com.topcoder.web.ejb.pacts.PactsServices;
import com.topcoder.web.ejb.pacts.PactsServicesHome;

/**
 */
public class PactsServicesLocator {
    private static PactsServicesHome home;
    
    public static PactsServices getService() throws NamingException, RemoteException, CreateException {
        PactsServicesHome h = home;
        if (h != null) {
            try {
                return h.create();
            } catch (Exception e) {
                //Let's create a new home
            }
        }
        h = getHome();
        PactsServices services = h.create();
        home = h;
        return services;
    }
    
    
    private static PactsServicesHome getHome() throws NamingException {
        Context ctx = TCContext.getInitial(ApplicationServer.PACTS_HOST_URL);
        try {
            Object objRef =  ctx.lookup("com.topcoder.web.ejb.pacts.PactsServicesHome");
            if (Remote.class.isAssignableFrom(PactsServicesHome.class))
                return (PactsServicesHome) PortableRemoteObject.narrow(objRef, PactsServicesHome.class);
             else
                return (PactsServicesHome) objRef;
        } finally {
            ctx.close();
        }
    }
 }

