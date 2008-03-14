package com.topcoder.web.ejb.security;

import javax.ejb.Remote;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebResult;
import javax.jws.WebService;
import javax.jws.soap.SOAPBinding;

/**
 * @author dok
 * @version $Id$
 *          Create Date: Feb 21, 2008
 */
@Remote
@WebService
@SOAPBinding(style = SOAPBinding.Style.RPC)
public interface AuthenticationRemote extends Authentication {
    @WebMethod

    @WebResult(name = "AuthenticatedUser")
    AuthenticatedUser login(@WebParam(name = "userName")String userName,
                            @WebParam(name = "password")String password) throws InvalidCredentialsException,
            InactiveEmailStatusException, UnactiveUserStatusException, InactiveUserStatusException;


}
