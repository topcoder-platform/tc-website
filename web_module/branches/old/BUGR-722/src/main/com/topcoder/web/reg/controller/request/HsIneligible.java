package com.topcoder.web.reg.controller.request;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.dao.RegistrationTypeDAO;
import com.topcoder.web.common.model.RegistrationType;
import com.topcoder.web.common.model.User;
import com.topcoder.web.reg.Constants;
import com.topcoder.web.reg.RegFieldHelper;

import java.util.Iterator;
import java.util.Map;
import java.util.Set;


/**
 * @author cucu
 */
public class HsIneligible extends Base {

    protected void registrationProcessing() throws Exception {
   
        if (!"Yes".equals(getRequest().getParameter("continue"))) {
            setNextPage("/tc");
            setIsNextPageInContext(false);
            return;
        }
        
       
        Map params = (Map) getRequest().getSession().getAttribute("params");        
        
        Set regTypes = getRequestedTypes();

        // Remove HS
        for (Iterator it = regTypes.iterator(); it.hasNext();) {
            RegistrationType rt = (RegistrationType) it.next();
            if (rt.getId().equals(RegistrationType.HIGH_SCHOOL_ID)) {
                it.remove();
                break;
            }            
        }
        
        // If the user didn't request competition registration, add it.
        if (!hasRequestedType(RegistrationType.COMPETITION_ID)) {
            RegistrationTypeDAO regTypeDAO = getFactory().getRegistrationTypeDAO();
             regTypes.add(regTypeDAO.getCompetitionType());            
        }
        
        setRequestedTypes(regTypes);
        
        User u = getRegUser();
        if (u == null) {
            throw new NavigationException("Sorry, your session has expired.", "http://www.topcoder.com/reg/?"+ Constants.NEW_REG+"="+String.valueOf(true));
        } 
        
        Set fields = RegFieldHelper.getMainFieldSet(regTypes, u);

        reloadMain(params, u, fields);       
   }
}