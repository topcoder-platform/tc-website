package com.topcoder.web.ejb.security;

import junit.framework.TestCase;

import javax.xml.namespace.QName;
import javax.xml.rpc.Service;
import javax.xml.rpc.ServiceFactory;
import javax.xml.rpc.ServiceException;
import javax.xml.rpc.Call;
import java.rmi.RemoteException;
import java.net.URL;
import java.net.MalformedURLException;

import com.topcoder.shared.util.ApplicationServer;


/**
 * @author dok
 * @version $Id$
 *          Create Date: Mar 18, 2008
 */
public class AuthorizationTests extends TestCase {

/*
    public void testEJBHasPermission() {
        try {
            Authorization a = AuthorizationServiceLocator.getServices();
            assertTrue("dok doesn't have permission, but should", a.hasPermission(132456, 
                    new SimpleResource("com.topcoder.web.studio.controller.request.admin.ViewContests")));
        } catch (NamingException e) {
            throw new RuntimeException(e);
        } catch (CreateException e) {
            throw new RuntimeException(e);
        } catch (RemoteException e) {
            throw new RuntimeException(e);
        }
    }
*/


    /**
     * make a web service call using a dynamic proxy
     */
    public void testWebServiceHasPermission_proxy() {
        try {
            String wsdl = "http://"+ ApplicationServer.SECURITY_PROVIDER_URL + "/Security/AuthorizationBean?wsdl";
            QName serviceName = new QName("http://security.ejb.web.topcoder.com/", "AuthorizationService");
            ServiceFactory factory = ServiceFactory.newInstance();
            Service service = factory.createService(new URL(wsdl), serviceName);
            AuthorizationRemote au1 = null;
            au1 = (AuthorizationRemote)service.getPort(AuthorizationRemote.class);
            assertTrue("dok doesn't have permission, but should", au1.hasPermission(132456l, 
                    "com.topcoder.web.studio.controller.request.admin.ViewContests"));
        } catch (ServiceException e) {
            throw new RuntimeException(e);
        } catch (MalformedURLException e) {
            throw new RuntimeException(e);
        } catch (RemoteException e) {
            throw new RuntimeException(e);
        }

    }

    /**
     * make a web service call using dynamic interface invocation
     */
    public void testWebServiceHasPermission_dii() {
        try {
            String wsdl = "http://"+ ApplicationServer.SECURITY_PROVIDER_URL + "/Security/AuthorizationBean?wsdl";
            QName serviceName = new QName("http://security.ejb.web.topcoder.com/", "AuthorizationService");
            ServiceFactory factory = ServiceFactory.newInstance();
            Service service = factory.createService(new URL(wsdl), serviceName);
            QName portName = new QName("http://security.ejb.web.topcoder.com/", "AuthorizationPort");
            QName opName = new QName("http://security.ejb.web.topcoder.com/", "hasPermission");
            Call call = service.createCall(portName, opName);
            assertTrue("dok doesn't have permission, but should", (Boolean) call.invoke(new Object[]{132456l,
                    "com.topcoder.web.studio.controller.request.admin.ViewContests"}));
        } catch (ServiceException e) {
                    throw new RuntimeException(e);
                } catch (MalformedURLException e) {
                    throw new RuntimeException(e);
                } catch (RemoteException e) {
                    throw new RuntimeException(e);
                }

    }



    
}
