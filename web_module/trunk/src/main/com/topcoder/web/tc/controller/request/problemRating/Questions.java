package com.topcoder.web.tc.controller.request.problemRating;

import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.common.NavigationException;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.HashMap;
import java.util.Map;

public class Questions extends Base {
    protected void businessProcessing() throws TCWebException {
        try{
            processQuestions();
            setNextPage(Constants.PROBLEM_RATING_QUESTIONS);
            setIsNextPageInContext(true);
        }catch(NavigationException e){
            throw e;
        }catch(Exception e){
            e.printStackTrace();
            throw new NavigationException("There was an error retrieving the problem rating questions.  Please contact TopCoder.");
        }
    }
}

