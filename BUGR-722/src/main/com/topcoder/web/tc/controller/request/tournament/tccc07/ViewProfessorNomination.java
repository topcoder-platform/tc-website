package com.topcoder.web.tc.controller.request.tournament.tccc07;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.Event;
import com.topcoder.web.common.model.EventType;
import com.topcoder.web.tc.Constants;

/**
 * @author dok
 * @version $Revision: 63542 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 30, 2007
 */
public class ViewProfessorNomination extends ShortHibernateProcessor {

    protected void dbProcessing() throws Exception {
        if (userIdentified()) {
            String eventId = getRequest().getParameter(Constants.EVENT_ID);
            if ("".equals(StringUtils.checkNull(eventId))) {
                throw new NavigationException("Invalid event specified");
            } else {
                Event e = DAOUtil.getFactory().getEventDAO().find(new Long(eventId));

                if (e == null) {
                    throw new NavigationException("Invalid event specified");
                } else {
                    if (EventType.PROFESSOR_NOMINATION_ID.equals(e.getType().getId())) {
                        profProcessing(e);
                    } else {
                        throw new NavigationException("Invalid event specified");
                    }
                }
            }
        } else {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }

    }


    protected void profProcessing(Event e) throws Exception {
        getRequest().setAttribute("event", e);
        setNextPage("/tournaments/tccc07/professor/nominationForm.jsp");
        setIsNextPageInContext(true);

    }

}
