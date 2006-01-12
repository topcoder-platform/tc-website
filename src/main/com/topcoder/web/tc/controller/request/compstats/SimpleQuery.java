
package com.topcoder.web.tc.controller.request.compstats;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;
import java.util.Iterator;
import java.util.Map;

/**
 *
 * @author coachbudka
 */
public class SimpleQuery extends Base {
    private static final String COMMAND = "command";
    private static final String QUERY = "query";
    private static final String JSP = "jsp";
    
    protected void businessProcessing() throws TCWebException {
        try {
            String command = StringUtils.checkNull(getRequest().getParameter(COMMAND));
            String query = StringUtils.checkNull(getRequest().getParameter(QUERY));
            String jsp = StringUtils.checkNull(getRequest().getParameter(JSP));
            
            if (command == null) throw new TCWebException("No \"" + COMMAND + "\" parameter supplied");
            if (query == null) query = command;
            if (jsp == null) throw new TCWebException("No \"" + JSP + "\" parameter supplied");
            
			ResultSetContainer rsc = queryDB(command, query);
			getRequest().setAttribute("result", rsc);
            setNextPage("/compstats/" + jsp + ".jsp");
            setIsNextPageInContext(true);

        } catch (TCWebException we) {
            throw we;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

}
