/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.memberphoto.servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.MessageFormat;
import java.util.Date;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.topcoder.configuration.ConfigurationAccessException;
import com.topcoder.configuration.ConfigurationObject;
import com.topcoder.configuration.persistence.ConfigurationFileManager;
import com.topcoder.configuration.persistence.ConfigurationParserException;
import com.topcoder.configuration.persistence.NamespaceConflictException;
import com.topcoder.configuration.persistence.UnrecognizedFileTypeException;
import com.topcoder.configuration.persistence.UnrecognizedNamespaceException;
import com.topcoder.json.object.JSONObject;
import com.topcoder.message.email.AddressException;
import com.topcoder.message.email.EmailEngine;
import com.topcoder.message.email.SendingException;
import com.topcoder.message.email.TCSEmailMessage;
import com.topcoder.util.config.ConfigManagerException;
import com.topcoder.util.file.DocumentGenerator;
import com.topcoder.util.file.DocumentGeneratorConfigurationException;
import com.topcoder.util.file.DocumentGeneratorFactory;
import com.topcoder.util.file.Template;
import com.topcoder.util.file.TemplateDataFormatException;
import com.topcoder.util.file.TemplateFormatException;
import com.topcoder.util.file.templatesource.TemplateSourceException;
import com.topcoder.util.log.Level;
import com.topcoder.util.log.Log;
import com.topcoder.util.log.LogManager;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.User;
import com.topcoder.web.memberphoto.entities.Image;
import com.topcoder.web.memberphoto.manager.MemberPhotoDAO;
import com.topcoder.web.memberphoto.manager.MemberPhotoManagementException;
import com.topcoder.web.memberphoto.manager.MemberPhotoManager;
import com.topcoder.web.memberphoto.manager.MemberPhotoManagerImpl;
import com.topcoder.web.memberphoto.manager.MemberPhotoNotFoundException;
import com.topcoder.web.memberphoto.manager.persistence.JPAMemberPhotoDAO;

/**
 * <p>
 * This class extends the <code>HttpServlet</code>, and it allows web site administrators to remove particular
 * member photos. After the photo is removed, an notification email will be sent to user via <code>Email
 * Engine</code>, whose email body is generated from a template using the <strong>Document Generator</strong>.
 * </p>
 * <p>
 * It will also retrieve the necessary member information for the email body from the
 * MemberInformationRetriever. The <code>MemberPhotoManager</code> is used to remove the photo in persistence,
 * and get the image file in order to remove it from local file system. It will validated the submitted form
 * data, if validation fails, it will forward to a configured validation error URL, and if everything goes
 * well, it will forward to a configured success URL.
 * </p>
 * <p>
 * File processing should be synchronized since multiple servlets may access the same file concurrently.
 * </p>
 * <p>
 * Version 2.0 changes<br>
 * 1. Logging has been added<br>
 * 2. The ability to turn the email notification on and off has been added<br>
 * 3. a directory for removed images has been added where the removed images will be stored.
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
 *     &lt;bean id="removalServlet" class="com.topcoder.web.memberphoto.servlet.MemberPhotoRemovalServlet"&gt;
 *         &lt;property name="memberIdParameterName"&gt;
 *             &lt;value&gt;
 *                 member_id
 *             &lt;/value&gt;
 *         &lt;/property&gt;
 *         &lt;property name="removalReasonParameterName"&gt;
 *             &lt;value&gt;
 *                 removal_reason
 *             &lt;/value&gt;
 *         &lt;/property&gt;
 *         &lt;property name="isAdministratorSessionKey"&gt;
 *             &lt;value&gt;
 *                 is_admin_session_key
 *             &lt;/value&gt;
 *         &lt;/property&gt;
 *         &lt;property name="notAdministratorErrorName"&gt;
 *             &lt;value&gt;
 *                 not_admin_error_name
 *             &lt;/value&gt;
 *         &lt;/property&gt;
 *         &lt;property name="validationErrorForwardUrl"&gt;
 *             &lt;value&gt;
 *                 validation_error_forward_url
 *             &lt;/value&gt;
 *         &lt;/property&gt;
 *         &lt;property name="memberHasNoPhotoErrorName"&gt;
 *             &lt;value&gt;
 *                 member_has_no_photo_error_name
 *             &lt;/value&gt;
 *         &lt;/property&gt;
 *         &lt;property name="emailBodyTemplateFileName"&gt;
 *             &lt;value&gt;
 *                 test_files/template.txt
 *             &lt;/value&gt;
 *         &lt;/property&gt;
 *         &lt;property name="fromEmailAddress"&gt;
 *             &lt;value&gt;
 *                 test@topcoder.com
 *             &lt;/value&gt;
 *         &lt;/property&gt;
 *         &lt;property name="emailSubject"&gt;
 *             &lt;value&gt;
 *                 MySubject
 *             &lt;/value&gt;
 *         &lt;/property&gt;
 *         &lt;property name="successResultForwardUrl"&gt;
 *             &lt;value&gt;
 *                 success_result_forward_url
 *             &lt;/value&gt;
 *         &lt;/property&gt;
 *         &lt;property name="emailSendFlag"&gt;
 *             &lt;value&gt;
 *                 true
 *             &lt;/value&gt;
 *         &lt;/property&gt;
 *         &lt;property name="photoImageRemovedDirectory"&gt;
 *             &lt;value&gt;
 *                 removed
 *             &lt;/value&gt;
 *         &lt;/property&gt;
 *         &lt;property name="photoImageSubmittedDirectory"&gt;
 *             &lt;value&gt;
 *                 test_files/submitted
 *             &lt;/value&gt;
 *         &lt;/property&gt;
 *         &lt;property name="documentGenerator" ref="documentGenerator" /&gt;
 *         &lt;property name="memberPhotoManager" ref="memberPhotoManager" /&gt;
 *         &lt;property name="memberInformationRetriever" ref="memberInformationRetriever"
 *         /&gt;
 *     &lt;/bean&gt;
 *     &lt;bean id="documentGenerator" class="com.topcoder.util.file.DocumentGenerator"&gt;
 *         &lt;constructor-arg value="test_namespace" /&gt;
 *     &lt;/bean&gt;
 *     &lt;bean id="memberPhotoManager" class="com.topcoder.web.memberphoto.servlet.MockMemberPhotoManagerImpl"&gt;
 *     &lt;/bean&gt;
 *     &lt;bean id="memberInformationRetriever"
 *     class="com.topcoder.web.memberphoto.servlet.MockMemberInformationRetrieverImpl"&gt;
 *     &lt;/bean&gt;
 * &lt;/beans&gt;
 * </pre>
 * <p>
 * 2.API usage.
 * </p>
 *
 * <pre>
 * Resource rs = new ClassPathResource(conf_file;);
 * BeanFactory factory = new XmlBeanFactory(rs);
 * MemberPhotoRemovalServlet bean =
 *         (MemberPhotoRemovalServlet) factory.getBean(&quot;removalServlet&quot;);
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
public class MemberPhotoRemovalServlet extends HttpServlet {

    /**
     * The path of default configuration file, should not change. 
     */
    private static String CONFIGURATION_FILE = "com/topcoder/util/config/ConfigManager.properties";

    /**
     * The namespace of document generator.
     */
    private static String DOCUMENT_NAMESPACE = "com.topcoder.util.file";
    
    /**
     * <p>
     * Represents the request parameter name for removal reason.
     * </p>
     * <p>
     * It's injected by the Spring.
     * </p>
     * <p>
     * After injection, it must be non-null, non-empty string.
     * </p>
     */
    private String removalReasonParameterName;
    
    /**
     * <p>
     * Represents the request attribute name of the error message if the member has no photo.
     * </p>
     * <p>
     * It's injected by the Spring.
     * </p>
     * <p>
     * After injection, it must be non-null, non-empty string.
     * </p>
     */
    private String memberHasNoPhotoErrorName;

    /**
     * <p>
     * Represents the session key for the isAdministrator flag, which indicating the user is an administrator
     * or not.
     * </p>
     * <p>
     * It's injected by the Spring.
     * </p>
     * <p>
     * After injection, it must be non-null, non-empty string.
     * </p>
     */
    @SuppressWarnings("unused")
    private String isAdministratorSessionKey;

    /**
     * <p>
     * Represents the request attribute name of the error message if the user is not an administrator.
     * </p>
     * <p>
     * It's injected by the Spring.
     * </p>
     * <p>
     * After injection, it must be non-null, non-empty string.
     * </p>
     */
    private String notAdministratorErrorName;

    /**
     * <p>
     * Represent the url to forward to if the validation error occurs.
     * </p>
     * <p>
     * It's injected by the Spring.
     * </p>
     * <p>
     * After injection, it must be non-null, non-empty string.
     * </p>
     */
    private String validationErrorForwardUrl;

    /**
     * <p>
     * Represents the document generator to generate the email body from template.
     * </p>
     * <p>
     * It's injected by the Spring.
     * </p>
     * <p>
     * After injection, it must be non-null.
     * </p>
     */
    private DocumentGenerator documentGenerator;

    /**
     * <p>
     * Represent the from email address of the notification email.
     * </p>
     * <p>
     * It's injected by the Spring.
     * </p>
     * <p>
     * After injection, it must be non-null, non-empty string.
     * </p>
     */
    private String fromEmailAddress;

    /**
     * <p>
     * Represent the subject of the notification email.
     * </p>
     * <p>
     * It's injected by the Spring.
     * </p>
     * <p>
     * After injection, it must be non-null, non-empty string.
     * </p>
     */
    private String emailSubject;

    /**
     * <p>
     * Represents the MemberPhotoManager to manage the member photo.
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
     * Represent the file containing the template data for the email body of the notification email.
     * </p>
     * <p>
     * It's injected by the Spring.
     * </p>
     * <p>
     * After injection, it must be non-null, non-empty string.
     * </p>
     */
    private String emailBodyTemplateFileName;

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
     * <p>
     * Represents the flag that controls if the email notification is sent or not.
     * </p>
     * <p>
     * It's injected by the Spring.
     * </p>
     * <p>
     * After injection, it must be boolean.
     * </p>
     */
    private boolean emailSendFlag;

    /**
     * <p>
     * Represent the directory to store the removed photo images.
     * </p>
     * <p>
     * It's injected by the Spring.
     * </p>
     * <p>
     * After injection, it must be non-null, non-empty string.
     * </p>
     */
    private String photoImageRemovedDirectory;

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
     * 
     * @since 2.0
     */
    private String photoImageSubmittedDirectory;
    
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
     * Default constructor. Initiate memberPhotoManagerFactory & documentGenerator here.
     * </p>
     */
    public MemberPhotoRemovalServlet() throws MemberPhotoRemovalException {
        this.log = LogManager.getLog();
	
        emf =  Persistence.createEntityManagerFactory("memberPhotoManager");

        try {
            ConfigurationObject configurationObject = new ConfigurationFileManager(
                    CONFIGURATION_FILE).getConfiguration(DOCUMENT_NAMESPACE)
                    .getChild(DOCUMENT_NAMESPACE);
            documentGenerator = DocumentGeneratorFactory
                    .getDocumentGenerator(configurationObject); 
        } catch (ConfigurationAccessException e) {
            throw new MemberPhotoRemovalException("Fail to intiate document generator", e);
        } catch (UnrecognizedNamespaceException e) {
            throw new MemberPhotoRemovalException("Fail to intiate document generator", e);
        } catch (ConfigurationParserException e) {
            throw new MemberPhotoRemovalException("Fail to intiate document generator", e);
        } catch (NamespaceConflictException e) {
            throw new MemberPhotoRemovalException("Fail to intiate document generator", e);
        } catch (UnrecognizedFileTypeException e) {
            throw new MemberPhotoRemovalException("Fail to intiate document generator", e);
        } catch (IOException e) {
            throw new MemberPhotoRemovalException("Fail to intiate document generator", e);
        } catch (DocumentGeneratorConfigurationException e) {
            throw new MemberPhotoRemovalException("Fail to intiate document generator", e);
        }
        
    }

    /**
     * <p>
     * It allows web site administrators to remove particular member photos.
     * </p>
     *
     * <p>
     * Version 2.0 Changes<br>
     * 1. Image is now saved with file's name only. Paths are injected using spring.
     * </p>
     *
     * @param response the response.
     * @param request the request.
     * @throws IllegalArgumentException if any arg is null.
     * @throws IllegalStateException if the instance variables are not injected
     *             correctly (refer to each variable's constraint in its
     *             documentation).
     * @throws IOException if any i/o error occurs.
     * @throws MemberPhotoRemovalException if any unexpected error occurs. (it's
     *             used to wrap all underlying exceptions).
     */
    public void doPost(HttpServletRequest request, HttpServletResponse response)
        throws MemberPhotoRemovalException, IOException {
        logMsg(MessageFormat.format("{0} : Entering " + "MemberPhotoRemovalServlet#doPost"
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

                // get memberId from request
                long memberId = Helper.getUserId(request);

                // get removal reason explanation
                String removalReason = request.getParameter(removalReasonParameterName);

                // get isAdministrator flag.
                // it's useless since for now only allow user remove his/her photo
                // but still retain for further use
                // Boolean isAdministrator = false;

                // get member photo
                Image image = memberPhotoManager.getMemberPhoto(memberId);
                if (image == null) {
                    throw new MemberPhotoUploadException("The member has no photo to remove.");
                }

                try {
                    // remove image from database
                    entityManager.getTransaction().begin();
                    logMsg(MessageFormat.format("{0} : Removing image with id {1} for user with id {2}", new Date(), 
                    	image.getId(), memberId));
                    memberPhotoManager.removeMemberPhoto(memberId, String.valueOf(memberId));                    
                    entityManager.getTransaction().commit();
                } catch (Exception eEmf){
                    try {
                        entityManager.getTransaction().rollback();
                    } catch (Exception eTx) {
                    	// ignore
                    } finally {                 	
                    	throw new MemberPhotoRemovalException("Error occurs while removing photo.", eEmf);
                    }                    
                } finally {
                    entityManager.close();
                }
                         
				// move image from submitted folder to removed folder
				synchronized (this) {
					// the design wants to add but that should be a final fix.
					// 1. get a copy of the image form the database
					// 2. remove the image from the database
					// 2. copy the image from step 1 to
					// photoImageRemovedDirectory                   
					logMsg(MessageFormat.format("{0} : Moving to directory : {1}", new Date(), serverPathPrefix +
						photoImageRemovedDirectory));
					
					move(serverPathPrefix + photoImageSubmittedDirectory + image.getFileName(),
							serverPathPrefix + photoImageRemovedDirectory + image.getFileName());
				}
					
                // get member information
                User user = null;
                try
                {
                    Helper.beginCommunication(request);
                    user = DAOUtil.getFactory().getUserDAO().find(memberId);
                }
                catch (Exception ee)
                {
                     throw new MemberPhotoRemovalException("Error occurs while finding user." + ee, ee);
                }
                finally
                {
                    Helper.endCommunication(request);
                }
                
                
                // constructor an xml string in the following format, and store
                // the
                // result into bodyTemplateData local variable.
                // <data>
                // <memberName>{name}</memberName>
                // <memberHandle>{handle}</memberHandle>
                // <memberId>{memberId}</memberId><
                // photoRemovalReason>{photoRemovalReason}</photoRemovalReason>
                // </data>
                StringBuilder sb = new StringBuilder();
                sb.append("<data><memberName>");
                sb.append(processStr(user.getFirstName() + " " + user.getLastName()));
                sb.append("</memberName><memberHandle>");
                sb.append(processStr(user.getHandle()));
                sb.append("</memberHandle><memberId>");
                sb.append(memberId);
                sb.append("</memberId><photoRemovalReason>");
                sb.append(processStr(removalReason));
                sb.append("</photoRemovalReason></data>");

                String bodyTemplateData = sb.toString();
                // constructor email body
                Template template = null;

                try {
                    template = documentGenerator.getTemplate("file",
                            emailBodyTemplateFileName);
                } catch (IllegalArgumentException e) {
                    throw new MemberPhotoRemovalException(
                            "Error occurs when getTemplate:template is empty.",
                            e);
                }

                String emailBody = documentGenerator.applyTemplate(template, bodyTemplateData);

                // Send notification
                if (emailSendFlag) {
                    TCSEmailMessage message = new TCSEmailMessage();
                    message.setFromAddress(fromEmailAddress);
                    message.setToAddress(user.getPrimaryEmailAddress().getAddress(), TCSEmailMessage.TO);
                    message.setSubject(emailSubject);
                    message.setBody(emailBody);
                    EmailEngine.send(message);
                }

                JSONObject json = new JSONObject();
                Helper.writeJSONResult(response, json);
            } catch (MemberPhotoRemovalException e) {
                throw e;
            } catch (NumberFormatException e) {
                throw new MemberPhotoRemovalException("The input is not a number or is null value.", e);
            } catch (ClassCastException e) {
                throw new MemberPhotoRemovalException("The 'isAdministrator' is not valid boolean value.", e);
            } catch (MemberPhotoNotFoundException e) {
                throw new MemberPhotoRemovalException("Member photo not found.", e);
            } catch (MemberPhotoManagementException e) {
                throw new MemberPhotoRemovalException("Error occurs when manage member photo.", e);
            } catch (ServletException e) {
                throw new MemberPhotoRemovalException("Servlet exception occurs." +e, e);
            } catch (SecurityException e) {
                throw new MemberPhotoRemovalException("Security exception occurs.", e);
            } catch (TemplateSourceException e) {
                throw new MemberPhotoRemovalException("Template source exception occurs." + e, e);
            } catch (TemplateFormatException e) {
                throw new MemberPhotoRemovalException("Template format exception occurs.", e);
            } catch (TemplateDataFormatException e) {
                throw new MemberPhotoRemovalException("Template data format exception occurs.", e);
            } catch (AddressException e) {
                throw new MemberPhotoRemovalException("Email address is invalid.", e);
            } catch (SendingException e) {
                throw new MemberPhotoRemovalException("Error occurs while sending email.", e);
            } catch (ConfigManagerException e) {
                throw new MemberPhotoRemovalException("Error occurs about ConfigManagerException.", e);
            } catch (IOException e) {
                throw new MemberPhotoRemovalException("Error occurs about IOException."  +e, e);
            } catch (Exception e) {
                throw new MemberPhotoRemovalException("Error occurs about Exception."  +e, e);
            }
        } catch (IllegalArgumentException e) {
            throw logMsg("any arg is null", e);
        } catch (IllegalStateException e) {
            throw logMsg("the instance variables are not injected correctly", e);
        } catch (MemberPhotoRemovalException e) {
            throw logMsg("unexpected error occurs. details:" + e, e);
        } finally {
            //Helper.endCommunication(request);
            logMsg(MessageFormat.format("{0} : Exiting " + "MemberPhotoRemovalServlet#doPost"
                + "(HttpServletRequest, HttpServletResponse)", new Date()));
        }

    }

    /**
     * <p>
     * Setter for the namesake instance variable.
     * </p>
     * @param removalReasonParameterName the removal reason parameter name.
     * @throws IllegalArgumentException if the argument is null or empty string.
     */
    public void setRemovalReasonParameterName(String removalReasonParameterName) {
        Helper.checkString(removalReasonParameterName, "removalReasonParameterName");
        this.removalReasonParameterName = removalReasonParameterName;
    }

    /**
     * <p>
     * Setter for the namesake instance variable.
     * </p>
     * @param memberHasNoPhotoErrorName the member has no photo error name.
     * @throws IllegalArgumentException if the argument is null or empty string.
     */
    public void setMemberHasNoPhotoErrorName(String memberHasNoPhotoErrorName) {
        Helper.checkString(memberHasNoPhotoErrorName, "memberHasNoPhotoErrorName");
        this.memberHasNoPhotoErrorName = memberHasNoPhotoErrorName;
    }

    /**
     * <p>
     * Setter for the namesake instance variable.
     * </p>
     * @param isAdministratorSessionKey is administrator session key.
     * @throws IllegalArgumentException if the argument is null or empty string.
     */
    public void setIsAdministratorSessionKey(String isAdministratorSessionKey) {
        Helper.checkString(isAdministratorSessionKey, "isAdministratorSessionKey");
        this.isAdministratorSessionKey = isAdministratorSessionKey;
    }

    /**
     * <p>
     * Setter for the namesake instance variable.
     * </p>
     * @param notAdministratorErrorName not administrator error name.
     * @throws IllegalArgumentException if the argument is null or empty string.
     */
    public void setNotAdministratorErrorName(String notAdministratorErrorName) {
        Helper.checkString(notAdministratorErrorName, "notAdministratorErrorName");
        this.notAdministratorErrorName = notAdministratorErrorName;
    }

    /**
     * <p>
     * Setter for the namesake instance variable.
     * </p>
     * @param validationErrorForwardUrl validation error forward url.
     * @throws IllegalArgumentException if the argument is null or empty string.
     */
    public void setValidationErrorForwardUrl(String validationErrorForwardUrl) {
        Helper.checkString(validationErrorForwardUrl, "validationErrorForwardUrl");
        this.validationErrorForwardUrl = validationErrorForwardUrl;
    }

    /**
     * <p>
     * Setter for the namesake instance variable.
     * </p>
     * @param fromEmailAddress from email address.
     * @throws IllegalArgumentException if the argument is null or empty string.
     */
    public void setFromEmailAddress(String fromEmailAddress) {
        Helper.checkString(fromEmailAddress, "fromEmailAddress");
        this.fromEmailAddress = fromEmailAddress;
    }

    /**
     * <p>
     * Setter for the namesake instance variable.
     * </p>
     * @param emailSubject email subject
     * @throws IllegalArgumentException if the argument is null or empty string.
     */
    public void setEmailSubject(String emailSubject) {
        Helper.checkString(emailSubject, "emailSubject");
        this.emailSubject = emailSubject;
    }

    /**
     * <p>
     * Setter for the namesake instance variable.
     * </p>
     * @param emailBodyTemplateFileName email body template file name.
     * @throws IllegalArgumentException if the argument is null or empty string.
     */
    public void setEmailBodyTemplateFileName(String emailBodyTemplateFileName) {
        Helper.checkString(emailBodyTemplateFileName, "emailBodyTemplateFileName");
        this.emailBodyTemplateFileName = emailBodyTemplateFileName;
    }

    /**
     * <p>
     * Setter for the namesake instance variable.
     * </p>
     * @param emailSendFlag the flag that control of an email is sent or not.
     * @throws IllegalArgumentException if the argument is null .
     */
    public void setEmailSendFlag(boolean emailSendFlag) {
        Helper.checkNull(emailSendFlag, "emailSendFlag");
        this.emailSendFlag = emailSendFlag;
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
     * @param photoImageRemovedDirectory photo image removed directory.
     * @throws IllegalArgumentException if the argument is null or empty string.
     */
    public void setPhotoImageRemovedDirectory(String photoImageRemovedDirectory) {
        Helper.checkString(photoImageRemovedDirectory, "photoImageRemovedDirectory");
        this.photoImageRemovedDirectory = photoImageRemovedDirectory;
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
        // check 'removalReasonParameterName' field state
        Helper.checkState(removalReasonParameterName, "removalReasonParameterName");
        
        // check 'notAdministratorErrorName' field state
        Helper.checkState(notAdministratorErrorName, "notAdministratorErrorName");

        // check 'memberPhotoManager' field state
        checkObjectState(memberPhotoManager, "memberPhotoManager");

        // check 'memberHasNoPhotoErrorName' field state
        Helper.checkState(memberHasNoPhotoErrorName, "memberHasNoPhotoErrorName");

        // check 'validationErrorForwardUrl' field state
        Helper.checkState(validationErrorForwardUrl, "validationErrorForwardUrl");

        // check 'emailBodyTemplateFileName' field state
        Helper.checkState(emailBodyTemplateFileName, "emailBodyTemplateFileName");

        // check 'documentGenerator' field state
        checkObjectState(documentGenerator, "documentGenerator");

        // check 'fromEmailAddress' field state
        Helper.checkState(fromEmailAddress, "fromEmailAddress");

        // check 'emailSubject' field state
        Helper.checkState(emailSubject, "emailSubject");

        // check 'emailSendFlag' field state
        checkObjectState(emailSendFlag, "emailSendFlag");  

        // check 'photoImageSubmittedDirectory' field state
        Helper.checkState(photoImageSubmittedDirectory, "photoImageSubmittedDirectory");

        // check 'photoImageRemovedDirectory' field state
        Helper.checkState(photoImageRemovedDirectory, "photoImageRemovedDirectory"); 
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
     * Change null string to empty string.
     * </p>
     * @param input the input string
     * @return the processed string
     */
    private String processStr(String input) {
        if (input == null) {
            return "";
        } else {
            return input;
        }
    }

    /**
     * <p>
     * move file.
     * </p>
     * @param oldPath the old path.
     * @param newPath the new path.
     * @throws IOException when move file.
     */
    private void move(String oldPath, String newPath) throws IOException {
        InputStream is = null;
        FileOutputStream os = null;
        try {
            int byteread = 0;
            File oldFile = new File(oldPath);
            File newFile = new File(newPath);
            if (oldFile.exists()) {
                is = new FileInputStream(oldFile);
                os = new FileOutputStream(newFile);
                byte[] buffer = new byte[1444];
                while ((byteread = is.read(buffer)) != -1) {
                    os.write(buffer, 0, byteread);
                }
                is.close();
                os.close();
                oldFile.delete();
            }
        } catch (IOException e) {
            throw e;
        } finally {
            if (is != null) {
                is.close();
            }
            if (os != null) {
                os.close();
            }
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
    
}
