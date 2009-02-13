package com.topcoder.web.email.bean;

import com.topcoder.shared.ejb.EmailServices.EmailTemplate;
import com.topcoder.shared.ejb.EmailServices.EmailTemplateGroup;
import com.topcoder.shared.ejb.EmailServices.EmailTemplateGroupHome;
import com.topcoder.shared.ejb.EmailServices.EmailTemplateHome;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.email.servlet.EmailConstants;
import com.topcoder.web.email.servlet.TaskRouter;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.Serializable;
import java.util.*;

/**
 * TemplateTask.java
 *
 * Description: Task bean to add/edit/remove templates
 *
 * @author    James Lee (jameslee@cs.stanford.edu)
 * @version    1.0
 *
 */

public class TemplateTask
        implements Task, Serializable {
    private static Logger log = Logger.getLogger(TemplateTask.class);

    public TaskRouter perform(HttpServlet servlet,
                              HttpServletRequest request,
                              HttpServletResponse response)
            throws IOException, ServletException {
        String step = request.getParameter(EmailConstants.STEP);
        String nextPage = "";

        // determine the desired step
        try {
            step = step.trim();
            if (step.equals(EmailConstants.TEMPLATE_LIST)) {
                nextPage = list(request, response);
            } else if (step.equals(EmailConstants.TEMPLATE_CREATE)) {
                nextPage = create(request, response);
            } else if (step.equals(EmailConstants.TEMPLATE_ADD)) {
                nextPage = add(request, response);
            } else if (step.equals(EmailConstants.TEMPLATE_EDIT)) {
                nextPage = edit(request, response);
            } else if (step.equals(EmailConstants.TEMPLATE_SAVE)) {
                nextPage = save(request, response);
            } else if (step.equals(EmailConstants.TEMPLATE_DELETE)) {
                nextPage = delete(request, response);
            }
        } catch (Exception e) {
            log.debug("Template task error", e);
            throw new ServletException(e.toString());
        }

        // forward to the next page
        return new TaskRouter(nextPage);
    }

    /**
     * Lists all templates.
     *
     * @param request    the HttpServletRequest object
     * @param response    the HttpServletResponse object
     *
     * @return String    the URL of the next page
     */

    private String list(HttpServletRequest request, HttpServletResponse response)
            throws ServletException {
        String group = request.getParameter(EmailConstants.GROUP);
        if (group == null) {
            log.debug("No group specified - choosing first group");

            group = String.valueOf(getFirstTemplateGroupId());
        }
        request.setAttribute(EmailConstants.GROUP, group);

        log.debug("Listing templates for group: " + group);

        return EmailConstants.EMAILTEMPLATE_LIST_PAGE;
    }

    /**
     * Begins the template creation process.
     *
     * @param request    the HttpServletRequest object
     * @param response    the HttpServletResponse object
     *
     * @return String    the URL of the next page
     */

    private String create(HttpServletRequest request, HttpServletResponse response)
            throws ServletException {
        // create a new template form bean
        EmailTemplateForm template = new EmailTemplateForm();
        request.getSession().setAttribute("EmailTemplate", template);

        // clear error list
        request.setAttribute("Error", null);

        log.debug("Creating new template...");

        // forward to the template creation page
        return EmailConstants.EMAILTEMPLATE_CREATE_PAGE;
    }

    /**
     * Adds a newly created template.
     *
     * @param request    the HttpServletRequest object
     * @param response    the HttpServletResponse object
     *
     * @return String    the URL of the next page
     */

    private String add(HttpServletRequest request, HttpServletResponse response)
            throws ServletException {
        // retrieve the template to be added
        EmailTemplateForm template = (EmailTemplateForm) request.getSession().getAttribute("EmailTemplate");

        if (!template.isAdded()) {
            template.setName(request.getParameter("name"));
            template.setGroup(request.getParameter("group"));
            template.setTemplate(request.getParameter("template"));

            // validate template
            ArrayList errorList = template.validate();
            if (errorList.size() > 0) {
                // error - go back
                log.debug("Template validation failed - errors: " + errorList);

                // set error list attribute
                request.setAttribute("Error", errorList);

                // forward back to template creation page
                return EmailConstants.EMAILTEMPLATE_CREATE_PAGE;
            } else {
                log.debug("Adding template:\n" + template);

                int templateId = createTemplate(template);
                template.setId(String.valueOf(templateId));

                template.setAdded(true);

                // forward to the template list page
                return list(request, response);
            }
        } else {
            log.debug("Already added template.");

            // forward to the template list page
            return list(request, response);
        }
    }

    /**
     * Begins the template editing process.
     *
     * @param request    the HttpServletRequest object
     * @param response    the HttpServletResponse object
     *
     * @return String    the URL of the next page
     */

    private String edit(HttpServletRequest request, HttpServletResponse response)
            throws ServletException {
        int templateId;
        try {
            templateId = Integer.parseInt(request.getParameter(EmailConstants.ID));
        } catch (Exception e) {
            throw new ServletException(e.toString());
        }

        // retrieve template information
        EmailTemplateForm template = retrieveTemplate(templateId);
        request.getSession().setAttribute("EmailTemplate", template);

        // clear error list
        request.setAttribute("Error", null);

        log.debug("Editing template:\n" + template);

        // forward to the template editing page
        return EmailConstants.EMAILTEMPLATE_EDIT_PAGE;
    }

    /**
     * Saves an edited template.
     *
     * @param request    the HttpServletRequest object
     * @param response    the HttpServletResponse object
     *
     * @return String    the URL of the next page
     */

    private String save(HttpServletRequest request, HttpServletResponse response)
            throws ServletException {
        // retrieve the edited template
        EmailTemplateForm template = (EmailTemplateForm) request.getSession().getAttribute("EmailTemplate");

        int templateId;
        try {
            templateId = Integer.parseInt(template.getId());
        } catch (Exception e) {
            throw new ServletException(e.toString());
        }

        template.setName(request.getParameter("name"));
        template.setGroup(request.getParameter("group"));
        template.setTemplate(request.getParameter("template"));

        // validate template
        ArrayList errorList = template.validate();
        if (errorList.size() > 0) {
            // error - go back
            log.debug("Template validation failed - errors: " + errorList);

            // set error list parameter
            request.setAttribute("Error", errorList);

            // forward back to template creation page
            return EmailConstants.EMAILTEMPLATE_EDIT_PAGE;
        } else {
            log.debug("Saving template:\n" + template);

            saveTemplate(templateId, template);

            // forward to template display page
            return list(request, response);
        }
    }

    /**
     * Deletes a template.
     *
     * @param request    the HttpServletRequest object
     * @param response    the HttpServletResponse object
     *
     * @return String    the URL of the next page
     */

    private String delete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException {
        int templateId;
        try {
            templateId = Integer.parseInt(request.getParameter(EmailConstants.ID));
        } catch (Exception e) {
            throw new ServletException(e.toString());
        }

        log.debug("Deleting template:\n" + templateId);

        deleteTemplate(templateId);

        // forward to the template list page
        return list(request, response);
    }


    // Utilities

    /**
     * Creates a new template using properties from an EmailTemplateForm object.
     *
     * @param template    the EmailTemplateForm representing the new template
     *
     * @return int    the ID of the new template

     */

    private static int createTemplate(EmailTemplateForm template)
            throws ServletException {
        int id = -1;

        Context context = null;
        try {
            context = new InitialContext();
            EmailTemplateHome emailTemplateHome = (EmailTemplateHome) context.lookup(EmailConstants.EMAILTEMPLATE_EJB);
            EmailTemplate emailTemplate = emailTemplateHome.create();
            id = emailTemplate.createTemplate(Integer.parseInt(template.getGroup()),
                    template.getName(),
                    template.getTemplate());
        } catch (Exception e) {
            log.debug("Error adding template:\n" + template, e);
            throw new ServletException(e.toString());
        } finally {
            if (context != null) {
                try {
                    context.close();
                } catch (NamingException e) {
                }
            }
        }

        return id;
    }


    /**
     * Retrieves information about a template and returns
     * the EmailTemplateForm object representing the template.
     *
     * @param templateId        the id of the desired template
     *
     * @return EmailTemplateForm    the populated EmailTemplateForm
     */

    private static EmailTemplateForm retrieveTemplate(int templateId)
            throws ServletException {
        EmailTemplateForm template = new EmailTemplateForm();
        template.setId(String.valueOf(templateId));

        Context context = null;
        try {
            context = new InitialContext();
            EmailTemplateHome emailTemplateHome = (EmailTemplateHome) context.lookup(EmailConstants.EMAILTEMPLATE_EJB);
            EmailTemplate emailTemplate = emailTemplateHome.create();

            template.setName(emailTemplate.getTemplateName(templateId));
            template.setGroup(String.valueOf(emailTemplate.getTemplateGroupId(templateId)));
            template.setTemplate(emailTemplate.getData(templateId));

        } catch (Exception e) {
            log.debug("Error retrieving template:\n" + template, e);
            throw new ServletException(e.toString());
        } finally {
            if (context != null) {
                try {
                    context.close();
                } catch (NamingException e) {
                }
            }
        }

        return template;


    }


    /**
     * Updates a template using properties from an EmailTemplateForm object.
     *
     * @param template    the EmailTemplateForm representing the template
     */

    private static void saveTemplate(int templateId, EmailTemplateForm template)
            throws ServletException {

        Context context = null;
        try {
            context = new InitialContext();
            EmailTemplateHome emailTemplateHome = (EmailTemplateHome) context.lookup(EmailConstants.EMAILTEMPLATE_EJB);
            EmailTemplate emailTemplate = emailTemplateHome.create();

            emailTemplate.setGroupId(templateId,
                    Integer.parseInt(template.getGroup()));
            emailTemplate.setName(templateId,
                    template.getName());
            emailTemplate.setData(templateId,
                    template.getTemplate());
        } catch (Exception e) {
            log.debug("Error saving template", e);
            throw new ServletException(e.toString());
        } finally {
            if (context != null) {
                try {
                    context.close();
                } catch (NamingException e) {
                }
            }
        }

    }


    /**
     * Deletes a template by setting it's group to the deleted group
     *
     * @param templateId    the id of the template to delete
     */

    private static void deleteTemplate(int templateId)
            throws ServletException {

        Context context = null;
        try {
            context = new InitialContext();
            EmailTemplateHome emailTemplateHome = (EmailTemplateHome) context.lookup(EmailConstants.EMAILTEMPLATE_EJB);
            EmailTemplate emailTemplate = emailTemplateHome.create();

            emailTemplate.setGroupId(templateId,
                    EmailConstants.DELETED_GROUP_ID);
        } catch (Exception e) {
            log.debug("Error deleting template", e);
            throw new ServletException(e.toString());
        } finally {
            if (context != null) {
                try {
                    context.close();
                } catch (NamingException e) {
                }
            }
        }

    }

    /**
     * Returns all templates in a group mapped by id.
     *
     * @param group        desired group id
     *
     * @return Map        map of template id's to template names
     */

    public static Map getTemplateMap(int group)
            throws ServletException {
        Map templateMap;

        log.debug("Retrieving templates of group: " + group);

        Context context = null;
        try {
            context = new InitialContext();
            EmailTemplateHome emailTemplateHome = (EmailTemplateHome) context.lookup(EmailConstants.EMAILTEMPLATE_EJB);
            EmailTemplate emailTemplate = emailTemplateHome.create();
            templateMap = emailTemplate.getTemplates(group);
        } catch (Exception e) {
            log.error("Error getting template listing", e);
            throw new ServletException(e.toString());
        } finally {
            if (context != null) {

                try {
                    context.close();
                } catch (NamingException e) {
                }
            }
        }


        return templateMap;
    }


    /**
     * Returns all template groups mapped by id.
     *
     * @return Map        map of template group id's to template group names
     */

    public static Map getTemplateGroupMap()
            throws ServletException {
        Map groupMap = new HashMap();


        Context context = null;
        try {
            context = new InitialContext();
            EmailTemplateGroupHome emailTemplateGroupHome = (EmailTemplateGroupHome) context.lookup(EmailConstants.EMAILTEMPLATE_GROUP_EJB);
            EmailTemplateGroup emailTemplateGroup = emailTemplateGroupHome.create();
            groupMap = emailTemplateGroup.getGroups();
        } catch (Exception e) {
            log.error("Error getting template group listing", e);
            throw new ServletException(e.toString());
        } finally {
            if (context != null) {
                try {
                    context.close();
                } catch (NamingException e) {
                }
            }
        }

        return groupMap;
    }


    /**
     * Returns the id of the first template group (alphabetically)
     *
     * @return int    id of first template group or -1 if there are no groups
     */

    public static int getFirstTemplateGroupId()
            throws ServletException {
        // get all groups
        final Map templateGroupMap = getTemplateGroupMap();
        // get all group id's
        List groupIdList = new ArrayList(templateGroupMap.keySet());
        // sort id's by name
        Collections.sort(groupIdList, new Comparator() {
            public int compare(Object o1, Object o2) {
                Comparable c1 = (Comparable) templateGroupMap.get(o1);
                Comparable c2 = (Comparable) templateGroupMap.get(o2);
                return c1.compareTo(c2);
            }
        });
        // grab the first one
        if (groupIdList.size() > 0) {
            return ((Integer) groupIdList.get(0)).intValue();
        } else {
            return -1;
        }
    }

    public static String getTemplateName(int templateId)
            throws ServletException {
        String name = "";

        Context context = null;
        try {
            context = new InitialContext();
            EmailTemplateHome emailTemplateHome = (EmailTemplateHome) context.lookup(EmailConstants.EMAILTEMPLATE_EJB);
            EmailTemplate emailTemplate = emailTemplateHome.create();
            name = emailTemplate.getTemplateName(templateId);
        } catch (Exception e) {
            log.error("Error getting template name", e);
            throw new ServletException(e.toString());
        } finally {
            if (context != null) {
                try {
                    context.close();
                } catch (NamingException e) {
                }
            }
        }


        return name;
    }

}
