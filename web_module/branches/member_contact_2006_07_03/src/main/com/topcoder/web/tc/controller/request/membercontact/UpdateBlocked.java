package com.topcoder.web.tc.controller.request.membercontact;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.HibernateProcessor;
import com.topcoder.web.common.HibernateUtils;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.dao.MemberContactBlackListDAO;
import com.topcoder.web.common.dao.MemberContactMessageDAO;
import com.topcoder.web.common.model.MemberContactBlackList;
import com.topcoder.web.common.model.User;
import com.topcoder.web.tc.Constants;

/**
 * 
 * @author cucu
 *
 */
public class UpdateBlocked extends HibernateProcessor {
    
    public static String BLOCK = "b";
    public static String UNBLOCK = "ub";

    protected void dbProcessing() throws Exception {
    	// The user must be logged to access this page.
        if (!userIdentified()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }
        
        SessionInfo info = (SessionInfo) getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY);        
        String nextPage = info.getServletPath() + "?" + Constants.MODULE_KEY + "=BlackList&" + BlackList.SAVED + "=true";
        
        //  The user must be a rated member to access this page.
		if (!Helper.isRated(getUser().getId())) {
			getRequest().setAttribute(Helper.NOT_RATED, String.valueOf(false));
	        setNextPage(nextPage);
	        setIsNextPageInContext(false);
	        return;
		}

        User user = DAOUtil.getFactory().getUserDAO().find(new Long(getUser().getId()));

        String block[] = getRequest().getParameterValues(BLOCK);
        String unblock[] = getRequest().getParameterValues(UNBLOCK);

        if (block == null && unblock == null) {
        	return;
        }
        MemberContactBlackListDAO memberContactDAO = DAOUtil.getFactory().getMemberContactBlackListDAO();
        
        // Block users
        if (block != null) {
			for (int i = 0; i < block.length; i++) { 
				User blockedUser = DAOUtil.getFactory().getUserDAO().find(new Long(block[i]));
				MemberContactBlackList m = memberContactDAO.findOrCreate(user, blockedUser);
				m.setBlocked(true);
				memberContactDAO.saveOrUpdate(m);
			}
        }
        
        // Unblock users
        if (unblock != null) {
			for (int i = 0; i < unblock.length; i++) {
				User blockedUser = DAOUtil.getFactory().getUserDAO().find(new Long(unblock[i]));
				MemberContactBlackList m = memberContactDAO.findOrCreate(user, blockedUser);
				m.setBlocked(false);
				memberContactDAO.saveOrUpdate(m);
			}
        }
        
        // attribute used to display a message confirming that data was saved.
        getRequest().setAttribute(BlackList.SAVED, String.valueOf(true));

        markForCommit();
        
        HibernateUtils.getSession().flush();
        
        setNextPage(nextPage);
        setIsNextPageInContext(false);
        
    }


}
