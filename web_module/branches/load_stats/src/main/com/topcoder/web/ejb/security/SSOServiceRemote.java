package com.topcoder.web.ejb.security;

import javax.ejb.Remote;

/**
 * @author Diego Belfer (Mural)
 * @version $Id$
 */
@Remote
public interface SSOServiceRemote extends SSOService, java.rmi.Remote {

}
