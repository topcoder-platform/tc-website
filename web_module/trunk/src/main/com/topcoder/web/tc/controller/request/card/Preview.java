package com.topcoder.web.tc.controller.request.card;

import com.topcoder.web.tc.controller.request.Base;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.NavigationException;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;


/**
 * @author dok
 * Date: Mar 10, 2004
 */
public class Preview extends Base {

    protected void businessProcessing() throws TCWebException {

        if (userIdentified()) {
            try {
                if (isRated()) {
                    setNextPage(Constants.CARD_PREVIEW);
                    setIsNextPageInContext(true);
                } else {
                    throw new NavigationException("Sorry you have not been rated in competition.");
                }
            } catch (TCWebException e) {
                throw e;
            } catch (Exception e) {
                throw new TCWebException(e);
            }
        } else {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }
    }

    protected boolean isRated() throws Exception {
        Request r = new Request();
        r.setContentHandle("member_profile");
        r.setProperty("cr", String.valueOf(getUser().getId()));
        ResultSetContainer coderInfo =
                (ResultSetContainer)getDataAccess(DBMS.DW_DATASOURCE_NAME, true).getData(r).get("Coder_Data");
        //if they've been rated in one of the competitions
        boolean rated = false;
        if (coderInfo.getIntItem(0, "rating")>0 ||
                (coderInfo.getItem(0, "design_rating").getResultData()!=null&&coderInfo.getIntItem(0, "design_rating")>0) ||
                (coderInfo.getItem(0, "development_rating").getResultData()!=null&&coderInfo.getIntItem(0, "development_rating")>0)) {
            rated = true;
        }
        return rated;

    }

}
