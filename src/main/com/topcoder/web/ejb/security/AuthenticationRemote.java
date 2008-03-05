package com.topcoder.web.ejb.security;

import javax.ejb.Remote;
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
}
