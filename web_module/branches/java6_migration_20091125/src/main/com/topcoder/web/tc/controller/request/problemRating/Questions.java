package com.topcoder.web.tc.controller.request.problemRating;

import com.topcoder.web.common.TCWebException;

public class Questions extends PRBase {
    protected void businessProcessing() throws TCWebException {
        try {
            processQuestions();
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
}

