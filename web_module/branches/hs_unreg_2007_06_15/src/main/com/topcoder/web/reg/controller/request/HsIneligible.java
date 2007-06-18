package com.topcoder.web.reg.controller.request;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.model.Notification;
import com.topcoder.web.common.model.RegistrationType;
import com.topcoder.web.common.model.User;
import com.topcoder.web.reg.Constants;
import com.topcoder.web.reg.RegFieldHelper;


/**
 * @author cucu
 */
public class HsIneligible extends Base {

    protected void registrationProcessing() throws Exception {
        log.debug("continue:" +  getRequest().getParameter("continue"));
        
        if (!"Yes".equals(getRequest().getParameter("continue"))) {
            setNextPage("www.topcoder.com/tc");
            setIsNextPageInContext(false);
            return;
        }
        
        // just for changig to post-hs instead!!
        Map params = (Map) getRequest().getSession().getAttribute("params");
        
        
        Set regTypes = getRequestedTypes();
        for (Iterator it = regTypes.iterator(); it.hasNext();) {
            RegistrationType rt = (RegistrationType) it.next();
            if (rt.getId().equals(RegistrationType.HIGH_SCHOOL_ID)) {
                it.remove();
                log.debug("removed!");
                break;
            }            
        }
        setRequestedTypes(regTypes);
        
        User u = getRegUser();
        if (u == null) {
            throw new NavigationException("Sorry, your session has expired.");
        } 
        
        Set fields = RegFieldHelper.getMainFieldSet(regTypes, u);

        Map.Entry me;
        for (Iterator it = params.entrySet().iterator(); it.hasNext();) {
            me = (Map.Entry) it.next();
            if (me.getKey().equals(Constants.NOTIFICATION)) {
                List a = (List) me.getValue();
                for (Iterator it1 = a.iterator(); it1.hasNext();) {
                    setDefault(Constants.NOTIFICATION + ((Notification) it1.next()).getId(), String.valueOf(true));
                }
            } else {
                setDefault((String) me.getKey(), me.getValue());
            }
        }

        setDefault(Constants.MEMBER_CONTACT, String.valueOf(params.get(Constants.MEMBER_CONTACT) != null));
        setDefault(Constants.AGE_FOR_HS, params.get(Constants.AGE_FOR_HS));
        setDefault(Constants.ATTENDING_HS, params.get(Constants.ATTENDING_HS));
        
        if (!u.isNew()) {
            setDefault(Constants.HANDLE, u.getHandle());
        }
        List nots = getFactory().getNotificationDAO().getNotifications(regTypes);
        if (nots != null) {
            getRequest().setAttribute("notifications", nots);
        }
        getRequest().setAttribute(Constants.FIELDS, fields);
        getRequest().setAttribute(Constants.REQUIRED_FIELDS, RegFieldHelper.getMainRequiredFieldSet(regTypes, u));
        getRequest().setAttribute("countries", getFactory().getCountryDAO().getCountries());
        getRequest().setAttribute("coderTypes", getFactory().getCoderTypeDAO().getCoderTypes());
        getRequest().setAttribute("timeZones", getFactory().getTimeZoneDAO().getTimeZones());
        getRequest().setAttribute("regTerms", getFactory().getTermsOfUse().find(new Integer(Constants.REG_TERMS_ID)));
        setNextPage("/main.jsp");
        setIsNextPageInContext(true);
        
   }
}