package com.topcoder.web.tces.bean;

import com.topcoder.shared.util.*;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.tces.common.TCESConstants;
import com.topcoder.web.tces.ejb.TCESServices.TCESServicesHome;
import com.topcoder.web.tces.ejb.TCESServices.TCESServices;
import com.topcoder.common.web.data.Navigation;

import javax.servlet.http.*;
import javax.naming.InitialContext;
import java.io.Serializable;
import java.util.*;

/**
 * A class to process job hits.
 * @author  Greg Paul
 */
public class JobHitTask extends BaseTask implements Task, Serializable {

    private static Logger log = Logger.getLogger(ProblemSubmissionsTask.class);

    private int userId;
    private int jobId;
    private int hitType;
    private ArrayList jobHits;


    /** Creates new JobHitTask */
    public JobHitTask() {
        super();
        setNextPage(TCESConstants.PROBLEM_SUBMISSIONS_PAGE);
        jobId = -1;
        userId = -1;
        hitType = -1;
        jobHits = new ArrayList();
    }

    public void servletPreAction(HttpServletRequest request, HttpServletResponse response)
        throws Exception {

        HttpSession session = request.getSession(true);

        Navigation navigation = (Navigation)session.getAttribute("navigation");
        if (!navigation.getLoggedIn()) {
            log.debug("User not logged in, can not add job hit.");
            throw new Exception("User not logged in, can not add job hit.");
        } else {
            this.setUserId(navigation.getUserId());
        }
    }

    public void processStep(String step) throws Exception {
        InitialContext ctx = null;
        TCESServicesHome tcesHome = null;
        TCESServices tcesServices = null;
        try {
            ctx = (InitialContext) TCContext.getInitial();
            tcesHome = (TCESServicesHome)ctx.lookup(ApplicationServer.TCES_SERVICES);
            tcesServices = tcesHome.create();
            if (jobHits.size() > 0) {
                for (int i=0; i<jobHits.size(); i++) {
                    try {
                        tcesServices.addJobHit(userId, ((Integer)jobHits.get(i)).intValue(),
                                TCESConstants.JOB_POSTING_ID);
                    } catch (Exception e) {
                        throw new Exception("failed to add job hit for user: " + userId +
                                " job: " + jobHits.get(i) +
                                " hit type: " + TCESConstants.JOB_POSTING_ID);
                    }
                }
            } else {
                try {
                    tcesServices.addJobHit(userId, jobId, hitType);
                } catch (Exception e) {
                    throw new Exception("failed to add job hit for user: " + userId +
                            " job: " + jobId +
                            " hit type: " + TCESConstants.JOB_POSTING_ID);
                }
            }
        } catch (Exception e) {
            throw e;
        }
    }


    public void setAttributes(String paramName, String[] paramValues) {
        String value = paramValues[0];
        value = (value == null?"":value.trim());

        if (paramName.equalsIgnoreCase(TCESConstants.JOB_HIT_TYPE_PARAM))
            setHitType(Integer.parseInt(value));
        else if (paramName.equalsIgnoreCase(TCESConstants.JOB_ID_PARAM))
            setJobId(Integer.parseInt(value));
        else if (paramName.startsWith(TCESConstants.JOB_HIT_PREFIX))
            jobHits.add(new Integer(paramName.substring(TCESConstants.JOB_HIT_PREFIX.length())));
    }

    public ArrayList getJobHits() {
        return jobHits;
    }

    public void setJobHits(ArrayList jobHits) {
        this.jobHits = jobHits;
    }

    public int getHitType() {
        return hitType;
    }

    public void setHitType(int hitType) {
        this.hitType = hitType;
    }

    public int getJobId() {
        return jobId;
    }

    public void setJobId(int jobId) {
        this.jobId = jobId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

}
