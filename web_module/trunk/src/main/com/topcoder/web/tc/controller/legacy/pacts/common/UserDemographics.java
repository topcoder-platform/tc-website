/**
 * this class has all of the demographic questions and answers for a user
 */
package com.topcoder.web.tc.controller.legacy.pacts.common;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.logging.Logger;

import java.util.Map;

/**
 * VERY IMPORTANT: remember to update serialVersionUID if needed
 *
 */
public class UserDemographics implements PactsConstants, java.io.Serializable {
    /**
     * Please change that number if you affect the fields in a way that will affect the
     * serialization for this object, i.e. when data members are changed.
     * @see http://java.sun.com/j2se/1.3/docs/guide/serialization/spec/version.doc7.html
     */
    private static final long serialVersionUID = 1L;

    private static Logger log = Logger.getLogger(UserDemographics.class);

    private String[] answers;
    private String[] questions;
    private String schoolName;

    public UserDemographics() {
        setDefaults();
    }

    private void setDefaults() {
        answers = new String[0];
        questions = new String[0];
        schoolName = "";
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
                if (answers[idx] == null || answers[idx].length() <= 0) {
                    answers[idx] = TCData.getTCString(rRow, "demographic_answer_text");
                    log.debug("rRow = " + rRow.toString());
                }
                log.debug("q = " + questions[idx]);
                log.debug("a = " + answers[idx]);
            } catch (Exception e) {
                log.error("there was an exception trying to read the user demographic data");
                setDefaults();
                e.printStackTrace();
                return;
            }

        }

        rsc = null;
        rsc = (ResultSetContainer) results.get(USER_CURRENT_SCHOOL);
        if (rsc == null) {
            log.error("The result map did not contain " + USER_CURRENT_SCHOOL);
            schoolName = "";
            //fix - 6/16/2002  Matt Murphy
        } else if (rsc.getRowCount() <= 0) {
            log.error("The result set '" + USER_CURRENT_SCHOOL + "' was empty!");
            schoolName = "";
        } else {
            ResultSetContainer.ResultSetRow rRow = rsc.getRow(0);
            schoolName = TCData.getTCString(rRow, "school_name");
        }
    }

    public String[] getAnswers() {
        return answers;
    }

    public void setAnswers(String[] answers) {
        this.answers = answers;
    }

    public String[] getQuestions() {
        return questions;
    }

    public void setQuestions(String[] questions) {
        this.questions = questions;
    }

    public String getSchoolName() {
        return schoolName;
    }

    public void setSchoolName(String schoolName) {
        this.schoolName = schoolName;
    }


}
