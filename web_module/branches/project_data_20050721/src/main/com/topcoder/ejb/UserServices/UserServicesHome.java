package com.topcoder.ejb.UserServices;

import com.topcoder.common.web.data.User;

import javax.ejb.CreateException;
import javax.ejb.EJBHome;
import javax.ejb.FinderException;
import java.rmi.RemoteException;


public interface UserServicesHome extends EJBHome {

    /**
     *  The create method creates the EJB Object.
     *  @return  The newly created EJB Object.
     */
    UserServices create(User user) throws CreateException, RemoteException;

    /**
     *  Finds an applicant by their primary Key (User userId)
     */
    public UserServices findByPrimaryKey(Integer userId) throws FinderException, RemoteException;

}
