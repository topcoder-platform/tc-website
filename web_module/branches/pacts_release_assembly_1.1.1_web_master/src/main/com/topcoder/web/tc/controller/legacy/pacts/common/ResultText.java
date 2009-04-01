package com.topcoder.web.tc.controller.legacy.pacts.common;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.logging.Logger;

import java.util.Map;

public class ResultText implements PactsConstants {
    private static Logger log = Logger.getLogger(ResultText.class);

    protected String text;

    public ResultText(Map results) {
        ResultSetContainer rsc = (ResultSetContainer) results.get(TEXT);

        // check if it was there
        if (rsc == null) {
            log.error("The result map did not contain " + TEXT);
            return;
        }

        ResultSetContainer.ResultSetRow rRow = rsc.getRow(0);

        text = TCData.getTCString(rRow, "text");
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

}

