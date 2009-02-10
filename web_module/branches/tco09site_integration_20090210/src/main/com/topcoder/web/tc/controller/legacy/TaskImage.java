package com.topcoder.web.tc.controller.legacy;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.CachedDataAccess;
import com.topcoder.web.common.NavigationException;

import javax.servlet.http.HttpServletRequest;
import java.io.FileInputStream;
import java.util.HashMap;
import java.util.Map;

public final class TaskImage {

    private static Map localCache = new HashMap();

    static byte[] process(HttpServletRequest request)
            throws NavigationException {
        byte[] result = null;
        FileInputStream fis = null;
        try {
            Request dataRequest = new Request(request.getParameterMap());
            DataAccessInt dai = new CachedDataAccess(DBMS.OLTP_DATASOURCE_NAME);
            Map resultMap = dai.getData(dataRequest);
            ResultSetContainer rsc = (ResultSetContainer) resultMap.get("Sponsor_Image");
            fis = new FileInputStream(rsc.getItem(getNextIndex(dataRequest.toString(), rsc.size()), "file_path").toString());
            result = new byte[fis.available()];
            fis.read(result);
            fis.close();
            return result;
        } catch (Exception e) {
            throw new NavigationException(e);
        }

    }

    private static synchronized int getNextIndex(String key, int size) throws Exception {
        Integer val = null;

        if (size < 1) throw new Exception("size must be greater than 0: " + size);

        val = (Integer) localCache.get(key);
        if (val == null) {
            val = new Integer(0);
        }

        int iCurr = val.intValue();
        if (size > 1 && iCurr < (size - 1)) {
            iCurr++;
        } else {
            iCurr = 0;
        }
        localCache.put(key, new Integer(iCurr));
        return iCurr;
    }

}

