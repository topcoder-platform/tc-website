package com.topcoder.web.corp.controller.request.screening;

import com.topcoder.security.UserPrincipal;

import com.topcoder.web.common.security.PrincipalMgr;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.corp.common.Constants;
import com.topcoder.web.corp.common.PermissionDeniedException;
import com.topcoder.web.corp.common.Util;
import com.topcoder.web.corp.model.CandidateInfo;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpUtils;
import java.util.Map;

/**
 * <p>
 * This preprocesses the CandidateSetup page so that if an existing candidate
 * is being edited, the information for that candidate will be loaded.
 * </p>
 *
 * <p>
 * Checks the request for an existing <code>CandidateInfo</code>
 * object.  If it does not exist, checks to see if there is a candidate
 * id in the parameter list of the request.  If so, then it lookups
 * up the CandidateInfo for that id.
 * </p>
 *
 * @author Dan Tomalesky (grim@xynesis.com)
 * @version 1.0
 */
public class PopulateCandidate extends BaseProcessor {
    protected void businessProcessing() throws TCWebException {
        ServletRequest request = getRequest();
        String uId = request.getParameter(Constants.CANDIDATE_ID);
        if (request.getAttribute(Constants.CANDIDATE_INFO) == null) {
            CandidateInfo info = new CandidateInfo();
            if (uId != null) {
                info.setIsNew(false);
                long userId = Long.parseLong(uId);

                //do some kind of db lookup
                PrincipalMgr principalMgr = new PrincipalMgr();

                //will throw exception or return null?
                info.setUserId(new Long(userId));

                UserPrincipal user = principalMgr.getUser(userId);
                if (user != null) {
                    info.setUserName(user.getName());
                    info.setPassword(principalMgr.getPassword(userId));
                }

                try {
                    DataAccessInt dAccess = Util.getDataAccess();

                    Request dr = new Request();
                    dr.setProperties(HttpUtils.parseQueryString(getRequest().getQueryString()));
                    dr.setContentHandle("noteList");
                    dr.setProperty("uid", String.valueOf(getUser().getId()));

                    Map map = dAccess.getData(dr);

                    if (map != null) {
                        ResultSetContainer result = (ResultSetContainer) map.get("candidateInfo");
                        if (result.getRowCount() == 0) {
                            throw new PermissionDeniedException(getAuthentication().getActiveUser(),
                                    "User not authorized to view information about candidate: " +
                                    dr.getProperty("cid") == null ? "?" : dr.getProperty("cid"));
                        }
                        result = (ResultSetContainer) map.get("noteList");
                        info.setNoteList(result);
                    }
                } catch (TCWebException e) {
                    throw e;
                } catch (Exception e) {
                    throw(new TCWebException(e));
                }
            }

            //set this so we don't lose the value
            info.setReferrer(request.getParameter(Constants.REFERRER));

            request.setAttribute(Constants.CANDIDATE_INFO, info);
        }

        setNextPage(Constants.CANDIDATE_SETUP_PAGE);
        setIsNextPageInContext(true);
    }
}
