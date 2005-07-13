package com.topcoder.web.ejb.fileconversion;

import java.rmi.RemoteException;
import java.sql.SQLException;
import java.util.Collection;
import javax.ejb.EJBObject;

/**
 * The remote interface for the Admin Services EJB.  See the <tt>AdminServicesBean</tt>
 * class for API details.
 *
 * @author  1mahesh
 * @version 1.01, 12/30/2002
 *
 * @see AdminServicesBean
 */

public interface FileConversion extends EJBObject {

    //Convert file
    public byte[] convertDoc(byte[] file, String extension) throws RemoteException;
}

