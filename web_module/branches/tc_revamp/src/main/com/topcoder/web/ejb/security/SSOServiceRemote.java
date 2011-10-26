package com.topcoder.web.ejb.security;

import javax.ejb.Remote;

/**
 * @author Diego Belfer (Mural)
 * @version $Id: SSOServiceRemote.java 74078 2008-12-22 18:06:25Z dbelfer $
 */
@Remote
public interface SSOServiceRemote extends SSOService, java.rmi.Remote {

}
