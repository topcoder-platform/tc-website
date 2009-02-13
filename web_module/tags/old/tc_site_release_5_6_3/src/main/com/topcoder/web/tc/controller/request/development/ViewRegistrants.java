package com.topcoder.web.tc.controller.request.development;

import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;
import com.topcoder.shared.dataAccess.Request;

/**
 * Added some code to permit other projects different from component competitions.
 * 
 * @author dok, pulky
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 4, 2006
 */
public class ViewRegistrants extends Base {
    protected void developmentProcessing() throws TCWebException {
        try {
            String projectId = StringUtils.checkNull(getRequest().getParameter(Constants.PROJECT_ID));
            
            if (projectId == "") {
                throw new TCWebException("parameter " + Constants.PROJECT_ID + " expected.");
            }
            
            int projectTypeId = getProjectTypeId(Long.parseLong(projectId)); 
            
            if (projectTypeId == -1) {
                throw new TCWebException("Could not find project information.");
            }

            getRequest().setAttribute(Constants.PROJECT_TYPE_ID, new Integer(projectTypeId));

            Request r = new Request();
            r.setContentHandle(getRegistrantsCommandName(projectTypeId));
            r.setProperty(Constants.PROJECT_ID, String.valueOf(projectId));
            getRequest().setAttribute("resultMap", getDataAccess().getData(r));
            setNextPage("/dev/registrants.jsp");
            setIsNextPageInContext(true);
        } catch (TCWebException e) {
            throw e;
          } catch (NumberFormatException nfe) {
            throw new TCWebException("Wrong parameter " + Constants.PROJECT_ID + ".");            
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
}
