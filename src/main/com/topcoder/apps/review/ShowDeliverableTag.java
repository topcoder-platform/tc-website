/**
 * Copyright ?2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

import com.topcoder.apps.review.projecttracker.*;
import com.topcoder.util.format.DateFormatMethod;
import com.topcoder.util.format.FormatMethodFactory;
import org.apache.struts.util.RequestUtils;
import org.apache.struts.util.ResponseUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * <p>
 * Generate a URL-encoded hyperlink to the a URL according to the
 * current phase and user role, plus optional query parameters that
 * select the specified project object. If no body text provided,
 * the project.getPhase() and project.getUserRoles() will be used
 * to generate the text.
 * </p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */
public class ShowDeliverableTag extends BaseTag {

    // ----------------------------------------------------- Instance Variables

    /**
     * The attribute name.
     */
    private String name = Constants.PROJECT_KEY;

    /**
     * Name of the property to be accessed on the specified bean.
     */
    protected String property = null;

    /**
     * The attribute link.
     */
    private boolean link = false;

    /**
     * The attribute button.
     */
    private boolean button = false;

    /**
     * The attribute date.
     */
    private boolean date = false;

    /**
     * The attribute of CSS stylesheet class .
     */
    private String styleClass = null;

    /**
     * The formater for the date.
     */
    private DateFormatMethod dateFormatter =
            FormatMethodFactory.getDefaultDateFormatMethod(Constants.DATE_FORMAT);

    // ------------------------------------------------------------- Properties

    /**
     * Return the attribute name.
     *
     * @return the attribute name.
     */
    public String getName() {
        return (this.name);
    }

    /**
     * Set the attribute name.
     *
     * @param name The new attribute name
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * Return the attribute property.
     *
     * @return the attribute property.
     */
    public String getProperty() {
        return (this.property);
    }

    /**
     * Set the attribute property.
     *
     * @param property The new attribute property
     */
    public void setProperty(String property) {
        this.property = property;
    }

    /**
     * Return the attribute button.
     *
     * @return the attribute button.
     */
    public boolean getButton() {
        return (this.button);
    }

    /**
     * Set the attribute button.
     *
     * @param button The new attribute button
     */
    public void setButton(boolean button) {
        this.button = button;
    }

    /**
     * Return the attribute link.
     *
     * @return the attribute link.
     */
    public boolean getLink() {
        return (this.link);
    }

    /**
     * Set the attribute link.
     *
     * @param link The new attribute link
     */
    public void setLink(boolean link) {
        this.link = link;
    }

    /**
     * Return the attribute date.
     *
     * @return the attribute date.
     */
    public boolean getDate() {
        return (this.date);
    }

    /**
     * Set the attribute date.
     *
     * @param date The new attribute date
     */
    public void setDate(boolean date) {
        this.date = date;
    }

    /**
     * Return the attribute styleClass.
     *
     * @return the attribute styleClass.
     */
    public String getStyleClass() {
        return (this.styleClass);
    }

    /**
     * Set the attribute styleClass.
     *
     * @param styleClass The new attribute styleClass
     */
    public void setStyleClass(String styleClass) {
        this.styleClass = styleClass;
    }

    // --------------------------------------------------------- Public Methods

    /**
     * Render the start of the tag.
     *
     * @return SKIP_BODY to skip the body text.
     * @exception JspException if a JSP exception has occurred
     */
    public int doStartTag() throws JspException {
        HttpServletRequest request = (HttpServletRequest) pageContext.getRequest();
        HttpServletResponse response = (HttpServletResponse) pageContext.getResponse();
        Object obj = RequestUtils.lookup(pageContext, name, property, null);
        User user = (User) RequestUtils.lookup(pageContext, Constants.USER_KEY, null);
        UtilityBean utility = (UtilityBean) RequestUtils.lookup(pageContext, Constants.UTILITY_KEY, null);
        StringBuffer result = new StringBuffer("");
        List pages = new ArrayList();
        List texts = new ArrayList();
        long projectId = 0;
        Date endDate = null;

        if (obj == null || user == null || utility == null) {
            // Nothing to output
            return (SKIP_BODY);
        } else {
            // Get the deliverables
            BusinessDelegate businessDelegate = new BusinessDelegate();
            boolean isWinner = false;
            boolean isAdmin = utility.getAdmin();
            boolean isAggregator = false;
            UserRole[] roles = null;
            Phase phase = null;
            long typeId;

            // Find out the information
            if (obj instanceof Project) {
                Project project = (Project) obj;
                phase = project.getCurrentPhase();
                roles = project.getParticipants();
                isWinner = user.equals(project.getWinner());
                projectId = project.getId();
                for (int i = 0; i < project.getTimeline().length; i++) {
                    if (project.getTimeline()[i].getPhase().getId() == phase.getId()) {
                        endDate = project.getTimeline()[i].getEndDate();
                        break;
                    }
                }
                typeId = project.getProjectType().getId();
            } else {
                UserProjectInfo info = (UserProjectInfo) obj;
                phase = info.getCurrentPhaseInstance().getPhase();
                roles = info.getUserRoles();
                isWinner = user.equals(info.getWinner());
                projectId = info.getId();
                endDate = info.getCurrentPhaseInstance().getEndDate();
                typeId = info.getProjectType().getId();
            }

            for (int i = 0; i < roles.length; i++) {
                if (user.equals(roles[i].getUser()) && roles[i].getRole().getId() == Constants.ROLE_AGGREGATOR) {
                    isAggregator = true;
                }
            }

            for (int i = 0; i < roles.length; i++) {
                UserRole userRole = roles[i];
                if (user.equals(userRole.getUser())) {
                    long roleId = userRole.getRole().getId();
                    String[] deliverables = businessDelegate.getDeliverable(phase, roleId, isWinner, isAdmin,
                            button || link, utility.getNotice() == null,
                            typeId, isAggregator, utility.getSubmitted());
                    if (deliverables != null) {
                        for (int j = 0; j < deliverables.length; j += 2) {
                            texts.add(deliverables[j]);
                            pages.add(deliverables[j + 1]);
                        }
                    }
                }
            }

            if (isAdmin && texts.size() == 0) {
                String[] deliverables =
                        businessDelegate.getDeliverable(phase, 0, isWinner, isAdmin, button || link,
                                utility.getNotice() == null, typeId, isAggregator, false);
                if (deliverables != null) {
                    for (int j = 0; j < deliverables.length; j += 2) {
                        texts.add(deliverables[j]);
                        pages.add(deliverables[j + 1]);
                    }
                }
            }
        }

        if (pages.size() == 0) {
            return (SKIP_BODY);  // Nothing to output
        }

        for (int i = 0; i < pages.size(); i++) {
            // Generate the URL
            StringBuffer url = new StringBuffer(request.getContextPath());
            url.append(pages.get(i));
            if (pages.get(i).toString().indexOf("?") < 0) {
                url.append("?");
            } else {
                url.append("&");
            }
            url.append(Constants.ID_KEY + "=");
            url.append(projectId);

            if (link) {
                // Generate the hyperlink element
                result.append("<a href=\"");
                result.append(response.encodeURL(url.toString()));
                if (styleClass != null) {
                    result.append(" class=\"" + styleClass + "\"");
                }
                result.append("\">");
                result.append(texts.get(i) + "</a>");
            } else if (button) {
                // Generate the button
                result.append("<input type=\"button\" ");
                result.append("onClick='document.location=\"");
                result.append(response.encodeURL(url.toString()));
                result.append("\"' value=\"");
                result.append(texts.get(i));
                result.append("\"");
                if (styleClass != null) {
                    result.append(" class=\"" + styleClass + "\"");
                }
                result.append(">");
                if (pages.size() > 4 && i == pages.size() / 2) {
                    result.append("<br>");
                }
            } else {
                result.append(texts.get(i) + "<br>");
                if (date) {
                    result.append(dateFormatter.format(endDate));
                    result.append("<br>");
                }
            }
        }

        // Print this result to our output writer, no filtered
        ResponseUtils.write(pageContext, result.toString());

        return (SKIP_BODY);
    }

    /**
     * Release any acquired resources.
     */
    public void release() {
        super.release();
        this.name = Constants.PROJECT_KEY;
        this.button = false;
        this.link = false;
        this.date = false;
        this.styleClass = null;
    }
}
