package com.topcoder.web.email.bean;

import com.topcoder.shared.ejb.EmailServices.*;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.email.servlet.EmailConstants;
import com.topcoder.web.email.servlet.TaskRouter;

import javax.naming.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.Serializable;
import java.util.*;

/**
 * Task bean to add/edit/remove address lists
 *
 * @author	James Lee (jameslee@cs.stanford.edu)
 * @version	1.0
 *
 */

public class AddressListTask
        implements Task, Serializable {
    private static Logger log = Logger.getLogger(AddressListTask.class);

    public TaskRouter perform(HttpServlet servlet,
                              HttpServletRequest request,
                              HttpServletResponse response)
            throws IOException, ServletException {
        String step = request.getParameter(EmailConstants.STEP);
        String nextPage = "";

        // determine the desired step
        try {
            step = step.trim();
            if (step.equals(EmailConstants.ADDRESSLIST_LIST)) {
                nextPage = list(request, response);
            } else if (step.equals(EmailConstants.ADDRESSLIST_CREATE)) {
                nextPage = create(request, response);
            } else if (step.equals(EmailConstants.ADDRESSLIST_ADD)) {
                nextPage = add(request, response);
            } else if (step.equals(EmailConstants.ADDRESSLIST_EDIT)) {
                nextPage = edit(request, response);
            } else if (step.equals(EmailConstants.ADDRESSLIST_SAVE)) {
                nextPage = save(request, response);
            } else if (step.equals(EmailConstants.ADDRESSLIST_DELETE)) {
                nextPage = delete(request, response);
            } else if (step.equals(EmailConstants.ADDRESSLIST_ADD_MEMBER)) {
                nextPage = addMember(request, response);
            } else if (step.equals(EmailConstants.ADDRESSLIST_EDIT_MEMBER)) {
                nextPage = editMember(request, response);
            } else if (step.equals(EmailConstants.ADDRESSLIST_SAVE_MEMBER)) {
                nextPage = saveMember(request, response);
            } else if (step.equals(EmailConstants.ADDRESSLIST_DELETE_MEMBER)) {
                nextPage = deleteMember(request, response);
            } else if (step.equals(EmailConstants.ADDRESSLIST_SHOW_ADD_MEMBER)) {
                nextPage = showAddMember(request, response);
            } else if (step.equals(EmailConstants.ADDRESSLIST_SHOW_BULK_ADD)) {
                nextPage = showBulkAdd(request, response);
            } else if (step.equals(EmailConstants.ADDRESSLIST_BULK_ADD)) {
                nextPage = bulkAdd(request, response);
            }
        } catch (Exception e) {
            throw new ServletException(e.toString());
        }

        // forward to the next page
        return new TaskRouter(nextPage);
    }

    /**
     * Displays address lists.
     *
     * @param request	the HttpServletRequest object
     * @param response	the HttpServletResponse object
     *
     * @return String	the URL of the next page
     */

    private String list(HttpServletRequest request, HttpServletResponse response)
            throws ServletException {
        String group = request.getParameter(EmailConstants.GROUP);
        if (group == null) {
            log.debug("No group specified - choosing first group");

            group = String.valueOf(getFirstAddressListGroupId());
        }
        request.setAttribute(EmailConstants.GROUP, group);

        log.debug("Listing address lists for group: " + group);

        return EmailConstants.ADDRESSLIST_LIST_PAGE;
    }

    /**
     * Begins the address list creation process.
     *
     * @param request	the HttpServletRequest object
     * @param response	the HttpServletResponse object
     *
     * @return String	the URL of the next page
     */


    private String create(HttpServletRequest request, HttpServletResponse response)
            throws ServletException {
        // create a new AddressListForm bean
        AddressListForm addressList = new AddressListForm();
        request.getSession().setAttribute("AddressList", addressList);

        // clear error list
        request.setAttribute("Error", null);

        log.debug("Creating new address list...");

        // forward to the address list creation page
        return EmailConstants.ADDRESSLIST_CREATE_PAGE;
    }

    /**
     * Adds a newly created address list.
     *
     * @param request	the HttpServletRequest object
     * @param response	the HttpServletResponse object
     *
     * @return String	the URL of the next page
     */

    private String add(HttpServletRequest request, HttpServletResponse response)
            throws ServletException {
        // retrieve the newly created address list
        AddressListForm addressList = (AddressListForm) request.getSession().getAttribute("AddressList");

        setProperties(addressList, request);

        // validate address list
        ArrayList errorList = addressList.validate();
        if (errorList.size() > 0) {
            // error - go back
            log.debug("Address list validation failed - errors: " + errorList);

            // set error list attribute
            request.setAttribute("Error", errorList);

            // forward back to address list creation page
            return EmailConstants.ADDRESSLIST_CREATE_PAGE;
        } else {
            log.debug("Adding address list:\n" + addressList);

            int id = createList(addressList);
            addressList.setId(String.valueOf(id));

            // forward to member adding page
            return showAddMember(request, response);
        }
    }

    /**
     * Begins the address list editing process.
     *
     * @param request	the HttpServletRequest object
     * @param response	the HttpServletResponse object
     *
     * @return String	the URL of the next page
     */

    private String edit(HttpServletRequest request, HttpServletResponse response)
            throws ServletException {
        int listId;
        try {
            listId = Integer.parseInt(request.getParameter(EmailConstants.ID));
        } catch (Exception e) {
            throw new ServletException(e.toString());
        }

        AddressListForm list = retrieveAddressList(listId);

        request.getSession().setAttribute("AddressList", list);

        // clear error list
        request.setAttribute("Error", null);

        log.debug("Editing address list:\n" + list);

        // forward to address list editing page
        return EmailConstants.ADDRESSLIST_EDIT_PAGE;
    }


    /**
     * Saves an edited address list.
     *
     * @param request	the HttpServletRequest object
     * @param response	the HttpServletResponse object
     *
     * @return String	the URL of the next page
     */

    private String save(HttpServletRequest request, HttpServletResponse response)
            throws ServletException {
        // retrieve the edited address list
        AddressListForm addressList = (AddressListForm) request.getSession().getAttribute("AddressList");

        setProperties(addressList, request);

        // validate address list
        ArrayList errorList = addressList.validate();
        if (errorList.size() > 0) {
            // error - go back
            log.debug("Address list validation failed - errors: " + errorList);

            // set error list attribute
            request.setAttribute("Error", errorList);

            // forward back to address list creation page
            return EmailConstants.ADDRESSLIST_CREATE_PAGE;
        } else {
            log.debug("Saving address list:\n" + addressList);

            saveAddressList(addressList);

            // clear error list
            request.setAttribute("Error", null);

            // forward to member editing page
            return showAddMember(request, response);
        }
    }


    /**
     * Shows member adding form.
     *
     * @param request	the HttpServletRequest object
     * @param response	the HttpServletResponse object
     *
     * @return String	the URL of the next page
     */

    private String showAddMember(HttpServletRequest request, HttpServletResponse response)
            throws ServletException {
        // clear out member data
        request.getSession().setAttribute("MemberData", null);



        // forward to member editing page
        return EmailConstants.ADDRESSLIST_ADD_MEMBER_PAGE;
    }


    /**
     * Deletes an address list.
     *
     * @param request	the HttpServletRequest object
     * @param response	the HttpServletResponse object
     *
     * @return String	the URL of the next page
     */

    private String delete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException {
        // retrieve the id of the list
        int listId;

        try {
            listId = Integer.parseInt(request.getParameter(EmailConstants.ID));
        } catch (Exception e) {
            throw new ServletException(e.toString());
        }

        log.debug("Deleting address list:\n" + listId);

        deleteAddressList(listId);

        // forward back to the address list page
        return list(request, response);
    }

    /**
     * Adds a new member to the current address list.  Goes back to the member
     * adding screen.
     *
     * @param request	the HttpServletRequest object

     * @param response	the HttpServletResponse object

     *
     * @return String	the URL of the next page
     */

    private String addMember(HttpServletRequest request, HttpServletResponse response)
            throws ServletException {
        // retrieve AddressListForm bean
        AddressListForm addressList = (AddressListForm) request.getSession().getAttribute("AddressList");

        MemberData memberData = new MemberData();
        setMemberProperties(memberData, request);

        // validate member data
        ArrayList errorList = memberData.validate();
        if (errorList.size() > 0) {
            // error - go back
            log.debug("Member data validation failed - errors: " + errorList);

            // set error list attribute
            request.setAttribute("Error", errorList);

            // forward to the address list member adding page
            return showAddMember(request, response);
        } else {
            int listId;
            try {
                listId = Integer.parseInt(addressList.getId());
            } catch (Exception e) {
                throw new ServletException(e.toString());
            }

            // clear error list attribute
            request.setAttribute("Error", null);

            log.debug("Adding member:\n" + memberData);

            addMember(listId, memberData);

            // forward to the address list member adding page
            return showAddMember(request, response);
        }
    }

    /**
     * Edits the specified member.
     *
     * @param request	the HttpServletRequest object
     * @param response	the HttpServletResponse object
     *
     * @return String	the URL of the next page
     */

    private String editMember(HttpServletRequest request, HttpServletResponse response)
            throws ServletException {
        // retrieve AddressListForm bean
        AddressListForm addressList = (AddressListForm) request.getSession().getAttribute("AddressList");

        int listId, memberId;
        try {
            listId = Integer.parseInt(addressList.getId());
            memberId = Integer.parseInt(request.getParameter(EmailConstants.ID));
        } catch (Exception e) {
            throw new ServletException(e.toString());
        }

        MemberData memberData = retrieveMemberData(listId, memberId);

        log.debug("editing member:\n" + memberData);

        request.getSession().setAttribute("MemberData", memberData);

        // forward to the address list member editing page
        return EmailConstants.ADDRESSLIST_EDIT_MEMBER_PAGE;
    }

    /**
     * Saves an edited member.
     *
     * @param request	the HttpServletRequest object
     * @param response	the HttpServletResponse object
     *
     * @return String	the URL of the next page
     */

    private String saveMember(HttpServletRequest request, HttpServletResponse response)
            throws ServletException {
        // retrieve AddressListForm bean
        AddressListForm addressList = (AddressListForm) request.getSession().getAttribute("AddressList");
        // retrieve MemberData bean
        MemberData memberData = (MemberData) request.getSession().getAttribute("MemberData");
        setMemberProperties(memberData, request);

        // validate member data
        ArrayList errorList = memberData.validate();
        if (errorList.size() > 0) {
            // error - go back
            log.debug("Member data validation failed - errors: " + errorList);

            // set error list attribute
            request.setAttribute("Error", errorList);

            // forward to the address list member adding page
            return showAddMember(request, response);
        } else {
            int listId;
            try {
                listId = Integer.parseInt(addressList.getId());
            } catch (Exception e) {
                throw new ServletException(e.toString());
            }

            log.debug("Saving member:\n" + memberData);

            saveMember(listId, memberData);

            // forward to the address list member adding page
            return showAddMember(request, response);
        }
    }

    /**
     * Removes a member from the address list.
     *
     * @param request	the HttpServletRequest object
     * @param response	the HttpServletResponse object
     *
     * @return String	the URL of the next page
     */

    private String deleteMember(HttpServletRequest request, HttpServletResponse response)
            throws ServletException {
        // retrieve AddressListForm bean
        AddressListForm addressList = (AddressListForm) request.getSession().getAttribute("AddressList");

        int listId, memberId;
        try {
            listId = Integer.parseInt(addressList.getId());
            memberId = Integer.parseInt(request.getParameter(EmailConstants.ID));
        } catch (Exception e) {
            throw new ServletException(e.toString());
        }

        log.debug("Deleting address list member " + memberId);

        deleteMember(listId, memberId);

        // forward to the address list member adding page
        return showAddMember(request, response);
    }

    /**
     * Shows bulk entry form.
     *
     * @param request	the HttpServletRequest object
     * @param response	the HttpServletResponse object
     *
     * @return String	the URL of the next page
     */

    private String showBulkAdd(HttpServletRequest request, HttpServletResponse response)
            throws ServletException {
        // set invalid row attribute to blank if it's null...
        String invalidRows = (String) request.getAttribute(EmailConstants.INVALID_ROWS);
        if (invalidRows == null) {
            request.setAttribute(EmailConstants.INVALID_ROWS, "");
        }

        // forward to bulk entry page
        return EmailConstants.ADDRESSLIST_BULK_ADD_PAGE;
    }

    /**
     * Bulk adds members.
     *
     * @param request	the HttpServletRequest object
     * @param response	the HttpServletResponse object
     *
     * @return String	the URL of the next page
     */

    private String bulkAdd(HttpServletRequest request, HttpServletResponse response)
            throws ServletException {
        // retrieve AddressListForm bean
        AddressListForm addressList = (AddressListForm) request.getSession().getAttribute("AddressList");

        int listId;
        try {
            listId = Integer.parseInt(addressList.getId());
        } catch (NumberFormatException e) {
            throw new ServletException(e);
        }

        // store flawed rows here
        List invalidRowList = new ArrayList();
        // error message list
        ArrayList errors = new ArrayList();

        // get field list
        List fieldList = addressList.getFields();

        // get bulk entry text
        String bulkText = request.getParameter("bulk");
        if (bulkText != null) {
            StringTokenizer st = new StringTokenizer(bulkText, EmailConstants.BULK_ROW_DELIMITER);
            // process each row
            while (st.hasMoreTokens()) {
                String row = st.nextToken();
                if (row.length() > 0) {
                    // tokenize values
                    List valueList = Utilities.tokenize(row, EmailConstants.BULK_COLUMN_DELIMITER);
                    // make sure the number of values == the number of fields
                    if (valueList.size() == fieldList.size()) {
                        MemberData memberData = new MemberData();
                        for (int i = 0; i < fieldList.size(); i++) {
                            String field = (String) fieldList.get(i);
                            String value = (String) valueList.get(i);
                            memberData.setValue(field, value);
                        }
                        // validate new member data
                        ArrayList memberErrors = memberData.validate();
                        if (memberErrors.size() == 0) {
                            log.debug("Adding member:\n " + memberData);
                            addMember(listId, memberData);
                        } else {
                            errors.addAll(memberErrors);
                            invalidRowList.add(row);
                        }
                    } else {
                        errors.add("Expected " + fieldList.size() + " value" + ((fieldList.size() > 1) ? "s" : "") + ", but found " + valueList.size());
                        invalidRowList.add(row);
                    }
                }
            }
        }

        log.debug("Invalid rows:\n" + invalidRowList);

        // set error list attribute
        request.setAttribute("Error", errors);

        // convert invalidRowList to html text
        StringBuffer invalidRowText = new StringBuffer(1000);
        for (Iterator i = invalidRowList.iterator(); i.hasNext();) {
            invalidRowText.append(i.next());
            invalidRowText.append("\n");
        }

        // set invalid row attribute
        request.setAttribute(EmailConstants.INVALID_ROWS, invalidRowText.toString());

        // forward to bulk entry page
        return showBulkAdd(request, response);
    }




    // Utilities


    /**
     * Creates a new list using properties from an AddressListForm object.
     *
     * @param addressList	the AddressListForm representing the new list
     *
     * @return int	the ID of the new list
     */

    private static int createList(AddressListForm addressList)
            throws ServletException {
        int id = -1;

        Context context = null;
        try {
            context = new InitialContext();
            EmailListHome emailListHome = (EmailListHome) context.lookup(EmailConstants.ADDRESSLIST_EJB);
            EmailList emailList = emailListHome.create();

            id = emailList.createList(Integer.parseInt(addressList.getGroup()),
                    addressList.getName());
        } catch (Exception e) {
            log.error("Error adding address list", e);
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
     * Retrieves information about an address list and returns
     * the AddressListForm object representing the list.
     *
     * @param addressListId		the id of the desired address list
     *
     * @return AddressListForm	the populated AddressListForm
     */

    private static AddressListForm retrieveAddressList(int listId)
            throws ServletException {
        AddressListForm addressList = new AddressListForm();

        addressList.setId(String.valueOf(listId));

        Context context = null;
        try {
            context = new InitialContext();
            EmailListHome emailListHome = (EmailListHome) context.lookup(EmailConstants.ADDRESSLIST_EJB);
            EmailList emailList = emailListHome.create();

            addressList.setName(emailList.getListName(listId));
            addressList.setGroup(String.valueOf(emailList.getListGroupId(listId)));

            // get fields by examining a member of the set
            Set memberSet = emailList.getMembers(listId);

            List fields = new ArrayList();
            if (memberSet.size() > 0) {
                // get fields from first member's data
                int memberID = ((Integer) memberSet.toArray()[0]).intValue();
                String memberDataString = emailList.getData(listId, memberID);
                MemberData memberData = MemberData.loadFromXML(memberDataString);
                Map fieldValueMap = memberData.getFieldValueMap();
                for (Iterator i = fieldValueMap.keySet().iterator(); i.hasNext();) {
                    fields.add(i.next());

                }
            } else {
                // if there are no members - use default of just email_address
                fields.add(EmailConstants.EMAIL_ADDRESS_TAG);
            }
            addressList.setFields(fields);

        } catch (Exception e) {
            log.error("Error retrieving address list:\n" + listId, e);
            throw new ServletException(e.toString());
        } finally {
            if (context != null) {
                try {
                    context.close();
                } catch (NamingException e) {
                }
            }
        }

        return addressList;
    }


    /**
     * Updates an address list using properties from an AddressListForm object.
     *
     * @param addressList	the AddressListForm representing the list
     */

    private static void saveAddressList(AddressListForm addressList)
            throws ServletException {

        Context context = null;
        try {
            context = new InitialContext();
            EmailListHome emailListHome = (EmailListHome) context.lookup(EmailConstants.ADDRESSLIST_EJB);
            EmailList emailList = emailListHome.create();

            emailList.setGroupId(Integer.parseInt(addressList.getId()),
                    Integer.parseInt(addressList.getGroup()));
            emailList.setName(Integer.parseInt(addressList.getId()),
                    addressList.getName());
        } catch (Exception e) {
            log.error("Error saving address list", e);
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
     * Deletes an address list by setting it's group to the deleted group
     *
     * @param listId	the id of the list to delete
     */

    private static void deleteAddressList(int listId)
            throws ServletException {

        Context context = null;
        try {
            context = new InitialContext();
            EmailListHome emailListHome = (EmailListHome) context.lookup(EmailConstants.ADDRESSLIST_EJB);
            EmailList emailList = emailListHome.create();

            emailList.setGroupId(listId,
                    EmailConstants.DELETED_GROUP_ID);
        } catch (Exception e) {
            log.error("Error deleting address list", e);


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
     * Adds a member to an address list.
     *
     * @param listId		the id of the address list
     * @param memberData	MemberData object containing the new member
     *
     * @return int	the ID of the new member
     */

    private static int addMember(int listId, MemberData memberData)
            throws ServletException {
        int id = -1;

        log.debug("member xml: " + memberData.toXML());

        Context context = null;
        try {
            context = new InitialContext();
            EmailListHome emailListHome = (EmailListHome) context.lookup(EmailConstants.ADDRESSLIST_EJB);
            EmailList emailList = emailListHome.create();

            id = emailList.addMember(listId, memberData.toXML());
        } catch (Exception e) {
            log.error("Error adding address list member", e);
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
     * Retrieves a member's data and returns a MemberData object
     * representing the member.
     *
     * @param listId		the id of the address list
     * @param memberId		the id of the desired member
     *
     * @return MemberData	MemberData object containing the desired member
     */

    private static MemberData retrieveMemberData(int listId, int memberId)
            throws ServletException {

        String memberDataString = "";

        Context context = null;
        try {
            context = new InitialContext();
            EmailListHome emailListHome = (EmailListHome) context.lookup(EmailConstants.ADDRESSLIST_EJB);
            EmailList emailList = emailListHome.create();

            memberDataString = emailList.getData(listId, memberId);

        } catch (Exception e) {
            log.error("Error retrieving member data", e);
            throw new ServletException(e.toString());
        } finally {
            if (context != null) {
                try {
                    context.close();
                } catch (NamingException e) {
                }
            }
        }


        MemberData memberData = null;

        try {
            memberData = MemberData.loadFromXML(memberDataString);
        } catch (Exception e) {
            log.error("Error loading member data", e);
            throw new ServletException(e.toString());
        }

        memberData.setId(String.valueOf(memberId));

        return memberData;
    }


    /**
     * Updates a member's data.  The specified MemberData object
     * must have a valid id.
     *
     * @param listId		the id of the address list
     * @param memberData	MemberData object containing the member data
     */

    private static void saveMember(int listId, MemberData memberData)
            throws ServletException {

        Context context = null;
        try {
            context = new InitialContext();
            EmailListHome emailListHome = (EmailListHome) context.lookup(EmailConstants.ADDRESSLIST_EJB);
            EmailList emailList = emailListHome.create();

            // remove/then add...
            emailList.removeMember(listId, Integer.parseInt(memberData.getId()));

            emailList.addMember(listId, memberData.toXML());
        } catch (Exception e) {
            log.error("Error saving address list member", e);
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
     * Deletes a member from a list.
     *
     * @param listId	the id of the address list
     * @param memberId	the id of the member to delete
     */


    private static void deleteMember(int listId, int memberId)
            throws ServletException {
        Context context = null;
        try {
            context = new InitialContext();
            EmailListHome emailListHome = (EmailListHome) context.lookup(EmailConstants.ADDRESSLIST_EJB);
            EmailList emailList = emailListHome.create();

            emailList.removeMember(listId, memberId);
        } catch (Exception e) {
            log.error("Error deleting address list member", e);
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
     * Returns all address lists in a group mapped by id.
     *
     * @param group		desired group id
     *
     * @return Map		map of address list id's to address list names
     */

    public static Map getAddressListMap(int group)
            throws ServletException {
        Map addressListMap;

        log.debug("Retrieving address lists of group: " + group);

        Context context = null;
        try {
            context = new InitialContext();
            EmailListHome emailListHome = (EmailListHome) context.lookup(EmailConstants.ADDRESSLIST_EJB);
            EmailList emailList = emailListHome.create();
            addressListMap = emailList.getLists(group);
        } catch (Exception e) {
            log.error("Error getting address list listing", e);
            throw new ServletException(e.toString());
        } finally {
            if (context != null) {
                try {
                    context.close();
                } catch (NamingException e) {
                }
            }
        }

        return addressListMap;
    }


    /**
     * Returns all address list groups mapped by id.
     *
     * @return Map		map of address list group id's to address list group names
     */

    public static Map getAddressListGroupMap()
            throws ServletException {
        Map groupMap = new HashMap();

        Context context = null;
        try {
            context = new InitialContext();
            EmailListGroupHome emailListGroupHome = (EmailListGroupHome) context.lookup(EmailConstants.ADDRESSLIST_GROUP_EJB);
            EmailListGroup emailListGroup = emailListGroupHome.create();
            groupMap = emailListGroup.getGroups();
        } catch (Exception e) {
            log.error("Error getting address list group listing", e);
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
     * Returns the group id of the first address list group (alphabetically)
     *
     * @return int	group id of the first address list group or -1 if there are no groups
     */

    public static int getFirstAddressListGroupId()
            throws ServletException {
        // get all groups
        final Map addressListGroupMap = getAddressListGroupMap();
        // get all group id's
        List groupIdList = new ArrayList(addressListGroupMap.keySet());
        // sort id's by name
        Collections.sort(groupIdList, new Comparator() {
            public int compare(Object o1, Object o2) {
                Comparable c1 = (Comparable) addressListGroupMap.get(o1);
                Comparable c2 = (Comparable) addressListGroupMap.get(o2);
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


    /**
     * Returns the name of the address list with the given listId
     *
     * @param listId	the id of the desired list
     *
     * @return String	the name of the address list
     */

    public static String getAddressListName(int listId)
            throws ServletException {
        String name = "";

        Context context = null;
        try {
            context = new InitialContext();
            EmailListHome emailListHome = (EmailListHome) context.lookup(EmailConstants.ADDRESSLIST_EJB);
            EmailList emailList = emailListHome.create();
            name = emailList.getListName(listId);

        } catch (Exception e) {
            log.error("Error getting address list name", e);
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


    /**
     * Returns the set of member id's of an address list.
     *
     * @param listId	the id of the desired list
     *
     * @return Set		a set containing member id's of the list
     */

    public static Set getMemberIds(int listId)
            throws ServletException {
        Set memberSet;

        Context context = null;
        try {
            context = new InitialContext();
            EmailListHome emailListHome = (EmailListHome) context.lookup(EmailConstants.ADDRESSLIST_EJB);
            EmailList emailList = emailListHome.create();
            memberSet = emailList.getMembers(listId);
        } catch (Exception e) {
            log.error("Error getting address list members", e);
            throw new ServletException(e.toString());
        } finally {
            if (context != null) {
                try {
                    context.close();
                } catch (NamingException e) {
                }
            }
        }

        return memberSet;
    }


    /**
     * Returns member data text for the specified address list member.
     *
     * @param memberId	the id of the desired member
     * @param listId	the id of the desired list
     *
     * @return String	the specified member's data
     */

    public static String getMemberDataText(int listId, int memberId)
            throws ServletException {
        String memberXML = "";

        Context context = null;
        try {
            context = new InitialContext();
            EmailListHome emailListHome = (EmailListHome) context.lookup(EmailConstants.ADDRESSLIST_EJB);
            EmailList emailList = emailListHome.create();
            memberXML = emailList.getData(listId, memberId);
        } catch (Exception e) {
            log.error("Error getting member data", e);
            throw new ServletException(e.toString());
        } finally {
            if (context != null) {
                try {
                    context.close();
                } catch (NamingException e) {
                }
            }
        }

        return memberXML;
    }


    /**
     * Populates an AddressListForm with properties from a request.
     *
     * @param addressList	the AddressListForm to populate
     * @param request	the HttpServletRequest object
     */

    private static void setProperties(AddressListForm addressList, HttpServletRequest request) {
        addressList.setName(request.getParameter("name"));
        addressList.setGroup(request.getParameter("group"));
        List fields = new ArrayList();

        // fields are named FIELD_PREFIX followed by a number.
        // for example, if FIELD_PREFIX is "field-", then "field-0" is the first field.
        for (int i = 0; i < EmailConstants.ADDRESSLIST_NUM_FIELDS; i++) {
            String field = EmailConstants.FIELD_PREFIX + i;
            String fieldName = request.getParameter(field);
            if (fieldName != null) {
                fieldName = fieldName.trim();
                if (fieldName.length() > 0 && !fields.contains(fieldName)) {
                    fields.add(fieldName);
                }
            }
        }
        addressList.setFields(fields);
    }

    /**
     * Populates a MemberData with properties from a request.
     *
     * @param memberData	the MemberData to populate
     * @param request	the HttpServletRequest object
     */


    private static void setMemberProperties(MemberData memberData, HttpServletRequest request) {
        String id = request.getParameter(EmailConstants.ID);
        if (id != null) {
            memberData.setId(id);
        }
        // fields are named by FIELD_PREFIX followed by the actual field name.
        // for example, if FIELD_PREFIX is "field-", then "field-email_address" refers
        // to the field named "email_address".
        for (Enumeration i = request.getParameterNames(); i.hasMoreElements();) {
            String fieldName = (String) i.nextElement();
            if (fieldName.startsWith(EmailConstants.FIELD_PREFIX)) {
                String actualFieldName = fieldName.substring(EmailConstants.FIELD_PREFIX.length());
                memberData.setValue(actualFieldName, request.getParameter(fieldName));
            }
        }
    }
}
