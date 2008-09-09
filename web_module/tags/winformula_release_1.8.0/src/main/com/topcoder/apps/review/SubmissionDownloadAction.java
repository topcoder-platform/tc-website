/**
 * Copyright ?2003, TopCoder, Inc. All rights reserved
 */

package com.topcoder.apps.review;

import com.topcoder.util.log.Level;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForwards;
import org.apache.struts.action.ActionMapping;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.util.Hashtable;

/**
 * <p>
 * Extends from <strong>ReviewAction</strong> that return the submission
 * file to the client.
 * </p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */
public class SubmissionDownloadAction extends ReviewAction {

    /**
     * The size of buffer block.
     */
    private static final int BLOCK_SIZE = 65536;

    /**
     * The table of mime types.
     */
    private Hashtable htMimeTypes = new Hashtable();

    /**
     * Initializes the mime types.
     */
    private void init() {
        htMimeTypes.put(".doc", "application/msword");
        htMimeTypes.put(".xls", "application/msexcel");
        htMimeTypes.put(".txt", "text/plain");
        htMimeTypes.put(".xml", "text/xml");
        htMimeTypes.put(".gif", "image/gif");
        htMimeTypes.put(".jpg", "image/jpeg");
        htMimeTypes.put(".jpeg", "image/jpeg");
        htMimeTypes.put(".pdf", "application/pdf");
        htMimeTypes.put(".zip", "application/x-zip-compressed");
        htMimeTypes.put(".jar", "application/x-zip-compressed");
    }

    /**
     * <p>
     * Call the business logic layer and return the submission file.
     * </p>
     *
     * @return the result data.
     *
     * @param mapping The ActionMapping used to select this instance
     * @param form The optional ActionForm bean for this request (if any)
     * @param request The HTTP request we are processing
     * @param response The HTTP response we are creating
     * @param errors The action errors in calling the logic layer.
     * @param forwards The action forwards from calling the logic layer.
     * @param orpd The OnlineReviewProjectData to create the action data.
     */
    public ResultData executeLogic(ActionMapping mapping,
                                   ActionForm form,
                                   HttpServletRequest request,
                                   HttpServletResponse response,
                                   ActionErrors errors,
                                   ActionForwards forwards,
                                   OnlineReviewProjectData orpd) {
        init();
        log(Level.INFO, "SubmissionDownloadAction: User '"
                + orpd.getUser().getHandle() + "' in session "
                + request.getSession().getId());

        // Get the id parameter
        long sid = -1;
        try {
            sid = Long.parseLong(String.valueOf(request.getParameter(Constants.SUBMISSION_ID_KEY)));
        } catch (NumberFormatException e) {
            sid = -1;
        }
        //////////////////////////////////////////////////////////////////////////////////////////////////////////////
        // Added by WishingBone - Automated Screening
        long vid = -1;
        try {
            vid = Long.parseLong(String.valueOf(request.getParameter(Constants.VERSION_ID_KEY)));
        } catch (NumberFormatException e) {
            vid = -1;
        }
        //////////////////////////////////////////////////////////////////////////////////////////////////////////////

        // Call the business layer
        BusinessDelegate businessDelegate = new BusinessDelegate();
        SubmissionDownloadData data = new SubmissionDownloadData(orpd, sid);
        //////////////////////////////////////////////////////////////////////////////////////////////////////////////
        // Added by WishingBone - Automated Screening
        data.setVersionId(vid);
        //////////////////////////////////////////////////////////////////////////////////////////////////////////////
        ResultData result = businessDelegate.submissionDownload(data);

        if (result instanceof SuccessResult) {
            SubmissionDownloadRetrieval sdr = (SubmissionDownloadRetrieval) result;
            String filename = sdr.getUserFilename();
            String mimeType = "";
            int idxExtension = filename.lastIndexOf(".");

            if (idxExtension != -1) {
                String extension = filename.substring(idxExtension, filename.length()).toLowerCase();
                mimeType = "" + htMimeTypes.get(extension);
            }

            response.reset();

            try {
                // Set up IO streams
                InputStream is = sdr.getSubmissionInputStream();
                ServletOutputStream out = response.getOutputStream();

                // Set headers
                response.setHeader("Content-Disposition", "attachment;filename=\"" + filename + "\"");
                response.setContentType(mimeType);
                response.setContentLength(is.available());

                // Output the file to stream
                int numBytes = 0;
                byte[] inBytes = new byte[BLOCK_SIZE];

                numBytes = is.read(inBytes);
                while (numBytes > 0) {
                    out.write(inBytes, 0, numBytes);
                    numBytes = is.read(inBytes);
                }
                is.close();
            } catch (IOException e) {
                //e.printStackTrace();
            }

            response.setStatus(HttpServletResponse.SC_OK);
            forwards.removeForward(mapping.findForward(Constants.SUCCESS_KEY));
        }

        return result;
    }
}
