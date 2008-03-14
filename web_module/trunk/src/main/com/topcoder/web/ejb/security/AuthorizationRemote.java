package com.topcoder.web.ejb.security;

import com.topcoder.shared.security.Resource;

import javax.ejb.Remote;
import javax.jws.WebMethod;
import javax.jws.WebService;
import javax.jws.soap.SOAPBinding;

/**
 * @author dok
 * @version $Id$
 *          Create Date: Feb 28, 2008
 * @see Authorization
 */
@Remote
@WebService(endpointInterface = "com.topcoder.web.ejb.security.AuthorizationRemote")
@SOAPBinding(style = SOAPBinding.Style.RPC)
public interface AuthorizationRemote extends Authorization {

    @WebMethod(exclude = true)
        //don't want to expose this method as part of the web service
    boolean hasPermission(long userId, Resource resource);

    @WebMethod
    boolean hasPermision(long userId, String resource);

}
