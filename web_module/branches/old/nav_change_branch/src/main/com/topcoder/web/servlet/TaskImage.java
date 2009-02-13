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
import java.util.Map;

public final class TaskImage {

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
            fis = new FileInputStream(rsc.getItem(0, "file_path").toString());
            result = new byte[fis.available()];
            fis.read(result);
            return result;
        } catch (Exception e) {
            e.printStackTrace();
            throw new NavigationException("TaskImage:process:ERROR::",
                    TCServlet.NAVIGATION_ERROR_PAGE);
        }

    }


}

