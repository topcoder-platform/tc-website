/*
 * DOCConversion.java
 *
 * Created on December 6, 2004, 2:07 PM
 */

package com.topcoder.web.tc.controller.request.profile;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.model.PlacementConfigInfo;

import com.topcoder.web.ejb.user.User;

import com.topcoder.shared.dataAccess.*;
import com.topcoder.shared.dataAccess.resultSet.*;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.TCContext;

import java.lang.StringBuffer;

import javax.naming.Context;
import javax.naming.InitialContext;
import java.util.ArrayList;
import java.util.Map;
/**
 *
 * @author rfairfax
 */
public class ProfileConfig extends BaseProcessor { 

    protected void businessProcessing() throws TCWebException {
        try {
           //lookup user id
            int uid = Integer.parseInt(StringUtils.checkNull(getRequest().getParameter("uid")));

            PlacementConfigInfo info = new PlacementConfigInfo();
            
            info.setUserID(uid);
            
            InitialContext ctx = TCContext.getInitial();
            User userbean = (User)createEJB(ctx, User.class);
            
            info.setHandle(userbean.getHandle(uid, DBMS.COMMON_OLTP_DATASOURCE_NAME));
            info.setName(userbean.getFirstName(uid, DBMS.COMMON_OLTP_DATASOURCE_NAME) + " " + userbean.getLastName(uid, DBMS.COMMON_OLTP_DATASOURCE_NAME));
            
            getRequest().setAttribute("info", info);

            setNextPage(Constants.PROFILE_CONFIG_PAGE); 
            setIsNextPageInContext(true);
        } catch (Exception e) {
            throw new TCWebException(e);
        }
        
    }
    
    protected static DataAccessInt getDWDataAccess() throws Exception { 
       DataAccessInt dAccess = null;
       dAccess = new DataAccess(DBMS.DW_DATASOURCE_NAME);
       return dAccess;
    }
}
