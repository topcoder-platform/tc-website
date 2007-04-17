package com.topcoder.web.admin.controller.request;

import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.dao.DAOFactory;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.Image;
import com.topcoder.web.common.model.IntroEvent;
import com.topcoder.web.common.model.School;
import com.topcoder.web.common.model.TimeZone;

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
        
        School school = new School();
        school.setId(new Long(schoolId));
        
        TimeZone timeZone = new TimeZone(new Integer(timezoneId));
        
        Image image = new Image();
        image.setId(new Long(imageId));
        
        IntroEvent ie = new IntroEvent();
        ie.setDescription(name);
        ie.setSchool(school); // todo can be blank
        ie.setForumId(new Long(forumId));
        ie.setTimezone(timeZone);
        ie.setImage(image);        
         
        factory.getIntroEventDAO().saveOrUpdate(ie);        
        
        setNextPage("/main.jsp");
        setIsNextPageInContext(false);
    }


}
