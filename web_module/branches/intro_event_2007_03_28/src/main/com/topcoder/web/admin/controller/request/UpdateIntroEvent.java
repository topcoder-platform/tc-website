package com.topcoder.web.admin.controller.request;

import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.dao.DAOFactory;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.IntroEvent;

/**
 * @author cucu
 */
public class UpdateIntroEvent extends ShortHibernateProcessor {

    @Override
    protected void dbProcessing() throws Exception {
/*        
        boolean hasAlgo = "1".equals(getRequest().getParameter("ha"));
        boolean hasComp = "1".equals(getRequest().getParameter("hc"));
        
        if (!hasAlgo && !hasComp) {
            throw new NavigationException("ha and/or hc parameters expected to be 1");
        }
  */    
        String name = getRequest().getParameter("name");
        String schoolId = getRequest().getParameter("sid");
        String forumId = getRequest().getParameter("fid");
        String timezoneId = getRequest().getParameter("tz");
        String imageId = getRequest().getParameter("img");

        DAOFactory factory = DAOUtil.getFactory();
        
        IntroEvent ie = new IntroEvent();
        ie.setDescription(name);
        ie.setSchool(factory.getSchoolDAO().find(new Long(schoolId)));
        ie.setForumId(new Long(forumId));
        ie.setTimezone(factory.getTimeZoneDAO().find(new Integer(timezoneId)));
        ie.setImage(factory.getImageDAO().find(new Long(imageId)));        
         
        factory.getIntroEventDAO().saveOrUpdate(ie);        
        
        setNextPage("/main.jsp");
        setIsNextPageInContext(false);
    }


}
