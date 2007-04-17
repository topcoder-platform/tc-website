package com.topcoder.web.admin.controller.request;

import java.util.List;

import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.dao.DAOFactory;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.IntroEvent;
import com.topcoder.web.common.model.IntroEventConfig;
import com.topcoder.web.common.model.IntroEventPropertyType;

/**
 * @author cucu
 */
public class UpdateIntroEvent extends ShortHibernateProcessor {

    @Override
    protected void dbProcessing() throws Exception {
        
        boolean hasAlgo = true;
        boolean hasComp = true;
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

        List<IntroEventPropertyType> cfg = factory.getIntroEventPropertyTypeDAO().getTypes();

        for (IntroEventPropertyType prop : cfg) {
            if (prop.getType().equals(IntroEventPropertyType.GENERAL_TYPE) ||
                    (prop.getType().equals(IntroEventPropertyType.ALGO_TYPE) && hasAlgo)  ||
                    (prop.getType().equals(IntroEventPropertyType.COMP_TYPE) && hasComp)) {
                
                String value = getRequest().getParameter("cfg" + prop.getId());
                IntroEventConfig iec = new IntroEventConfig();
                IntroEventConfig.Identifier id = new IntroEventConfig.Identifier();
                id.setIntroEvent(ie);
                id.setPropertyId(prop.getId().longValue());
                iec.setId(id);
                iec.setValue(value);
                
            }
        }
        
        
        factory.getIntroEventDAO().saveOrUpdate(ie);        
        
        setNextPage("/main.jsp");
        setIsNextPageInContext(false);
    }


}
