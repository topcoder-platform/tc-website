package com.topcoder.web.screening.request;

import com.topcoder.web.screening.common.Constants;

public class PreviewEmail extends BaseProcessor {
    public void process() {
        setNextPage(Constants.PREVIEW_EMAIL_PAGE);
        setNextPageInContext(true);
    }
}
