package com.topcoder.web.common.security;

import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.topcoder.security.TCSubject;
import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.Authorization;
import com.topcoder.shared.security.Resource;
import com.topcoder.shared.security.SimpleResource;
import com.topcoder.web.corp.Constants;
import com.topcoder.web.corp.Util;

/**
 * This will be using the TopCoder Software security component to determine if a
 * particular user has access to a particular resource.  This can be done using
 * com.topcoder.security.policy and passing it the TCSubject associated with
 * this object and a TCPermission object that can be created using the Resource
 * object passed in to the hasPermission() method.
 * 
 * @author Greg Paul
 * @author djFD molc@mail.ru
 * @version 1.02
 *
 */
public class TCESAuthorization implements Authorization {
    private HashSet permissions;

    /**
     * Creates Authorization token for given user.
     * 
     * @param user
     */    
    public TCESAuthorization(TCSubject user) 
    throws NamingException, Exception
    {
        permissions = new HashSet();
        
        InitialContext ic = null;
        try {
            ic = new InitialContext( Constants.NDS_CONTEXT_ENVIRONMENT );
            Request cmd = new Request();
            cmd.setContentHandle("cmd-TCSubject-permissions");
            cmd.setProperty("uid", Long.toString(user.getUserId()) );
            DataAccessInt da = new DataAccess(
                (DataSource)ic.lookup(Constants.NDS_DATA_SOURCE)
            );
            Map resultMap = da.getData(cmd);
            ResultSetContainer permSet = (ResultSetContainer)
                resultMap.get("qry-permissions-for-user");

            Iterator permIter = permSet.iterator();
            while( permIter.hasNext() ) {
                ResultSetContainer.ResultSetRow row;
                row = (ResultSetContainer.ResultSetRow)permIter.next();
                permissions.add(row.getItem("permission").toString());
            }
        }
        catch( NamingException ne ) {
            ne.printStackTrace();
            throw ne;
        }
        catch(Exception e) {
            e.printStackTrace();
            throw e;
        }
        finally {
            Util.closeIC(ic);
        }
    }
    
    /**
     * There will be TCESAuthorization token for every user, so this method will
     * return true if user to which this Authorization belongs to, has
     * permission to given resource.
     * 
     * @see com.topcoder.shared.security.Authorization#hasPermission(com.topcoder.shared.security.Resource)
     */
    public boolean hasPermission(Resource r) {
        return permissions.contains(r.getName());
    }
    
    /**
     * Returns Iterator of the all accessible resources. Objects received from
     * the next() metod of iterator implement Resource interface
     * 
     * @return Iterator
     */
    public Iterator allPermissions() {
        return new rc_iter(permissions.iterator());
    }
    
    private static class rc_iter implements Iterator {
        private Iterator iter; 
        private rc_iter(Iterator i) {
            iter = i;
        }
        
        /**
         * @see java.util.Iterator#hasNext()
         */
        public boolean hasNext() {
            return iter.hasNext();
        }

        /**
         * @see java.util.Iterator#next()
         */
        public Object next() {
            return new SimpleResource((String)iter.next());
        }

        /**
         * @see java.util.Iterator#remove()
         */
        public void remove() {
            iter.remove();
        }

    }
}
