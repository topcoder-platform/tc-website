package com.topcoder.web.creative.controller.request;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.creative.Constants;
import com.topcoder.web.creative.dao.CreativeDAOUtil;
import com.topcoder.web.creative.model.Document;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 1, 2006
 */
public class DownloadDocument extends ShortHibernateProcessor {

    protected void dbProcessing() throws Exception {
        Long documentId;

        try {
            documentId = new Long(getRequest().getParameter(Constants.DOCUMENT_ID));
        } catch (NumberFormatException e) {
            throw new NavigationException("Invalid Document Specified");
        }

        Document d = CreativeDAOUtil.getFactory().getDocumentDAO().find(documentId);

        //stream it out via the response
        getResponse().addHeader("content-disposition", "inline; filename=" + d.getOriginalFileName());
        getResponse().setContentType(d.getFileType().getMimeType());
        ServletOutputStream sos = getResponse().getOutputStream();

        FileInputStream fis = new FileInputStream(d.getPath().getPath() + d.getSystemFileName());

        int b;
        while ((b = fis.read()) >= 0) {
            sos.write(b);
        }
        getResponse().setStatus(HttpServletResponse.SC_OK);
        getResponse().flushBuffer();


    }
}
