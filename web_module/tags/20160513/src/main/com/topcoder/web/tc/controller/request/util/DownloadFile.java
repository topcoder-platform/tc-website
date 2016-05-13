package com.topcoder.web.tc.controller.request.util;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.*;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.Base;
import com.cronos.termsofuse.dao.TermsOfUseDao;
import com.cronos.termsofuse.dao.UserTermsOfUseDao;
import com.cronos.termsofuse.dao.impl.TermsOfUseDaoImpl;
import com.cronos.termsofuse.dao.impl.UserTermsOfUseDaoImpl;
import com.cronos.termsofuse.model.TermsOfUse;
import com.topcoder.configuration.persistence.ConfigurationFileManager;
import com.topcoder.web.common.NavigationException;

import javax.servlet.ServletOutputStream;
import java.io.File;
import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Map;
import com.topcoder.util.config.*;
import java.net.URLEncoder;

public class DownloadFile extends Base {

    protected void businessProcessing() throws com.topcoder.web.common.TCWebException {

        try {
            if (getSessionInfo().isAnonymous()) {
                throw new PermissionException(getUser(), new ClassResource(this.getClass()));
            }
            long userId = getUser().getId();
            long termsOfUseId = Long.parseLong(Constants.FILE_DOWNLOAD_TERMS_ID);

            // check whether user has the terms on file
            ConfigurationFileManager cm = new ConfigurationFileManager(Constants.CONFIGURATION_FILE);
            UserTermsOfUseDao userTermsOfUseDao = new UserTermsOfUseDaoImpl(
                    cm.getConfiguration(Constants.USER_TERMS_OF_USE_DAO_NS).getChild(Constants.USER_TERMS_OF_USE_DAO_NS));
            if (!userTermsOfUseDao.hasTermsOfUse(getUser().getId(), termsOfUseId)) {
                StringBuffer sb = new StringBuffer("/tc?module=Terms&tuid=");
                sb.append(termsOfUseId).append("&is_agree=true&origin=");
                sb.append(URLEncoder.encode(getRequest().getRequestURI() + "?" + getRequest().getQueryString()));
                setNextPage(sb.toString());
                setIsNextPageInContext(false);
                return;
            }


            File file = new File(Constants.FILE_TO_DOWNLOAD_PATH);
            if (!file.exists()) {
                throw new NavigationException("File does not exist.");
            }

            getResponse().addHeader("content-disposition", "attachment; filename=\"" + file.getName() + "\"");
            getResponse().setContentLength((int) file.length());
            getResponse().setContentType(getContentType(file.getName()));
            ServletOutputStream sos = getResponse().getOutputStream();
            InputStream is = new FileInputStream(file);
            try {
                FileInputStream in = new FileInputStream(file);
                byte[] buffer = new byte[4096];
                int length;
                while ((length = in.read(buffer)) > 0){
                    sos.write(buffer, 0, length);
                }
            } finally {
                is.close();
            }
            sos.flush();
            sos.close();
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    /**
     * <p>
     * Returns the MIME type based on the file extension.
     * </p>
     *
     * param filename Filename.
     * @return Content type.
     */
    private String getContentType(String filename) {
        String ext = "";
        int idxExtension = filename.lastIndexOf(".");
        if (idxExtension != -1) {
            ext = filename.substring(idxExtension, filename.length()).toLowerCase();
        }
        if (ext.equals("doc")) return "application/msword";
        if (ext.equals("xls")) return "application/msexcel";
        if (ext.equals("txt")) return "text/plain";
        if (ext.equals("xml")) return "text/xml";
        if (ext.equals("gif")) return "image/gif";
        if (ext.equals("jpg")) return "image/jpeg";
        if (ext.equals("jpeg")) return "image/jpeg";
        if (ext.equals("pdf")) return "application/pdf";
        if (ext.equals("zip")) return "application/x-zip-compressed";
        if (ext.equals("jar")) return "application/x-java-archive";
        return "application";
    }
}
