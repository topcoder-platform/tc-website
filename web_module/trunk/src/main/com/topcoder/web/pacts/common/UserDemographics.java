/**
 * this class has all of the demographic questions and answers for a user
 */
package com.topcoder.web.pacts.common;

import java.util.*;
import com.topcoder.web.common.*;
import org.apache.log4j.*;
   
public class UserDemographics implements PactsConstants, java.io.Serializable {
    private static Category log = 
	Category.getInstance(UserDemographics.class.getName()); 

    public String[] answers;
    public String[] questions;

    public UserDemographics () {
	setDefaults();
    }

    private void setDefaults() {
	answers = new String[0];
	questions = new String[0];
    }


    /**
     * extracts the questions and answers.  For the answer text, if there
     * is no response text, it will use demographic answer text instead
     */
    public UserDemographics (Map results) {
	ResultSetContainer rsc = (ResultSetContainer) results.get(USER_DEMOGRAPHICS);
	
	
	// check if it was there
	if(rsc == null) {
	    log.error("The result map did not contain " + CONTRACT_HEADER_LIST );
	    setDefaults();
	    return;
	}
	
	int numRows = rsc.getRowCount();
	answers = new String[numRows];
	questions = new String[numRows];
	
	for(int idx=0;idx<numRows;idx++) {
	    // now fill up the data structure
	    ResultSetContainer.ResultSetRow rRow = rsc.getRow(idx);	    

	    try {
		questions[idx] = TCData.getTCString(rRow,"demographic_question_text");
		answers[idx] = TCData.getTCString(rRow, "demographic_response");
		if(answers[idx].length() <= 0) {
		    answers[idx] = TCData.getTCString(rRow,"demographic_answer_text");
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
	
    }          

}
