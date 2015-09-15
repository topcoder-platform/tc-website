package com.topcoder.web.tc.controller.request;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.CachedDataAccess;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * Processor to return a sponsor image.  If the system has been set up so that
 * there is an image associated with the round, then it will use that.  If
 * the system is set up so that there is none associated with the round, but there
 * is one associated with the company, then use that.  Otherwise, return nothing.
 *
 * @author dok
 * @version $Id$
 *          Create Date: Feb 21, 2008
 */
public class SponsorImage extends BaseProcessor {
    protected void businessProcessing() throws Exception {
        Request dataRequest = new Request();
        dataRequest.setContentHandle("sponsor_image");
        dataRequest.setProperties(getRequest().getParameterMap());
        DataAccessInt dai = new CachedDataAccess(DBMS.OLTP_DATASOURCE_NAME);
        Map<String, ResultSetContainer> resultMap = dai.getData(dataRequest);
        ResultSetContainer companyImages = resultMap.get("Sponsor_Image");
        ResultSetContainer roundImages = resultMap.get("round_sponsor");

        if (!roundImages.isEmpty()) {
            writeImage(roundImages, dataRequest.getCacheKey());
        } else if (!companyImages.isEmpty()) {
            writeImage(companyImages, dataRequest.getCacheKey());
        } else {
            log.info("no image found for " + dataRequest.toString());
            getResponse().setStatus(HttpServletResponse.SC_NOT_FOUND);
            getResponse().flushBuffer();
        }
    }

    private void writeImage(ResultSetContainer rsc, String key) throws IOException {
        FileInputStream fis = new FileInputStream(rsc.getItem(getNextIndex(key, rsc.size()), "file_path").toString());
        //we don't track the correct mime type right now, so we just hard code to gif (because we only use gif's)
        getResponse().setContentType("image/gif");
        ServletOutputStream os = getResponse().getOutputStream();
        int b;
        while ((b = fis.read()) >= 0) {
            os.write(b);
        }
        getResponse().flushBuffer();

    }


    private static Map<String, Integer> localCache = new HashMap<String, Integer>();

    private static synchronized int getNextIndex(String key, int size) {
        Integer val;

        if (size < 1) throw new RuntimeException("size must be greater than 0: " + size);

        val = localCache.get(key);
        if (val == null) {
            val = 0;
        }

        int iCurr = val;
        if (size > 1 && iCurr < (size - 1)) {
            iCurr++;
        } else {
            iCurr = 0;
        }
        localCache.put(key, iCurr);
        return iCurr;
    }


}
