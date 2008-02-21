package com.topcoder.web.tc.controller.request;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.CachedDataAccess;
import com.topcoder.web.common.NavigationException;

import javax.servlet.ServletOutputStream;
import java.io.FileInputStream;
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
        FileInputStream fis;
        try {
            Request dataRequest = new Request();
            dataRequest.setContentHandle("sponsor_image");
            dataRequest.setProperties(getRequest().getParameterMap());
            DataAccessInt dai = new CachedDataAccess(DBMS.OLTP_DATASOURCE_NAME);
            Map<String, ResultSetContainer> resultMap = dai.getData(dataRequest);
            ResultSetContainer companyImages = resultMap.get("Sponsor_Image");
            ResultSetContainer roundImages = resultMap.get("round_sponsor");

            //we don't track the correct mime type right now, so we just hard code to gif (because we only use gif's)
            getResponse().setContentType("image/gif");
            ServletOutputStream os = getResponse().getOutputStream();
            if (roundImages.isEmpty()) {
                fis = new FileInputStream(roundImages.getItem(getNextIndex(dataRequest.toString(), roundImages.size()), "file_path").toString());
            } else {
                fis = new FileInputStream(companyImages.getItem(getNextIndex(dataRequest.toString(), companyImages.size()), "file_path").toString());
            }
            int b;
            while ((b = fis.read()) >= 0) {
                os.write(b);
            }
            getResponse().flushBuffer();
        } catch (Exception e) {
            throw new NavigationException(e);
        }
    }


    private static Map<String, Integer> localCache = new HashMap<String, Integer>();

    private static synchronized int getNextIndex(String key, int size) throws Exception {
        Integer val;

        if (size < 1) throw new Exception("size must be greater than 0: " + size);

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
