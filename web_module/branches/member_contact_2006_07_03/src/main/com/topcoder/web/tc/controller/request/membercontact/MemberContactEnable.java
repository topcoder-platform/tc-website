package com.topcoder.web.tc.controller.request.membercontact;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.HibernateProcessor;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.Preference;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.model.UserPreference;
import com.topcoder.web.tc.Constants;

public class MemberContactEnable extends HibernateProcessor {
    
    public static String ENABLE = "enable";
    
    protected void dbProcessing() throws Exception {
        if (!userIdentified()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }

        boolean enable = getRequest().getParameter(ENABLE) != null;

        
        if (enable) {
        	Long userId = new Long(getUser().getId()); 
            UserPreference up = DAOUtil.getFactory().getUserPreferenceDAO()
            		.find(userId, Preference.MEMBER_CONTACT_PREFERENCE_ID);
            
            if (up == null) {
        		up = new UserPreference();
        		Preference p = DAOUtil.getFactory().getPreferenceDAO().find(Preference.MEMBER_CONTACT_PREFERENCE_ID);
        		User user  = DAOUtil.getFactory().getUserDAO().find(userId);
        		up.setId(new UserPreference.Identifier(user, p));
        	}            
            
      		up.setValue(String.valueOf(true));
      		
            markForCommit();
            
            setNextPage(Constants.MEMBER_CONTACT_ENABLE_SUCCEEDED);
            setIsNextPageInContext(true);                    
        } else {
            setNextPage(Constants.MEMBER_CONTACT_ENABLE);
            setIsNextPageInContext(true);                    
        }
        
    }


}
