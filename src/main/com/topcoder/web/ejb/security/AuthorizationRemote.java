package com.topcoder.web.ejb.security;

import com.topcoder.shared.security.Resource;

import javax.ejb.Remote;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebService;
import javax.jws.soap.SOAPBinding;

/**
 * @author dok
 * @version $Id$
 *          Create Date: Feb 28, 2008
 */
@Remote
@WebService(name = "Authorization", serviceName = "Authorization", portName = "AuthorizationPort")
@SOAPBinding(style = SOAPBinding.Style.RPC)
//extend java.rmi.Remote so that we can use this for a dynamic proxy
public interface AuthorizationRemote extends Authorization, java.rmi.Remote {

    @WebMethod(exclude = true)
    boolean hasPermission(long userId, Resource resource);

    @WebMethod
    boolean hasPermision(@WebParam(name = "userId")long userId,
                         @WebParam(name = "resource")String resource);


}
