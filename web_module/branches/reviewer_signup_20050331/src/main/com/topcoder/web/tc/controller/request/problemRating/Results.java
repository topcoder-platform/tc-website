package com.topcoder.web.tc.controller.request.problemRating;

import com.topcoder.web.common.TCWebException;

public class Results extends PRBase {
    protected void businessProcessing() throws TCWebException {
        try {
            processResults();
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
}

