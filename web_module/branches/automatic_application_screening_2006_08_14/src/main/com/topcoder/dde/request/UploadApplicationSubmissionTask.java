package com.topcoder.dde.request;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;

import com.topcoder.apps.review.ConfigHelper;
import com.topcoder.apps.review.EJBHelper;
import com.topcoder.apps.review.SubmissionDownload;
import com.topcoder.servlet.request.UploadedFile;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.util.format.FormatMethodFactory;
import com.topcoder.web.common.MultipartRequest;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.BaseProcessor;

public class UploadApplicationSubmissionTask extends BaseProcessor {

    /**
     * The buffer size for file copy.
     */
    public static final int BUFSIZE = 16384;

    private static Logger log = Logger.getLogger(UploadApplicationSubmissionTask.class);

    protected void businessProcessing() throws TCWebException {
        try {
            if (getUser().isAnonymous()) {
                throw new PermissionException(getUser(), new ClassResource(this.getClass()));
            } else {
                MultipartRequest req = (MultipartRequest) getRequest();

                UploadedFile file = req.getUploadedFile("file1");

                if (file != null && file.getContentType() != null) {
                    log.info("File received");

                    InputStream is = file.getInputStream();
                    String remoteName = file.getRemoteFileName();

                    String destFilename = "Application_" + remoteName;
                    log.info("Dest: " + ConfigHelper.getSubmissionPathPrefix() + destFilename);

                    try {
                        copy(is, ConfigHelper.getSubmissionPathPrefix() + destFilename);
                    } finally {
                        is.close();
                    }

                    getRequest().setAttribute("file_nanme", remoteName);

                    setNextPage("/applications/upload_results.jsp");
                    setIsNextPageInContext(true);
                } else {
                    throw new TCWebException("Empty file uploaded");
                }
            }
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    /**
     * Utility method to copy a file under a new name.
     *
     * @param source the source inputstream
     * @param destname the destination filename
     *
     * @throws IOException if an I/O error occurs
     */
    static void copy(InputStream source, String destname) throws IOException {
        File dest = new File(destname);

        FileOutputStream fos = new FileOutputStream(dest);
        byte[] buf = new byte[BUFSIZE];
        int read = 0;
        while ((read = source.read(buf)) != -1) {
            fos.write(buf, 0, read);
        }
        fos.close();

    }

}
