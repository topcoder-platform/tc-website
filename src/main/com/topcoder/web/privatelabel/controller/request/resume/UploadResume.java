package com.topcoder.web.privatelabel.controller.request.resume;

import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.ejb.resume.ResumeServices;
import com.topcoder.web.privatelabel.Constants;
import com.topcoder.servlet.request.UploadedFile;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.CachedDataAccess;
import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;

import javax.naming.InitialContext;
import javax.sql.DataSource;
import javax.rmi.PortableRemoteObject;
import java.util.Iterator;
import java.util.Map;

public class UploadResume extends Base {

    private static final int TRANSACTIONAL = 2;

    protected void businessProcessing() throws TCWebException {
        UploadedFile uf = null;
        byte[] fileBytes = null;
        int fileType = -1;
        String fileName = null;
        long userId = -1;
        try {
            if (file == null)
                throw new TCWebException("FileUpload object was null.");

            Long userIdObj = (Long)getRequest().getSession(true).getAttribute(Constants.USER_ID);
            if (userIdObj==null) {
                throw new NavigationException("Sorry, missing required information.  Session may have expired.");
            } else {
                userId = userIdObj.longValue();
            }

            Iterator it = file.getAllUploadedFiles();
            //only need to worry about a single resume
            if (it.hasNext()) {
                uf = (UploadedFile)it.next();
                log.debug(uf.getContentType());
                if (uf == null) {
                    throw new NavigationException("Sorry, the file you attempted to upload was empty.");
                } else {
                    fileBytes = new byte[(int)uf.getSize()];
                    uf.getInputStream().read(fileBytes);
                    fileType = Integer.parseInt(file.getParameter("fileType"));
                    fileName = uf.getRemoteFileName();
                    ResumeServices resumeServices = (ResumeServices)createEJB(getInitialContext(), ResumeServices.class);
                    resumeServices.putResume(userId, fileType, fileName, fileBytes, getDb());

                }
            }else{
                throw new Exception("No files uploaded");
            }
        } catch (Exception e){
            throw new TCWebException(e);
        }
    }

    private String getDb() throws Exception {

        long companyId;
        if (file.getParameter(Constants.COMPANY_ID)!=null) {
            companyId = Long.parseLong(file.getParameter(Constants.COMPANY_ID));
        } else {
            throw new Exception("Company id missing from request");
        }

        Request r = new Request();
        r.setContentHandle("company_datasource");
        r.setProperty("cm", String.valueOf(companyId));
        r.setProperty("dstid", String.valueOf(TRANSACTIONAL));
        //not sure if this db is ok...we'll see
        Map m = getDataAccess(DBMS.OLTP_DATASOURCE_NAME, true).getData(r);
        ResultSetContainer rsc = (ResultSetContainer)m.get("company_datasource");
        if (rsc==null || rsc.isEmpty()) {
            throw new Exception("Could not find datasource for company: " + companyId);
        } else {
            return rsc.getStringItem(0, "datasource_name");
        }
    }

    protected static DataAccessInt getDataAccess(String db) throws Exception {
        return getDataAccess(db, false);
    }

    protected static DataAccessInt getDataAccess(String datasource, boolean cached) throws Exception {
        if (datasource == null)
            throw new IllegalArgumentException("datasource name is null.");
        InitialContext context = new InitialContext();
        DataSource ds = (DataSource)
                PortableRemoteObject.narrow(context.lookup(datasource),
                        DataSource.class);
        close(context);
        DataAccessInt dAccess = null;
        if (cached)
            dAccess = new CachedDataAccess(ds);
        else
            dAccess = new DataAccess(ds);
        return dAccess;
    }

}
