package com.topcoder.web.oracle.controller.request;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.User;
import com.topcoder.web.oracle.Constants;
import com.topcoder.web.oracle.dao.CandidateDAO;
import com.topcoder.web.oracle.dao.OracleDAOUtil;
import com.topcoder.web.oracle.dao.PredictionDAO;
import com.topcoder.web.oracle.dao.OracleDAOFactory;
import com.topcoder.web.oracle.model.Candidate;
import com.topcoder.web.oracle.model.Prediction;
import com.topcoder.web.oracle.model.Room;
import com.topcoder.web.oracle.model.RoomResult;

import java.util.ArrayList;
import java.util.StringTokenizer;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 27, 2007
 */
public class SubmitBallot extends ViewBallot {
    protected void ballotProcessing(Room room) throws Exception {
        String candidateIds = StringUtils.checkNull(getRequest().getParameter(Constants.CANDIDATE_IDS));

        if ("".equals(candidateIds)) {
            loadData(room);
            addError(Constants.CANDIDATE_IDS, "Please be sure to make your selections before you submit.");
            setNextPage("/ballot.jsp");
            setIsNextPageInContext(true);
        } else {
            if (log.isDebugEnabled()) {
                log.debug("candidate ids: " + candidateIds);
            }

            OracleDAOFactory f = OracleDAOUtil.getFactory();
            ArrayList<Prediction> predictions = new ArrayList<Prediction>();
            CandidateDAO candidateDAO = f.getCandidateDAO();
            User user = DAOUtil.getFactory().getUserDAO().find(getUser().getId());
            String id;
            Candidate c;
            Prediction p;
            int i = 0;
            for (StringTokenizer st = new StringTokenizer(candidateIds, ","); st.hasMoreTokens();) {
                id = st.nextToken();
                try {
                    c = candidateDAO.find(new Integer(id));
                    if (c == null) {
                        throw new NavigationException("Invalid candidate specified.");
                    } else {
                        p = new Prediction();
                        p.setUser(user);
                        p.setCandidate(c);
                        p.setRoom(room);
                        p.setValue(++i);
                        predictions.add(p);
                    }
                } catch (NumberFormatException e) {
                    throw new NavigationException("Invalid candidate specified.");
                }

            }

            if (predictions.isEmpty()) {
                loadData(room);
                addError(Constants.CANDIDATE_IDS, "Please be sure to make your selections before you submit.");
                setNextPage("/ballot.jsp");
                setIsNextPageInContext(true);
            } else {
                RoomResult rr = f.getRoomResultDAO().find(room, user);
                rr.setAttended(true);
                PredictionDAO pDao = OracleDAOUtil.getFactory().getPredictionDAO();
                for (Prediction prediction : predictions) {
                    pDao.saveOrUpdate(prediction);
                    if (log.isDebugEnabled()) {
                        log.debug("new prediction " + prediction.getCandidate().getName() + " " + prediction.getValue());
                    }
                }

                StringBuffer buf = new StringBuffer(50);
                buf.append(getSessionInfo().getServletPath());
                buf.append("?" + Constants.MODULE_KEY + "=Static&");
                buf.append(Constants.STATIC_PREFIX).append("1=success");
                setNextPage(buf.toString());
                setIsNextPageInContext(false);

            }


        }


    }

}
