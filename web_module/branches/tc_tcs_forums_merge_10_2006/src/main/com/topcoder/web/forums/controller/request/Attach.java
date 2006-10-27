/*
 * Created on Apr 29, 2005
 */
package com.topcoder.web.forums.controller.request;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import com.jivesoftware.base.Log;
import com.jivesoftware.base.UnauthorizedException;
import com.jivesoftware.forum.AttachmentException;
import com.jivesoftware.forum.Forum;
import com.jivesoftware.forum.ForumMessage;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.MultipartRequest;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.forums.ForumConstants;
import com.topcoder.web.forums.controller.ForumsUtil;
import com.topcoder.servlet.request.UploadedFile;

/**
 * @author billy
 *
 * Attaches uploaded file(s) to the current message.
 */
public class Attach extends ForumsProcessor {

	protected void businessProcessing() throws Exception {
		super.businessProcessing();
        if (isGuest()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }

		String postMode = getRequest().getParameter(ForumConstants.POST_MODE);        
        String forumIDStr = StringUtils.checkNull(getRequest().getParameter(ForumConstants.FORUM_ID));
        String messageIDStr = StringUtils.checkNull(getRequest().getParameter(ForumConstants.MESSAGE_ID));
        String tempMessageIDStr = StringUtils.checkNull(getRequest().getParameter(ForumConstants.TEMP_MESSAGE_ID));
        String subject = com.jivesoftware.util.StringUtils.escapeHTMLTags(
                getRequest().getParameter(ForumConstants.MESSAGE_SUBJECT).trim());
        String body = getRequest().getParameter(ForumConstants.MESSAGE_BODY).trim();
        String textareaBody = ForumsUtil.createTextAreaBody(body);
        
        long forumID = -1;
        if (postMode.equals("New")) {
            forumID = Long.parseLong(forumIDStr);
        } else if (postMode.equals("Edit") || postMode.equals("Reply")) {
            long messageID = Long.parseLong(messageIDStr);
            ForumMessage message = forumFactory.getMessage(messageID);
            forumID = message.getForum().getID();
        }

		setDefault(ForumConstants.FORUM_ID, getRequest().getParameter(ForumConstants.FORUM_ID));
		setDefault(ForumConstants.MESSAGE_ID, getRequest().getParameter(ForumConstants.MESSAGE_ID));
		setDefault(ForumConstants.TEMP_MESSAGE_ID, getRequest().getParameter(ForumConstants.TEMP_MESSAGE_ID));
		setDefault(ForumConstants.POST_MODE, postMode);
        setDefault(ForumConstants.MESSAGE_SUBJECT, subject);
        setDefault(ForumConstants.MESSAGE_BODY, textareaBody);
        
        MultipartRequest mpr = (MultipartRequest) getRequest();
        UploadedFile[] uploadedFiles = mpr.getAllUploadedFiles();
        for(int i=0; i<uploadedFiles.length; i++) {
        	log.debug("Uploading file: " + uploadedFiles[i].getRemoteFileName());
        }        

        ForumMessage messageToAttachTo = null;
        if (postMode.equals("New") || postMode.equals("Reply")) {
        	messageToAttachTo = (ForumMessage) getRequest().getSession().getAttribute("tempMessage_" + tempMessageIDStr); 
            getRequest().setAttribute("tempMessage", messageToAttachTo);
        } else if (postMode.equals("Edit")) {
            long messageID = Long.parseLong(messageIDStr);
            messageToAttachTo = forumFactory.getMessage(messageID);
            forumID = messageToAttachTo.getForum().getID();
        }
        
        log.debug("Attaching file(s) to message: " + messageToAttachTo);
        for(int fileIndex = 0; fileIndex < uploadedFiles.length; fileIndex++) {
        	attachFile(uploadedFiles[fileIndex], messageToAttachTo);
        }
		
        if (postMode.equals("Edit")) {
        	setNextPage(getSessionInfo().getServletPath() + 
    				"?module=Message&" + ForumConstants.MESSAGE_ID + "=" + messageToAttachTo.getID());
    		setIsNextPageInContext(false);
    		return;
        }
        
        Forum forum = forumFactory.getForum(forumID);
        if (!messageIDStr.equals("")) {
            ForumMessage message = forumFactory.getMessage(Long.parseLong(messageIDStr));
            getRequest().setAttribute("message", message);
            getRequest().setAttribute("thread", message.getForumThread());
        } else {
        	getRequest().setAttribute("message", getRequest().getAttribute("message"));
        }
 
        getRequest().setAttribute("forum", forum);
        getRequest().setAttribute("postMode", postMode);

        setNextPage("/post.jsp");
		setIsNextPageInContext(true);
	}
	
	/**
	 * Attaches an uploaded file to a message.
	 * @param uploadedFile The file which was uploaded.
	 * @param message The forum message to attach the file to.
	 */
	private void attachFile(UploadedFile uploadedFile, ForumMessage message) {
		BufferedInputStream uploadedFileBIS = null;
		InputStream is = null;
		String fileName = uploadedFile.getRemoteFileName();
		String errorMessage = "Cannot attach \"" + fileName + "\": ";
		
        try {
        	is = uploadedFile.getInputStream();
            uploadedFileBIS = new BufferedInputStream(is);
            
            if (message.getAttachmentCount() >= forumFactory.getAttachmentManager().getMaxAttachmentsPerMessage()) {
            	addError(ForumConstants.ATTACHMENT_ERROR, AttachmentException.messages[AttachmentException.TOO_MANY_ATTACHMENTS]);
            } else {
            	message.createAttachment(fileName, uploadedFile.getContentType(), uploadedFileBIS);
                log.info("Attached file: " + uploadedFile.getRemoteFileName() + 
                		" (" + uploadedFile.getSize() + " bytes)");
            }
        } catch (AttachmentException e) {
        	e.printStackTrace();
            if (e.getErrorType() == AttachmentException.TOO_LARGE) {
                List args = new ArrayList();
                args.add(fileName);
                addError(ForumConstants.ATTACHMENT_ERROR, errorMessage + AttachmentException.messages[AttachmentException.TOO_LARGE]);
            }
            else if (e.getErrorType() == AttachmentException.BAD_CONTENT_TYPE) {
                List args = new ArrayList();
                args.add(fileName);
                addError(ForumConstants.ATTACHMENT_ERROR, errorMessage + AttachmentException.messages[AttachmentException.BAD_CONTENT_TYPE]);
            }
            else if (e.getErrorType() == AttachmentException.TOO_MANY_ATTACHMENTS) {
            	addError(ForumConstants.ATTACHMENT_ERROR, errorMessage + AttachmentException.messages[AttachmentException.TOO_MANY_ATTACHMENTS]);
            }
            else {
            	errorMessage += (e.getMessage() != null) ? e.getMessage() : 
            		AttachmentException.messages[AttachmentException.GENERAL_ERROR]; 
            	addError(ForumConstants.ATTACHMENT_ERROR, errorMessage);
            }
        } catch (IOException e) {
        	e.printStackTrace();
        	addError(ForumConstants.ATTACHMENT_ERROR, e.getMessage());
        } catch (UnauthorizedException e) {
        	e.printStackTrace();
        	addError(ForumConstants.ATTACHMENT_ERROR, "Sorry, you do not have permission to attach files.");
        } finally {
        	if (errors.size() > 0) {
        		log.info("Errors encountered when attaching file: " + uploadedFile.getRemoteFileName() + 
                		" (" + uploadedFile.getSize() + " bytes)");
        		ArrayList errorsList = (ArrayList)errors.get(ForumConstants.ATTACHMENT_ERROR);
        		for (int i=0; i<errorsList.size(); i++) {
        			log.info("\t"+(String)errorsList.get(i));
        		}
        	}
        	if (uploadedFileBIS != null) {
    		    try {
    		    	uploadedFileBIS.close();
    		    } catch (IOException e) {
    		    	Log.error(e);
    		    }
    		}
        }
	}	
}