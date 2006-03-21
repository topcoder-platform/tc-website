package com.topcoder.web.onsite.controller.request;

import com.topcoder.common.web.data.Navigation;
import com.topcoder.security.TCSubject;
import com.topcoder.security.login.LoginRemote;
import com.topcoder.shared.security.LoginException;
import com.topcoder.shared.security.SimpleUser;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.*;
import com.topcoder.web.common.security.BasicAuthentication;
import com.topcoder.web.ejb.user.User;
import com.topcoder.web.onsite.Constants;
import com.topcoder.web.onsite.controller.request.Base;
import com.topcoder.web.common.model.CoderSessionInfo;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.PermissionException;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.ejb.project.ProjectWagerLocal;
import com.topcoder.web.ejb.project.ProjectWager;
import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.resultSet.TCResultItem;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;


import java.util.Map;
import java.util.Arrays;

public class SubmitWager extends Base {

    private static final Logger log = Logger.getLogger(SubmitWager.class);

    private void addWager(long projectId, long userId, int wagerAmount) throws Exception {
        ProjectWagerLocal projectWagerLocal = (ProjectWagerLocal) createLocalEJB(getInitialContext(), ProjectWager.class); 
        projectWagerLocal.createProjectWager(projectId, userId, wagerAmount, DBMS.TCS_OLTP_DATASOURCE_NAME);
    }
    
    private Map getValidationData(long userId) throws Exception {
        Request request = new Request();
        request.setContentHandle(Constants.WAGER_SUBMITION_VALIDATION_COMMAND);
        request.setProperty(Constants.USER_ID, String.valueOf(userId));
        DataAccessInt dai = new DataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME);
        Map m = dai.getData(request);

        return m;
    }

    protected void businessProcessing() throws Exception {
        if (getUser().isAnonymous()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }

        setNextPage(Constants.WAGER_RESULT_PAGE);
        setIsNextPageInContext(true);
        
        long projectId;
        try {
            projectId = Long.parseLong(getRequest().getParameter(Constants.PROJECT_ID_KEY));
        } catch (NumberFormatException nfe) {
            log.debug("This should never happen. (cannot parse project ID: " + 
                getRequest().getParameter(Constants.PROJECT_ID_KEY) + ")");
            throw(new TCWebException(nfe));
        }
        
        int wagerAmount;
        try {
            wagerAmount = Integer.parseInt(getRequest().getParameter(Constants.WAGER_AMOUNT));
        } catch (NumberFormatException nfe) {
            getRequest().setAttribute(BaseServlet.MESSAGE_KEY, Constants.INVALID_WAGER_FORMAT_MESSAGE);
            return;
        }
        
        if (wagerAmount < Constants.MIN_WAGER_AMOUNT) {
            getRequest().setAttribute(BaseServlet.MESSAGE_KEY, 
                Constants.MIN_WAGER_AMOUNT_MESSAGE + " " + Constants.MIN_WAGER_AMOUNT + ".");
            return;
        }        

        Map m = getValidationData(getUser().getId());
        // extra validations:
        ResultSetContainer comp = (ResultSetContainer) m.get(
            Constants.ACTUAL_TCO_CONTESTS_QUERY);
        int remainingCompetitions = ((ResultSetContainer) m.get(
            Constants.REMAINING_TCO_CONTESTS_QUERY)).getIntItem(0, "remaining_contests");

        Object usedPoints = ((ResultSetContainer) m.get(
            Constants.USED_WAGER_POINTS_QUERY)).getItem(0, "used_points").getResultData();
        
        int remainingPoints = Constants.TOTAL_WAGER_POINTS;
        if (usedPoints != null) {
            remainingPoints = remainingPoints - ((Integer) usedPoints).intValue();
        }
 
        int maxWagerAmount = remainingPoints - ((remainingCompetitions - 1) * Constants.MIN_WAGER_AMOUNT);
        maxWagerAmount = maxWagerAmount < Constants.MAX_WAGER_AMOUNT ? maxWagerAmount : Constants.MAX_WAGER_AMOUNT;
        if (wagerAmount > maxWagerAmount) {
            getRequest().setAttribute(BaseServlet.MESSAGE_KEY, 
                Constants.MAX_WAGER_AMOUNT_MESSAGE + " " + maxWagerAmount + ".");
            return;
        }

        if (projectId != comp.getLongItem(0, Constants.PROJECT_ID_KEY)) {
            getRequest().setAttribute(BaseServlet.MESSAGE_KEY, 
                Constants.INVALID_PROJECT_MESSAGE);
            return;
        }

        try {
            addWager(projectId, getUser().getId(), wagerAmount);
        } catch (Exception e) {
            throw(new TCWebException(e));
        }

        getRequest().setAttribute(BaseServlet.MESSAGE_KEY, 
            Constants.SUCCESSFULL_WAGER_MESSAGE);
    }
}
