/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.memberphoto.servlet;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.text.MessageFormat;
import java.util.Date;

import javax.imageio.ImageIO;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.transaction.annotation.Transactional;

import com.topcoder.servlet.request.ConfigurationException;
import com.topcoder.servlet.request.FileDoesNotExistException;
import com.topcoder.servlet.request.FileUploadResult;
import com.topcoder.servlet.request.InvalidFileException;
import com.topcoder.servlet.request.MemoryFileUpload;
import com.topcoder.servlet.request.PersistenceException;
import com.topcoder.servlet.request.RequestParsingException;
import com.topcoder.servlet.request.UploadedFile;
import com.topcoder.util.log.Level;
import com.topcoder.util.log.Log;
import com.topcoder.util.log.LogManager;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.model.Path;
import com.topcoder.web.memberphoto.entities.Image;
import com.topcoder.web.memberphoto.manager.MemberPhotoDAO;
import com.topcoder.web.memberphoto.manager.MemberPhotoManagementException;
import com.topcoder.web.memberphoto.manager.MemberPhotoManager;
import com.topcoder.web.memberphoto.manager.MemberPhotoManagerImpl;
import com.topcoder.web.memberphoto.manager.persistence.JPAMemberPhotoDAO;

/**
 * <p>
 * This class extends the <code>HttpServlet</code>, and it allows web site members to upload their photos. It
 * will extract the uploaded image from the request using the FileUpload, the uploaded image must be of JPEG
 * or PNG format only. The image will be resized and cropped to fit into the configured target image width and
 * height.
 * </p>
 * <p>
 * If the submitted flag is false, the image will be stored into a preview directory, and the servlet will
 * forward to a configured preview URL.
 * </p>
 * <p>
 * If the submitted flag is true, the image will be stored into a submitted directory, and some relevant
 * information will be stored to persistence using the MemberPhotoManager, and finally the servlet will
 * redirect to a configured submitted URL.
 * </p>
 * <p>
 * File processing should be synchronized since multiple servlets may access the same file concurrently.
 * </p>
 * <p>
 * NOTE: The form data will be validated, and if validation fails, it will forward to a validation error URL.
 * </p>
 * <p>
 * All its instance variables will be injected by the Spring. It should be marked with transactional
 * annotation to ensure the operation is transactional.
 * </p>
 * <p>
 * Version 2.0 changes <br>
 * 1. added the ability to process and validate GIF file formats<br>
 * 2. added the max byte size check for the image being uploaded when validating <br>
 * 3. added the configurable error code for the validation error for exceeded image file size <br>
 * 4. The submitted flag parameter is not used anymore. Instead each action has its own string name. <br>
 * 5. The servlet can be configured for crop information from JCrop through two new parameter names. <br>
 * 6. Logging has been added
 * </p>
 * <p>
 * <i>Sample code: </i><br>
 * <p>
 * 1.Sample Spring framework configuration file:
 * </p>
 *
 * <pre>
 * &lt;?xml version="1.0" encoding="UTF-8" ?&gt;
 * &lt;beans xmlns="http://www.springframework.org/schema/beans" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
 * xsi:schemaLocation="http://www.springframework.org/schema/beans
 * http://www.springframework.org/schema/beans/spring-beans-2.0.xsd"&gt;
 *     &lt;bean id="uploadServlet" class="com.topcoder.web.memberphoto.servlet.MemberPhotoUploadServlet"&gt;
 *         &lt;property name="memberIdParameterName"&gt;
 *             &lt;value&gt;
 *                 member_id
 *             &lt;/value&gt;
 *         &lt;/property&gt;
 *         &lt;property name="memberIdSessionKey"&gt;
 *             &lt;value&gt;
 *                 member_id_session_key
 *             &lt;/value&gt;
 *         &lt;/property&gt;
 *         &lt;property name="fileUploaderNamespace"&gt;
 *             &lt;value&gt;
 *                 MemoryFileUpload
 *             &lt;/value&gt;
 *         &lt;/property&gt;
 *         &lt;property name="photoImageFormFileName"&gt;
 *             &lt;value&gt;
 *                 test.gif
 *             &lt;/value&gt;
 *         &lt;/property&gt;
 *         &lt;property name="photoImageErrorName"&gt;
 *             &lt;value&gt;
 *                 photo_image_error_name
 *             &lt;/value&gt;
 *         &lt;/property&gt;
 *         &lt;property name="memberIdErrorName"&gt;
 *             &lt;value&gt;
 *                 member_id_error_name
 *             &lt;/value&gt;
 *         &lt;/property&gt;
 *         &lt;property name="validationErrorForwardUrl"&gt;
 *             &lt;value&gt;
 *                 validation_error_forward_url
 *             &lt;/value&gt;
 *         &lt;/property&gt;
 *         &lt;property name="targetImageWidth"&gt;
 *             &lt;value&gt;
 *                 100
 *             &lt;/value&gt;
 *         &lt;/property&gt;
 *         &lt;property name="targetImageHeight"&gt;
 *             &lt;value&gt;
 *                 80
 *             &lt;/value&gt;
 *         &lt;/property&gt;
 *         &lt;property name="photoImageSubmittedDirectory"&gt;
 *             &lt;value&gt;
 *                 test_files/submitted
 *             &lt;/value&gt;
 *         &lt;/property&gt;
 *         &lt;property name="photoImagePreviewDirectory"&gt;
 *             &lt;value&gt;
 *                 test_files/preview
 *             &lt;/value&gt;
 *         &lt;/property&gt;
 *         &lt;property name="previewPhotoImagePathName"&gt;
 *             &lt;value&gt;
 *                 /preview
 *             &lt;/value&gt;
 *         &lt;/property&gt;
 *         &lt;property name="previewForwardUrl"&gt;
 *             &lt;value&gt;
 *                 /preview
 *             &lt;/value&gt;
 *         &lt;/property&gt;
 *         &lt;property name="submittedRedirectUrl"&gt;
 *             &lt;value&gt;
 *                 /submitted?${memberId}.jpeg
 *             &lt;/value&gt;
 *         &lt;/property&gt;
 *         &lt;property name="targetImageLeftCornerXParameterName"&gt;
 *             &lt;value&gt;
 *                 10
 *             &lt;/value&gt;
 *         &lt;/property&gt;
 *         &lt;property name="targetImageLeftCornerYParameterName"&gt;
 *             &lt;value&gt;
 *                 10
 *             &lt;/value&gt;
 *         &lt;/property&gt;
 *         &lt;property name="targetImageRightCornerXParameterName"&gt;
 *             &lt;value&gt;
 *                 10
 *             &lt;/value&gt;
 *         &lt;/property&gt;
 *         &lt;property name="targetImageRightCornerYParameterName"&gt;
 *             &lt;value&gt;
 *                 10
 *             &lt;/value&gt;
 *         &lt;/property&gt;
 *         &lt;property name="maxFileSize"&gt;
 *             &lt;value&gt;
 *                 100000000000
 *             &lt;/value&gt;
 *         &lt;/property&gt;
 *         &lt;property name="maxFileExceededErrorName"&gt;
 *             &lt;value&gt;
 *                 max_File_Exceeded_Error_Name
 *             &lt;/value&gt;
 *         &lt;/property&gt;
 *         &lt;property name="submittedActionParameterName"&gt;
 *             &lt;value&gt;
 *                 submit_action
 *             &lt;/value&gt;
 *         &lt;/property&gt;
 *         &lt;property name="photoImageCropDirectory"&gt;
 *             &lt;value&gt;
 *                 test_files/crop
 *             &lt;/value&gt;
 *         &lt;/property&gt;
 *         &lt;property name="memberPhotoManager" ref="memberPhotoManager" /&gt;
 *     &lt;/bean&gt;
 *     &lt;bean id="memberPhotoManager" class="com.topcoder.web.memberphoto.servlet.MockMemberPhotoManagerImpl"&gt;
 *     &lt;/bean&gt;
 * &lt;/beans&gt;
 * </pre>
 * <p>
 * 2.API usage.
 * </p>
 *
 * <pre>
 * Resource rs = new ClassPathResource(conf_file);
 * BeanFactory factory = new XmlBeanFactory(rs);
 * MemberPhotoUploadServlet bean = (MemberPhotoUploadServlet) factory.getBean(&quot;uploadServlet&quot;);
 * return bean;
 * </pre>
 *
 * </p>
 * <p>
 * <strong>Thread safety:</strong> The injected instance variables are immutable after injection. So this
 * class is thread-safe when serving user requests.
 * </p>
 * @author AleaActaEst, microsky, pvmagacho
 * @version 2.0
 */
@SuppressWarnings("serial")
//@Transactional
public class MemberPhotoUploadServlet extends HttpServlet {
    /**
     * <p>
     * Constant for image file post-fix.
     * </p>
     */
    private String imagepostfix = ".jpeg";

    /**
     * <p>
     * Represents the request form file name for photo image.
     * </p>
     * <p>
     * It's injected by the Spring.
     * </p>
     * <p>
     * After injection, it must be non-null, non-empty string.
     * </p>
     */
    private String photoImageFormFileName;

    /**
     * <p>
     * Represents the <code>MemberPhotoManager</code> to manage the member photo.
     * </p>
     * <p>
     * It's injected by the Spring.
     * </p>
     * <p>
     * After injection, it must be non-null.
     * </p>
     */
    private MemberPhotoManager memberPhotoManager;

    /**
     * <p>
     * Represent the target image width. Measured in pixels.
     * </p>
     * <p>
     * It's injected by the Spring.
     * </p>
     * <p>
     * After injection, it must be positive.
     * </p>
     */
    private int targetImageWidth;
    /**
     * <p>
     * Represent the target image height. Measured in pixels.
     * </p>
     * <p>
     * It's injected by the Spring.
     * </p>
     * <p>
     * After injection, it must be positive.
     * </p>
     */
    private int targetImageHeight;
    /**
     * <p>
     * Represent the target image's left upper corner X coordinate parameter name which will be used to get
     * the input data from JCrop.
     * </p>
     * <p>
     * (the data will be measured in pixels. )
     * </p>
     * <p>
     * It's injected by the Spring.
     * </p>
     * <p>
     * After injection, it must be non-null
     * </p>
     */
    private String targetImageLeftCornerXParameterName;
    /**
     * <p>
     * Represent the target image's left upper corner Y coordinate parameter name which will be used to get
     * the input data from JCrop.
     * </p>
     * <p>
     * (the data will be measured in pixels. )
     * </p>
     * <p>
     * It's injected by the Spring.
     * </p>
     * <p>
     * After injection, it must be non-null
     * </p>
     */
    private String targetImageLeftCornerYParameterName;
    /**
     * <p>
     * Represent the target image's right lower corner X coordinate parameter name which will be used to get
     * the input data from JCrop.
     * </p>
     * <p>
     * (the data will be measured in pixels. )
     * </p>
     * <p>
     * It's injected by the Spring.
     * </p>
     * <p>
     * After injection, it must be non-null
     * </p>
     */
    private String targetImageRightCornerXParameterName;
    /**
     * <p>
     * Represent the target image's right lower corner Y coordinate parameter name which will be used to get
     * the input data from JCrop.
     * </p>
     * <p>
     * (the data will be measured in pixels. )
     * </p>
     * <p>
     * It's injected by the Spring.
     * </p>
     * <p>
     * After injection, it must be non-null
     * </p>
     */
    private String targetImageRightCornerYParameterName;

    /**
     * <p>
     * Represent the directory to store the submitted photo images.
     * </p>
     * <p>
     * It's injected by the Spring.
     * </p>
     * <p>
     * After injection, it must be non-null, non-empty string.
     * </p>
     */
    private String photoImageSubmittedDirectory;

    /**
     * <p>
     * Represent the directory to store the preview photo images.
     * </p>
     * <p>
     * It's injected by the Spring.
     * </p>
     * <p>
     * After injection, it must be non-null, non-empty string.
     * </p>
     */
    private String photoImagePreviewDirectory;

    /**
     * <p>
     * Represent the request attribute name for the preview image path.
     * </p>
     * <p>
     * It's injected by the Spring.
     * </p>
     * <p>
     * After injection, it must be non-null, non-empty string.
     * </p>
     */
    private String previewPhotoImagePathName;
    
    /**
     * <p>
     * Represent the url to forward to if the operation succeeds and the submitted action is "preview"
     * </p>
     * <p>
     * It's injected by the Spring.
     * </p>
     * <p>
     * After injection, it must be non-null, non-empty string.
     * </p>
     */
    private String previewForwardUrl;
    
    /**
     * <p>
     * Represent the url to forward to if the operation succeeds and the submitted action is "submit"
     * </p>
     * <p>
     * It's injected by the Spring.
     * </p>
     * <p>
     * After injection, it must be non-null, non-empty string.
     * </p>
     */
    private String submitForwardUrl;

    /**
     * <p>
     * Represent the namespace to create the <code>MemoryFileUpload</code>.
     * </p>
     * <p>
     * It's injected by the Spring.
     * </p>
     * <p>
     * After injection, it must be non-null, non-empty string.
     * </p>
     */
    private String fileUploaderNamespace;

    /**
     * <p>
     * Represent the configured maximum file size (in bytes)
     * </p>
     * <p>
     * It's injected by the Spring.
     * </p>
     * <p>
     * After injection, it must be a positive number representing max number of bytes allowed.
     * </p>
     */
    private long maxFileSize;

    /**
     * <p>
     * Represents the request parameter name for submitted action name.
     * </p>
     * <p>
     * It's injected by the Spring.
     * </p>
     * <p>
     * After injection, it must be non-null, non-empty string.
     * </p>
     */
    private String submittedActionParameterName;
    /**
     * <p>
     * This is a logger which will be used to perform logging operations.
     * </p>
     * <p>
     * It's created upon initialization with the class name of this class as the logger name.
     * </p>
     * <p>
     * After injection, it must be non-null, non-empty string.
     * </p>
     */
    private Log log;
    
    /**
     * The path of server folder, used as prefix of photo stored folder. 
     */
    private String serverPathPrefix = "";

    /**
     * <p>
     * The factory to create EntityManager objects.
     * </p>
     * 
     * @since 2.0
     */
    private final EntityManagerFactory emf;
    
    /**
     * The entity manager.
     */
    private EntityManager entityManager;
    
    /**
     * <p>
     * Constructor.
     * </p>
     */
    public MemberPhotoUploadServlet() {
        this.log = LogManager.getLog();
        
        // configure the EntityManager:
        emf = Persistence.createEntityManagerFactory("memberPhotoManager");
    }

    /**
     * <p>
     * It allows web site members to upload their photos.
     * </p>
     *
     * <p>
     * Version 2.0 Changes<br>
     * 1. The GIF image format is now being handled in this version. This affects processing and validation<br>
     * 2. Size of the uploaded image is checked against a configured upper limit (in bytes)<br>
     * 3. There are three distinct actions now of "preview", "commit", and "crop"<br>
     * 4. width and height parameter now come from external source through<br>
     * 5. Image is now saved with file's name only. Paths are injected using spring.
     * </p>
     *
     * @param response the response.
     * @param request the request.
     * @throws IllegalArgumentException if any arg is null.
     * @throws IllegalStateException if the instance variables are not injected
     *             correctly (refer to each variable's constraint in its
     *             documentation).
     * @throws IOException if any i/o error occurs.
     * @throws MemberPhotoUploadException if any unexpected error occurs. (it's
     *             used to wrap all underlying exceptions).
     */
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException,
        MemberPhotoUploadException {
        logMsg(MessageFormat.format("{0} : Entering " + "MemberPhotoManagerImpl#doPost"
            + "(HttpServletRequest, HttpServletResponse)" + " - request {1}, response {2},", new Date(),
            request, response));
        try {
            // 'request' should not be null
            Helper.checkNull(request, "request");
            
            // 'response' should not be null
            Helper.checkNull(response, "response");
            try {
                entityManager = emf.createEntityManager();

                MemberPhotoDAO memberPhotoDAO = new JPAMemberPhotoDAO(entityManager);
                memberPhotoManager = new MemberPhotoManagerImpl(memberPhotoDAO);

                checkState();

                // get submitted action from request
                String submittedAction = request.getParameter(submittedActionParameterName);
                
                if ((submittedAction == null)
                        || (!submittedAction.equals("preview") && !submittedAction
                                .equals("commit"))) {
                    submittedAction = "preview";
                }
                
                // get memberId from session
                long memberId = Helper.getUserId(request);
                User user = null;
                try
                {
                    Helper.beginCommunication(request);
                    user = DAOUtil.getFactory().getUserDAO().find(memberId);
                }
                catch (Exception ee)
                {   
                     throw new MemberPhotoRemovalException("Error occurs while removing photo." + ee, ee);
                }
                finally
                {
                    Helper.endCommunication(request);
                }
     
                String imageFileName = user.getHandle() + imagepostfix;
                
                // determine the action for image storing
                if (submittedAction.equals("preview")) {
                    // get the uploaded file.
                    MemoryFileUpload fileUploader = new MemoryFileUpload(fileUploaderNamespace);
                    FileUploadResult fileUploadResult = fileUploader.uploadFiles(request);
                    
                    // get the uploaded photo
                    UploadedFile uploadedFile = fileUploadResult.getUploadedFile(photoImageFormFileName);

                    if (uploadedFile == null) {
                        throw new MemberPhotoUploadException("upload file is null.");
                    }

                    // check image file type - firefox and ie have different content types
                    String contentType = uploadedFile.getContentType();
                    if (!"image/png".equals(contentType) && !"image/x-png".equals(contentType) &&
                        !"image/gif".equals(contentType) &&                    	
                    	!"image/jpeg".equals(contentType) && !"image/pjpeg".equals(contentType)) {
                        throw new MemberPhotoUploadException("The image format (" + contentType + ") is not supported.");
                    }
                    if ("image/png".equals(contentType) || "image/x-png".equals(contentType)) {
                        imagepostfix = ".png";
                    }
                    if ("image/gif".equals(contentType)) {
                        imagepostfix = ".gif";
                    }
                    if ("image/jpeg".equals(contentType) || "image/pjpeg".equals(contentType)) {
                        imagepostfix = ".jpeg";
                    }
                    
                    // check file size
                    if (uploadedFile.getSize() > maxFileSize) {
                        throw new MemberPhotoUploadException("The uploaded file exceeds the allowable max size of "
                        	+ maxFileSize + " (bytes)");
                    }
                    
                    BufferedImage originalImage = ImageIO.read(uploadedFile.getInputStream());                   

                    // Save image to preview folder
                    logMsg(MessageFormat.format("{0} : Saving to directory : {1}", new Date(), serverPathPrefix + photoImagePreviewDirectory));
                    upLoadPicture(user.getHandle(), originalImage, serverPathPrefix + photoImagePreviewDirectory);                 
 
                    // get Path information
                    Path imagePath = null;
                    try
                    {
                        Helper.beginCommunication(request);
                        imagePath = DAOUtil.getFactory().getPathDAO().find(Image.MEMBER_PHOTO_PREVIEW_PATH_ID);
                    }
                    catch (Exception ee)
                    {   
                         throw new MemberPhotoRemovalException("Error occurs while removing photo." + ee, ee);
                    }
                    finally
                    {
                        Helper.endCommunication(request);
                    }
                    //Path imagePath = DAOUtil.getFactory().getPathDAO().find(Image.MEMBER_PHOTO_PREVIEW_PATH_ID);
                    String file = imagePath.getPath() + user.getHandle() + imagepostfix;
                    response.sendRedirect(previewForwardUrl + "&" + previewPhotoImagePathName + "=" + file
                    	+ "&originalFileName=" + uploadedFile.getRemoteFileName());
                } else if (submittedAction.equals("commit")) {
                    // retrieve crop info
                    int targetImageLeftCornerX = -1;
                    int targetImageLeftCornerY = -1;
                    int targetImageRightCornerX = -1;
                    int targetImageRightCornerY = -1;
                    try {
                        targetImageLeftCornerX = Integer.parseInt(request
                            .getParameter(targetImageLeftCornerXParameterName));
                        targetImageLeftCornerY = Integer.parseInt(request
                            .getParameter(targetImageLeftCornerYParameterName));
                        targetImageRightCornerX = Integer.parseInt(request
                            .getParameter(targetImageRightCornerXParameterName));
                        targetImageRightCornerY = Integer.parseInt(request
                            .getParameter(targetImageRightCornerYParameterName));
                    } catch (NullPointerException e) {
                        // ignore
                    } catch (NumberFormatException e) {
                        // ignore
                    }
                    
                    String previewFile = request.getParameter(previewPhotoImagePathName);
                    String fullPathFile = serverPathPrefix + photoImagePreviewDirectory + previewFile.substring(previewFile.lastIndexOf("/") + 1);
                    BufferedImage originalImage = ImageIO.read(new BufferedInputStream(new FileInputStream(fullPathFile)));
                    BufferedImage resizedImage;
                    
                    int imageWidth = originalImage.getWidth();
                    int imageHeight = originalImage.getHeight();

                    if ((imageWidth == 0) || (imageHeight == 0)) {
                        throw new MemberPhotoUploadException("Either width or height of original image is null.");
                    }
                    
                    // crop
                    if (targetImageLeftCornerX != -1 && targetImageLeftCornerY != -1 && targetImageRightCornerX != -1 && targetImageRightCornerY != -1) {
                        imageWidth = targetImageRightCornerX - targetImageLeftCornerX;
                        imageHeight = targetImageRightCornerY - targetImageLeftCornerY;
                        
                        // scale the image.
                        double ratio = targetImageWidth / (double) imageWidth;
                        int resizedWidth = (int) (originalImage.getWidth() * ratio);
                        int resizedHeight = (int) (originalImage.getHeight() * ratio);
                        
                        int picWidth = Integer.parseInt(request.getParameter("picWidth"));
                        int picHeight = Integer.parseInt(request.getParameter("picHeight"));
                        
                        resizedWidth = (int) (picWidth * ratio);
                        resizedHeight = (int) (picHeight * ratio);
                        
                        resizedImage = new BufferedImage(resizedWidth, resizedHeight, BufferedImage.TYPE_INT_RGB);
                        Graphics2D g2D = resizedImage.createGraphics();
                        g2D.drawImage(originalImage, 0, 0, resizedWidth, resizedHeight, null);
                        
                        int startX = (int) (targetImageLeftCornerX * ratio);
                        int startY = (int) (targetImageLeftCornerY * ratio);
                        resizedImage = resizedImage.getSubimage(startX, startY, targetImageWidth, targetImageHeight);
                        
                    } else {
                        if ((imageWidth != targetImageWidth) || (imageHeight != targetImageHeight)) {
                            // scale the image.
                            resizedImage = new BufferedImage(targetImageWidth, targetImageHeight, BufferedImage.TYPE_INT_RGB);
                            Graphics2D g2D = resizedImage.createGraphics();
                            g2D.drawImage(originalImage, 0, 0, targetImageWidth, targetImageHeight, null);
                        } else {
                            resizedImage = originalImage;
                        }
                    }

                    try {
                        // save image in database
                        entityManager.getTransaction().begin();
                        logMsg(MessageFormat.format("{0} : Uploading image for user with id {1}", new Date(), memberId));
                        memberPhotoManager.saveMemberPhoto(memberId, user.getHandle() + imagepostfix, String.valueOf(memberId));                        
                        entityManager.getTransaction().commit();
                    } catch (Exception eEmf){     
                        try {
                            entityManager.getTransaction().rollback();
                        } catch (Exception eTx) { 
                        	// ignore
                        } finally {                       	
                        	throw new MemberPhotoUploadException("Error occurs while uploading photo.", eEmf);
                        }
                    } finally {
                        entityManager.close();
                    }
                        
                    // move image from preview to submitted directory
                    logMsg(MessageFormat.format("{0} : Saving to directory : {1}", new Date(), serverPathPrefix +
                    	photoImageSubmittedDirectory));
                    upLoadPicture(user.getHandle(), resizedImage, serverPathPrefix + photoImageSubmittedDirectory);
                    
                    response.sendRedirect(submitForwardUrl);
                }

            } catch (MemberPhotoUploadException e) {
                throw e;
            } catch (ClassCastException e) {
                throw new MemberPhotoUploadException("The 'isAdministrator' is not valid boolean value.", e);
            } catch (NumberFormatException e) {
                throw new MemberPhotoUploadException("The input is not a number or is null value.", e);
            } catch (PersistenceException e) {
                throw new MemberPhotoUploadException("Error occurs while doing persistence.", e);
            } catch (FileDoesNotExistException e) {
                throw new MemberPhotoUploadException("Error occurs since file does not exist.", e);
            } catch (ServletException e) {
                throw new MemberPhotoUploadException("Servlet exception occurs.", e);
            } catch (ConfigurationException e) {
                throw new MemberPhotoUploadException("Error occurs while processing configuration.", e);
            } catch (RequestParsingException e) {
                throw new MemberPhotoUploadException("Error occurs while parsing request.", e);
            } catch (InvalidFileException e) {
                throw new MemberPhotoUploadException("Error occurs since file is invalid.", e);
            } catch (IOException e) {
                throw new MemberPhotoUploadException("Error occurs about IOException."  +e, e);
            } catch (Exception e) {
                throw new MemberPhotoUploadException("Error occurs Exception ."  +e, e);
            }
        } catch (IllegalArgumentException e) {
            throw logMsg("any arg is null", e);
        } catch (IllegalStateException e) {
            throw logMsg("the instance variables are not injected correctly", e);
        }  catch (MemberPhotoUploadException e) {
            throw logMsg("unexpected error occurs. details:" + e, e);
        } finally {
            //Helper.endCommunication(request);
            logMsg(MessageFormat.format("{0} : Exiting " + "MemberPhotoManagerImpl#doPost"
                + "(HttpServletRequest, HttpServletResponse)", new Date()));
        }
    }

    /**
     * <p>
     * Upload the picture to the server.
     * </p>
     * @param handle the handle of user.
     * @param resizedImage the resized Image.
     * @param directory to save.
     * @throws IOException if can not write the image.
     */
    private void upLoadPicture(String handle, BufferedImage resizedImage, String directory)
        throws IOException {
        File dir = new File(directory);
        if (!dir.exists()) {
            dir.mkdir();
        }
        // Store image
        String path = directory + handle + imagepostfix;
        synchronized (this) {
            ImageIO.write(resizedImage, imagepostfix.substring(1), new File(path));
        }

    }

    /**
     * <p>
     * Setter for the namesake instance variable.
     * </p>
     * @param photoImageFormFileName the photo image form file name.
     * @throws IllegalArgumentException if the argument is null or empty string.
     */
    public void setPhotoImageFormFileName(String photoImageFormFileName) {
        Helper.checkString(photoImageFormFileName, "photoImageFormFileName");
        this.photoImageFormFileName = photoImageFormFileName;
    }

    /**
     * <p>
     * Setter for the namesake instance variable.
     * </p>
     * @param submittedActionParameterName submitted action parameter name.
     * @throws IllegalArgumentException if the argument is null or empty
     *             string.
     */
    public void setSubmittedActionParameterName(String submittedActionParameterName) {
        Helper.checkString(submittedActionParameterName, "submittedActionParameterName");
        this.submittedActionParameterName = submittedActionParameterName;
    }

    /**
     * <p>
     * Setter for the namesake instance variable.
     * </p>
     * @param memberPhotoManager the MemberPhotoManager object.
     * @throws IllegalArgumentException if the argument is null
     */
    public void setMemberPhotoManager(MemberPhotoManager memberPhotoManager) {
        Helper.checkNull(memberPhotoManager, "memberPhotoManager");
        this.memberPhotoManager = memberPhotoManager;
    }

    /**
     * <p>
     * Setter for the namesake instance variable.
     * </p>
     * @param targetImageWidth target image width.
     * @throws IllegalArgumentException if the argument is not positive
     */
    public void setTargetImageWidth(int targetImageWidth) {
        checkPositive(targetImageWidth, "targetImageWidth");
        this.targetImageWidth = targetImageWidth;
    }

    /**
     * <p>
     * Setter for the namesake instance variable.
     * </p>
     * @param targetImageHeight target image height.
     * @throws IllegalArgumentException if the argument is not positive
     */
    public void setTargetImageHeight(int targetImageHeight) {
        checkPositive(targetImageHeight, "targetImageHeight");
        this.targetImageHeight = targetImageHeight;
    }

    /**
     * <p>
     * Setter for the namesake instance variable.
     * </p>
     * @param targetImageLeftCornerXParameterName target image Left corner X
     *            coordinate input parameter name
     * @throws IllegalArgumentException if the argument is null or empty string.
     */
    public void setTargetImageLeftCornerXParameterName(String targetImageLeftCornerXParameterName) {
        Helper.checkString(targetImageLeftCornerXParameterName, "targetImageLeftCornerXParameterName");
        this.targetImageLeftCornerXParameterName = targetImageLeftCornerXParameterName;
    }

    /**
     * <p>
     * Setter for the namesake instance variable.
     * </p>
     * @param targetImageLeftCornerYParameterName target image Left corner Y
     *            coordinate input parameter name
     * @throws IllegalArgumentException if the argument is null or empty string.
     */
    public void setTargetImageLeftCornerYParameterName(String targetImageLeftCornerYParameterName) {
        Helper.checkString(targetImageLeftCornerYParameterName, "targetImageLeftCornerYParameterName");
        this.targetImageLeftCornerYParameterName = targetImageLeftCornerYParameterName;
    }

    /**
     * <p>
     * Setter for the namesake instance variable.
     * </p>
     * @param targetImageRightCornerXParameterName target image Lower Right
     *            corner X coordinate input parameter
     * @throws IllegalArgumentException if the argument is null or empty string.
     */
    public void setTargetImageRightCornerXParameterName(String targetImageRightCornerXParameterName) {
        Helper.checkString(targetImageRightCornerXParameterName, "targetImageRightCornerXParameterName");
        this.targetImageRightCornerXParameterName = targetImageRightCornerXParameterName;
    }

    /**
     * <p>
     * Setter for the namesake instance variable.
     * </p>
     * @param targetImageRightCornerYParameterName target image Lower Right
     *            corner Y coordinate input parameter
     * @throws IllegalArgumentException if the argument is null or empty string.
     */
    public void setTargetImageRightCornerYParameterName(String targetImageRightCornerYParameterName) {
        Helper.checkString(targetImageRightCornerYParameterName, "targetImageRightCornerYParameterName");
        this.targetImageRightCornerYParameterName = targetImageRightCornerYParameterName;
    }

    /**
     * <p>
     * Setter for the namesake instance variable.
     * </p>
     * @param photoImageSubmittedDirectory photo image submitted directory.
     * @throws IllegalArgumentException if the argument is null or empty string.
     */
    public void setPhotoImageSubmittedDirectory(String photoImageSubmittedDirectory) {
        Helper.checkString(photoImageSubmittedDirectory, "photoImageSubmittedDirectory");
        this.photoImageSubmittedDirectory = photoImageSubmittedDirectory;
    }

    /**
     * <p>
     * Setter for the namesake instance variable.
     * </p>
     * @param photoImagePreviewDirectory photo image preview directory.
     * @throws IllegalArgumentException if the argument is null or empty string.
     */
    public void setPhotoImagePreviewDirectory(String photoImagePreviewDirectory) {
        Helper.checkString(photoImagePreviewDirectory, "photoImagePreviewDirectory");
        this.photoImagePreviewDirectory = photoImagePreviewDirectory;
    }

    /**
     * <p>
     * Setter for the namesake instance variable.
     * </p>
     * @param previewPhotoImagePathName preview photo image path name.
     * @throws IllegalArgumentException if the argument is null or empty string.
     */
    public void setPreviewPhotoImagePathName(String previewPhotoImagePathName) {
        Helper.checkString(previewPhotoImagePathName, "previewPhotoImagePathName");
        this.previewPhotoImagePathName = previewPhotoImagePathName;
    }

    /**
     * <p>
     * Setter for the namesake instance variable.
     * </p>
     * @param previewForwardUrl the preview forward URL.
     * @throws IllegalArgumentException if the argument is null or empty string.
     */
    public void setPreviewForwardUrl(String previewForwardUrl) {
        Helper.checkString(previewForwardUrl, "previewForwardUrl");
        this.previewForwardUrl = previewForwardUrl;
    }

    /**
     * <p>
     * Setter for the namesake instance variable.
     * </p>
     * @param fileUploaderNamespace the file uploader namespace.
     * @throws IllegalArgumentException if the argument is null or empty string.
     */
    public void setFileUploaderNamespace(String fileUploaderNamespace) {
        Helper.checkString(fileUploaderNamespace, "fileUploaderNamespace");
        this.fileUploaderNamespace = fileUploaderNamespace;
    }

    /**
     * <p>
     * Setter for the namesake instance variable.
     * </p>
     * s
     * @param maxFileSize the max allowed image size (in bytes)
     * @throws IllegalArgumentException if the argument is <= 0
     */
    public void setMaxFileSize(long maxFileSize) {
        checkPositive(maxFileSize, "maxFileSize");
        this.maxFileSize = maxFileSize;
    }

    /**
     * <p>
     * Check the state.
     * </p>
     * @throws IllegalStateException if the instance variables are not injected
     *             correctly (refer to each variable's constraint in its
     *             documentation).
     */
    private void checkState() {
        // check 'fileUploaderNamespace' field state
        Helper.checkState(fileUploaderNamespace, "fileUploaderNamespace");

        // check 'photoImageFormFileName' field state
        Helper.checkState(photoImageFormFileName, "photoImageFormFileName");

        // check 'targetImageWidth' field state
        checkIntState(targetImageWidth, "targetImageWidth");

        // check 'targetImageHeight' field state
        checkIntState(targetImageHeight, "targetImageHeight");

        // check 'photoImageSubmittedDirectory' field state
        Helper.checkState(photoImageSubmittedDirectory, "photoImageSubmittedDirectory");

        // check 'photoImageSubmittedDirectory' field state
        Helper.checkState(photoImagePreviewDirectory, "photoImagePreviewDirectory");

        // check 'previewPhotoImagePathName' field state
        Helper.checkState(previewPhotoImagePathName, "previewPhotoImagePathName");

        // check 'previewForwardUrl' field state
        Helper.checkState(previewForwardUrl, "previewForwardUrl");

        // check 'memberPhotoManager' field state
        checkObjectState(memberPhotoManager, "memberPhotoManager");

        // check 'targetImageLeftCornerXParameterName' field state
        checkObjectState(targetImageLeftCornerXParameterName, "targetImageLeftCornerXParameterName");

        // check 'targetImageLeftCornerYParameterName' field state
        checkObjectState(targetImageLeftCornerYParameterName, "targetImageLeftCornerYParameterName");

        // check 'targetImageRightCornerXParameterName' field state
        checkObjectState(targetImageRightCornerXParameterName, "targetImageRightCornerXParameterName");

        // check 'targetImageRightCornerYParameterName' field state
        checkObjectState(targetImageRightCornerYParameterName, "targetImageRightCornerYParameterName");

        // check 'maxFileSize' field state
        checkLongState(maxFileSize, "maxFileSize");

        // check 'submittedActionParameterName' field state
        Helper.checkState(submittedActionParameterName, "submittedActionParameterName");
        
        // check 'submitForwardUrl' field state
        Helper.checkState(submitForwardUrl, "submitForwardUrl");
    }

    /**
     * <p>
     * Checks whether an object is null, if it is, <code>IllegalStateException</code> is thrown.
     * </p>
     * @param param the integer to check
     * @param paramName the parameter name
     * @throws IllegalStateException if the object is null
     */
    private void checkObjectState(Object param, final String paramName) {
        if (param == null) {
            throw new IllegalStateException("The parameter '" + paramName + "' should not be null.");
        }
    }

    /**
     * <p>
     * Checks whether a integer is positive, if it is not, <code>IllegalStateException</code> is thrown.
     * </p>
     * @param param the integer to check
     * @param paramName the parameter name
     * @throws IllegalStateException if the integer is not positive
     */
    private void checkIntState(int param, final String paramName) {
        if (param <= 0) {
            throw new IllegalStateException("The parameter '" + paramName + "' should be positive.");
        }
    }

    /**
     * <p>
     * Checks whether a integer is positive, if it is not, <code>IllegalStateException</code> is thrown.
     * </p>
     * @param param the long to check
     * @param paramName the parameter name
     * @throws IllegalStateException if the integer is not positive
     */
    private void checkLongState(long param, final String paramName) {
        if (param <= 0) {
            throw new IllegalStateException("The parameter '" + paramName + "' should be positive.");
        }
    }

    /**
     * <p>
     * Checks whether a integer is positive, if it is not, <code>IllegalArgumentException</code> is thrown.
     * </p>
     * @param param the integer to check
     * @param paramName the parameter name
     * @throws IllegalArgumentException if the integer is not positive
     */
    private void checkPositive(int param, final String paramName) {
        if (param <= 0) {
            throw new IllegalArgumentException("The parameter '" + paramName + "' should be positive.");
        }
    }

    /**
     * <p>
     * Checks whether a integer is positive, if it is not, <code>IllegalArgumentException</code> is thrown.
     * </p>
     * @param param the long to check
     * @param paramName the parameter name
     * @throws IllegalArgumentException if the integer is not positive
     */
    private void checkPositive(long param, final String paramName) {
        if (param <= 0) {
            throw new IllegalArgumentException("The parameter '" + paramName + "' should be positive.");
        }
    }

    /**
     * Logs the INFO message.
     * @param message
     *            the message to log.
     */
    private void logMsg(String message) {
        if (log != null) {
            log.log(Level.INFO, message);
        }
    }

    /**
     * Logs the ERROR message.
     * @param <T>
     *            the error type.
     * @param message
     *            the message to log.
     * @param e
     *            the error
     * @return the passed in exception.
     */
    private <T extends Throwable> T logMsg(String message, T e) {
        if (log != null) {
            log.log(Level.ERROR, e, message);
        }
        return e;
    }

    /**
     * Set the serverPathPrefix field.
     *
     * @param serverPathPrefix the serverPathPrefix to set
     */
    public void setServerPathPrefix(String serverPathPrefix) {
        this.serverPathPrefix = serverPathPrefix;
    }

    /**
     * Set the submitForwardUrl field.
     *
     * @param submitForwardUrl the submitForwardUrl to set
     */
    public void setSubmitForwardUrl(String submitForwardUrl) {
        this.submitForwardUrl = submitForwardUrl;
    }
}
