package com.topcoder.web.servlet;

import com.topcoder.common.web.constant.TCServlet;
import com.topcoder.common.web.data.Navigation;
import com.topcoder.common.web.error.NavigationException;
import com.topcoder.common.web.util.Conversion;
import com.topcoder.shared.dataAccess.*;
import com.topcoder.shared.dataAccess.resultSet.*;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.TCContext;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpUtils;
import java.io.File;
import java.io.FileInputStream;
import java.util.*;

public final class TaskImage {

    private static Map localCache = new HashMap();

    static byte[] process(HttpServletRequest request, HttpServletResponse response, Navigation nav)
            throws NavigationException {
        byte[] result = null;
        FileInputStream fis = null;
        try {
            Request dataRequest = new Request(HttpUtils.parseQueryString(request.getQueryString()));
            DataAccessInt dai = new CachedDataAccess((javax.sql.DataSource)
                TCContext.getInitial().lookup(DBMS.OLTP_DATASOURCE_NAME));
            Map resultMap = dai.getData(dataRequest);
            ResultSetContainer rsc = (ResultSetContainer) resultMap.get("Sponsor_Image");
            fis = new FileInputStream(rsc.getItem(getNextIndex(dataRequest.toString(), rsc.size()), "file_path").toString());
            result = new byte[fis.available()];
            fis.read(result);
            return result;
        } catch (Exception e) {
            e.printStackTrace();
            throw new NavigationException("TaskImage:process:ERROR::",
                    TCServlet.NAVIGATION_ERROR_PAGE);
        }

    }
    
    private static synchronized int getNextIndex(String key, int size) throws Exception {
        Integer val = null;
        int ret = 0;

        if (size < 1) throw new Exception("size must be greater than 0: " + size);

        val = (Integer)localCache.get(key);
        if (val == null) {
          val = new Integer(0);
        }
        
        int iCurr = val.intValue();
        if (iCurr < size) { 
            iCurr++;
        } else {
            iCurr = 0;
        }
        localCache.put(key, new Integer(iCurr));
        return iCurr;
    }

}

