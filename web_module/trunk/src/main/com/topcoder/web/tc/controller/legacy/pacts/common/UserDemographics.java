/**
 * this class has all of the demographic questions and answers for a user
 */
package com.topcoder.web.tc.controller.legacy.pacts.common;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.logging.Logger;

import java.util.Map;

public class UserDemographics implements PactsConstants, java.io.Serializable {
    private static Logger log = Logger.getLogger(UserDemographics.class);

    public String[] answers;
    public String[] questions;
    public String _schoolName;

    public UserDemographics() {
        setDefaults();
    }

    private void setDefaults() {
        answers = new String[0];
        questions = new String[0];
        _schoolName = "";
    }


    /**
     * extracts the questions and answers.  For the answer text, if there
     * is no response text, it will use demographic answer text instead
     */
    public UserDemographics(Map results) {
        ResultSetContainer rsc = (ResultSetContainer) results.get(USER_DEMOGRAPHICS);


        // check if it was there
        if (rsc == null) {
            log.error("The result map did not contain " + CONTRACT_HEADER_LIST);
            setDefaults();
            return;
        }

        int numRows = rsc.getRowCount();
        answers = new String[numRows];
        questions = new String[numRows];

        for (int idx = 0; idx < numRows; idx++) {
            // now fill up the data structure
            ResultSetContainer.ResultSetRow rRow = rsc.getRow(idx);

            try {
                questions[idx] = TCData.getTCString(rRow, "demographic_question_text");
                answers[idx] = TCData.getTCString(rRow, "demographic_response");
                if (answers[idx].length() <= 0) {
                    answers[idx] = TCData.getTCString(rRow, "demographic_answer_text");
                    log.debug("rRow = " + rRow.toString());
                }
                log.debug("q = " + questions[idx]);
                log.debug("a = " + answers[idx]);
            } catch (Exception e) {
                log.error("ther was an exception trying to read the user demographic data");
                setDefaults();
                e.printStackTrace();
                return;
            }

        }

        rsc = null;
        rsc = (ResultSetContainer) results.get(USER_CURRENT_SCHOOL);
        if (rsc == null) {
            log.error("The result map did not contain " + USER_CURRENT_SCHOOL);
            _schoolName = "";
            //fix - 6/16/2002  Matt Murphy
        } else if (rsc.getRowCount() <= 0) {
            log.error("The result set '" + USER_CURRENT_SCHOOL + "' was empty!");
            _schoolName = "";
        } else {
            ResultSetContainer.ResultSetRow rRow = rsc.getRow(0);
            _schoolName = TCData.getTCString(rRow, "school_name");
        }
    }
}
