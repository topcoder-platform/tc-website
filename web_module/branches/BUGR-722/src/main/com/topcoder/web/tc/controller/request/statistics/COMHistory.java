package com.topcoder.web.tc.controller.request.statistics;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.tc.Constants;

import java.util.Arrays;

/**
 * @author dok
 * @version $Revision: 44042 $ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 4, 2006
 */
public class COMHistory extends com.topcoder.web.tc.controller.request.Base {

    private static final int[] TYPES = {Constants.ACHIEVEMENT_TYPE_ALGO_COM, Constants.ACHIEVEMENT_TYPE_COM,
            Constants.ACHIEVEMENT_TYPE_DESIGN_COM, Constants.ACHIEVEMENT_TYPE_DEV_COM};
    static {
        Arrays.sort(TYPES);
    }

    protected void businessProcessing() throws Exception {
        Request r = new Request();
        r.setContentHandle("com_history");
        int type;
        try {
            type = Integer.parseInt(getRequest().getParameter(Constants.ACHIEVEMENT_TYPE_ID));
            if (Arrays.binarySearch(TYPES, type)<0) {
                throw new NavigationException("Invalid achievement type specified");
            }
        } catch (NumberFormatException e) {
            throw new NavigationException("Invalid achievement type specified");
        }
        r.setProperty(Constants.ACHIEVEMENT_TYPE_ID, String.valueOf(type));

        getRequest().setAttribute("resultMap", getDataAccess(DBMS.DW_DATASOURCE_NAME, true).getData(r));
        getRequest().setAttribute(Constants.ACHIEVEMENT_TYPE_ID, String.valueOf(type));

        setNextPage("/statistics/coderOfMonth.jsp");
        setIsNextPageInContext(true);


    }

}
