/*
 * Created on May 2, 2006
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package com.topcoder.web.forums.controller.request;

import com.jivesoftware.forum.database.DbAttachment;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.forums.ForumConstants;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

/**
 * @author billy
 *         <p/>
 *         Gets a file attachment based on the attachment ID.
 *         A file dialog box pops up instead of forwarding to another page.
 */
public class GetAttachment extends ForumsProcessor {
    protected void businessProcessing() throws Exception {
        super.businessProcessing();
        if (isGuest()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }

        String strAttachmentID = getRequest().getParameter(ForumConstants.ATTACHMENT_ID);
        long attachmentID = Long.parseLong(strAttachmentID);
        DbAttachment attachment = new DbAttachment(attachmentID);
        InputStream attachmentFileStream = attachment.getData();

        OutputStream outputStream = getResponse().getOutputStream();
        try {
            // Set the headers.
            getResponse().setContentType("application/x-download");
			 getResponse().setHeader("Cache-Control", "must-revalidate");
			 getResponse().setHeader("Pragma", "must-revalidate");
			 getResponse().setDateHeader("Expires", 0);
						 
			getResponse().setHeader("Content-Length", String.valueOf(attachment.getSize()));
            getResponse().setHeader("Content-Disposition", "attachment; filename=\"" + attachment.getName() + "\"");
            getResponse().setHeader("Content-Length", String.valueOf(attachment.getSize()));

            // Send the file.
            byte[] buffer = new byte[1024];
            int read;
            while ((read = attachmentFileStream.read(buffer)) > 0) {
                outputStream.write(buffer, 0, read);
            }

            log.debug("done sending file!");
        } catch (IOException ioe) {
            log.debug("Error sending attachment - cancel button chosen?");
            ioe.printStackTrace();
        } finally {
            if (attachmentFileStream != null) {
                try {
                    attachmentFileStream.close();
                } catch (Exception e) {
                    log.error(e.getMessage());
                }
            }
            if (outputStream != null) {
                try {
                    outputStream.close();
                } catch (Exception e) {
                    log.error(e.getMessage());
                }
            }
        }
    }
}
