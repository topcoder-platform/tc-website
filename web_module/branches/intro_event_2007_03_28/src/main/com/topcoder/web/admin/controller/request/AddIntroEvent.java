package com.topcoder.web.admin.controller.request;

import java.util.Date;
import java.util.List;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.dao.DAOFactory;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.Image;

/**
 * @author cucu
 */
public class AddIntroEvent extends ShortHibernateProcessor {

    @Override
    protected void dbProcessing() throws Exception {
        
        boolean hasAlgo = "1".equals(getRequest().getParameter("ha"));
        boolean hasComp = "1".equals(getRequest().getParameter("hc"));
        
        if (!hasAlgo && !hasComp) {
            throw new NavigationException("ha and/or hc parameters expected to be 1");
        }
        
        DAOFactory factory = DAOUtil.getFactory(); 
        
        List tz = factory.getTimeZoneDAO().getTimeZones();
        getRequest().setAttribute("timezones", tz);
        
        List img = factory.getImageDAO().getImages(Image.INTRO_EVENT_TYPE);
        getRequest().setAttribute("images", img);
        
        List cfg = factory.getIntroEventPropertyTypeDAO().getTypes();
        getRequest().setAttribute("config", cfg);
        
        if (hasAlgo) {
            List rounds = factory.getRoundDAO().getRoundsAfter(new Date());            
            getRequest().setAttribute("rounds", rounds);
        }
            
            
        getRequest().setAttribute("hasAlgo", hasAlgo);
        getRequest().setAttribute("hasComp", hasComp);
        
        setNextPage("/editIntroEvent.jsp");
        setIsNextPageInContext(true);
    }


}
