package com.topcoder.web.tc.controller.request.membercontact;

import com.topcoder.web.common.HibernateProcessor;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.User;
import com.topcoder.web.tc.Constants;

public class BlockHandle extends HibernateProcessor {
       
	public static final String HANDLE = "handle"; 
	public static final String ID = "id";
	
    protected void dbProcessing() throws Exception {
        String handle = getRequest().getParameter(HANDLE);
    	User blockUser  = DAOUtil.getFactory().getUserDAO().find(handle, true, true);
    	
    	getRequest().setAttribute(HANDLE, blockUser.getHandle());
    	
    	if (blockUser != null) {    		
    		getRequest().setAttribute(ID, blockUser.getId());
    	}
    	              
    	log.debug("forward to:"  + Constants.BLOCK_HANDLE);
        setNextPage(Constants.BLOCK_HANDLE);
        setIsNextPageInContext(true);        
    }

}
