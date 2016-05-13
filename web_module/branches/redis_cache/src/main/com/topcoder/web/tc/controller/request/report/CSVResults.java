package com.topcoder.web.tc.controller.request.report;

import com.topcoder.common.web.data.report.Constants;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.CachedDataAccess;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.cache.MaxAge;
import com.topcoder.web.tc.controller.request.Base;

import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 7, 2007
 */
public class CSVResults extends Base {

    public static final String QUERY_NAME = "query";

    protected void businessProcessing() throws Exception {
        if (getSessionInfo().isAdmin()) {
            Request dataRequest;
            dataRequest = new Request(getRequest().getParameterMap());
            if (dataRequest.getContentHandle() == null || dataRequest.getContentHandle().equals("")) {
                throw new NavigationException("you forgot to make a request");
            } else {
                String queryName = getRequest().getParameter(QUERY_NAME);
                DataAccessInt dai = new CachedDataAccess(MaxAge.QUARTER_HOUR,
                        dataRequest.getProperty(Constants.DB_KEY, DBMS.OLTP_DATASOURCE_NAME));
                ResultSetContainer rsc = dai.getData(dataRequest).get(queryName);


                getResponse().addHeader("content-disposition", "inline; filename=\"" + queryName + ".csv\"");
                getResponse().setContentType("application/csv");
                PrintWriter writer = new PrintWriter(getResponse().getOutputStream());

                int colCount = rsc.getColumnCount();
                for (int i = 0; i < colCount; i++) {
                    if (rsc.getColumnInfo(i).getName().contains(",")) {
                        writer.print("\"");
                        writer.print(rsc.getColumnInfo(i).getName());
                        writer.print("\"");
                    } else {
                        writer.print(rsc.getColumnInfo(i).getName());
                    }
                    if (i != colCount - 1) {
                        writer.print(",");
                    }
                }
                writer.print("\n");

                String item;
                for (ResultSetContainer.ResultSetRow row : rsc) {
                    for (int i = 0; i < colCount; i++) {
                        item = row.getItem(i).toString();
                        if (item.contains(",") || item.contains("\n")) {
                            writer.print("\"");
                            writer.print(item);
                            writer.print("\"");
                        } else {
                            writer.print(item);
                        }
                        if (i != colCount - 1) {
                            writer.print(",");
                        }
                    }
                    writer.print("\n");
                }

                getResponse().setStatus(HttpServletResponse.SC_OK);
                writer.flush();

            }

        } else {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }
    }
}
