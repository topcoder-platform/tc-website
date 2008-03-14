package com.topcoder.web.ejb.security;

import com.topcoder.shared.security.Resource;

import javax.ejb.Remote;
import javax.jws.WebMethod;
import javax.jws.WebService;

/**
 * @author dok
 * @version $Id$
 *          Create Date: Feb 28, 2008
 */
@Remote
@WebService
public interface AuthorizationRemote extends Authorization {

    @WebMethod(exclude = true)
    boolean hasPermission(long userId, Resource resource);

    @WebMethod
    boolean hasPermision(long userId, String resource);


}
