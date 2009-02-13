package com.topcoder.web.ejb.forumpoll;

import javax.ejb.CreateException;
import javax.ejb.EJBHome;
import java.rmi.RemoteException;

/**
 *
 * This class creates an instance of ForumPoll ejb.
 *
 */

public interface ForumPollHome extends EJBHome {

    /**
     *
     * This method returns a ForumPoll ejb.
     *
     */

    ForumPoll create() throws CreateException, RemoteException;
}
