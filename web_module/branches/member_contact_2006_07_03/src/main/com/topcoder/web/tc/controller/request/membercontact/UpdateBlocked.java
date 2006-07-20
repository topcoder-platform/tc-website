package com.topcoder.web.tc.controller.request.membercontact;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.HibernateProcessor;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.dao.MemberContactBlackListDAO;
import com.topcoder.web.common.model.MemberContactBlackList;
import com.topcoder.web.common.model.User;
import com.topcoder.web.tc.Constants;

public class UpdateBlocked extends HibernateProcessor {
    
    public static String BLOCK = "b";
    public static String UNBLOCK = "ub";
    
    protected void dbProcessing() throws Exception {
        if (!userIdentified()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }

        String block[] = getRequest().getParameterValues(BLOCK);
        String unblock[] = getRequest().getParameterValues(UNBLOCK);
        
        MemberContactBlackListDAO memberContactDAO = DAOUtil.getFactory().getMemberContactBlackListDAO();
        
        User user  = DAOUtil.getFactory().getUserDAO().find(new Long(getUser().getId()));

        if (block != null) {
			for (int i = 0; i < block.length; i++) {
				User blockedUser = DAOUtil.getFactory().getUserDAO().find(Long.parseLong(block[i]));
				MemberContactBlackList m = memberContactDAO.findOrCreate(user, blockedUser);
				m.setBlocked(true);
				memberContactDAO.saveOrUpdate(m);
			}
        }
        
        if (unblock != null) {
			for (int i = 0; i < unblock.length; i++) {
				User blockedUser = DAOUtil.getFactory().getUserDAO().find(Long.parseLong(unblock[i]));
				MemberContactBlackList m = memberContactDAO.findOrCreate(user, blockedUser);
				m.setBlocked(false);
				memberContactDAO.saveOrUpdate(m);
			}
        }

        markForCommit();
               
        setNextPage(Constants.BLACK_LIST);
        setIsNextPageInContext(true);        
    }

}
