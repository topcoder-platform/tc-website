package com.topcoder.web.tc.controller.request.card;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.SecurityHelper;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.ejb.user.UserPreference;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.Base;


/**
 * @author dok
 *         Date: Mar 10, 2004
 */
public class Preview extends Base {

    protected void businessProcessing() throws TCWebException {

        if (SecurityHelper.hasPermission(getLoggedInUser(), new ClassResource(this.getClass()))) {
            try {
                if (isRated()) {
                    getRequest().setAttribute("cardUnlocked", new Boolean(isUnlocked()));
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
            throw new PermissionException(getLoggedInUser(), new ClassResource(this.getClass()));
        }
    }

    protected boolean isRated() throws Exception {
        Request r = new Request();
        r.setContentHandle("member_profile");
        r.setProperty("cr", String.valueOf(getUser().getId()));
        ResultSetContainer coderInfo =
                (ResultSetContainer) getDataAccess(DBMS.DW_DATASOURCE_NAME, true).getData(r).get("Coder_Data");
        //if they've been rated in one of the competitions
        boolean rated = false;
        if (!coderInfo.isEmpty() && ((coderInfo.getItem(0, "rating").getResultData() != null && coderInfo.getIntItem(0, "rating") > 0) ||
                (coderInfo.getItem(0, "design_rating").getResultData() != null && coderInfo.getIntItem(0, "design_rating") > 0) ||
                (coderInfo.getItem(0, "development_rating").getResultData() != null && coderInfo.getIntItem(0, "development_rating") > 0))) {
            rated = true;
        }
        return rated;

    }

    protected boolean isUnlocked() throws Exception {
        UserPreference up = (UserPreference) createEJB(getInitialContext(), UserPreference.class);
        boolean cardUnlocked;
        try {
            up.getValue(getUser().getId(), Constants.UNLOCK_CARD_PREFERENCE_ID, DBMS.COMMON_OLTP_DATASOURCE_NAME);
            cardUnlocked = true;
/*
todo can't friggin figure out why this does't work in prod.  it should catch RowNotFoundException dammit!
        } catch (RowNotFoundException e) {
*/
        } catch (Exception e) {
            cardUnlocked = false;
        }
        return cardUnlocked;

    }


}
