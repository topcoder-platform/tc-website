package com.topcoder.web.aolicq.controller.request.admin;

import com.topcoder.web.aolicq.model.ContestResult;
import com.topcoder.web.aolicq.model.Prize;
import com.topcoder.web.aolicq.model.PrizeType;
import com.topcoder.web.aolicq.model.Submission;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 29, 2006
 */
public class AddSubmissionPrize extends SubmissionPrizeBase {
    protected void submissionProcessing(Submission s, Prize p) throws Exception {
        s.addPrize(p);
        //if the prize is a contest prize and we haven't set a contest result placed record for this
        //then set one.  the site uses contest result to show place, so we need to set that up
        //in the case that we're not using online review.
        if (p.getType().getId().equals(PrizeType.CONTEST)) {
            ContestResult cr = s.getResult();
            if (cr == null) {
                cr = new ContestResult(s);
            }
            if (cr.getPlaced() == null) {
                cr.setPlaced(p.getPlace());
            }
        }
    }
}

