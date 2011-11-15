package com.topcoder.web.common.dao;

import java.util.List;

import com.topcoder.web.common.model.User;


/**
 * <p>
 *  Update (Release Assembly - OpenID Project Update 1 v1.0):
 *  Add <code>public getUserByOpenId(String openId)</code> method.
 * </p>
 * 
 * @author dok, TCSASSEMBLER
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 11, 2006
 *          updated date: Sept 26th, 2011
 */
public interface UserDAO {
    User find(Long id);

    User find(String userName, boolean ignoreCase);

    User find(String userName, boolean ignoreCase, boolean activeRequired);

    List find(String handle, String firstName, String lastName, String email);
    
    void saveOrUpdate(User u);

    /**
     * <p>
     * This method contracts implementation should provide access to get user by
     * open id.
     * </p>
     * 
     * @param openId
     *            the open id for the user, not null.
     * @throws IllegalArgumentException
     *             throw IllegalArgumentException if the openId is null or empty.
     * @return Return the corresponding user, or null if there is no match.
     */
    User getUserByOpenId(String openId) throws IllegalArgumentException;
}
