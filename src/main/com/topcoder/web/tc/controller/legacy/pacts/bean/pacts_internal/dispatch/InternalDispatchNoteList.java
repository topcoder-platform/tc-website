/******************************************************************************\
 *
 * File:          InternalDispatchNoteList.java
 * Creation date: March 16, 2002 19:32
 * Author:        Matt Murphy
 *
 * Modifications: @INSERT_MODIFICATIONS(* )
 *
 * Copyright 2002, TopCoder, Inc
 * All rights are reserved. Reproduction in whole or part is prohibited
 * without the written consent of the copyright owner.
 *
 \******************************************************************************/

package com.topcoder.web.tc.controller.legacy.pacts.bean.pacts_internal.dispatch;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

public class InternalDispatchNoteList implements PactsConstants {
    HttpServletRequest request;
    HttpServletResponse response;

    private static Logger log = Logger.getLogger(InternalDispatchNoteList.class);

    public InternalDispatchNoteList(HttpServletRequest request,
                                    HttpServletResponse response) {

        this.request = request;
        this.response = response;
    }

    /**
     *
     * This method returns an array of NoteHeader objects matching
     * the search parameters
     *
     * @Args    - none
     * @Returns - NoteHeader[]
     *
     */
    public NoteHeader[] get() throws Exception {

/*
    public static final String SUBMITTING_USER_ID = "submitting_user_id";
*/

        String param;
        Map search = new HashMap();
        Map results;

        DataInterfaceBean bean = new DataInterfaceBean();

        if (request.getParameter("object_id") != null) {
            long object_id = Long.parseLong(request.getParameter("object_id"));
            int object_type = Integer.parseInt(request.getParameter("object_type"));

            results = bean.getNoteList(object_id, object_type, 0);
        } else {
            param = request.getParameter(SUBMITTING_USER_ID);
            if (param != null && !param.equals("")) search.put(SUBMITTING_USER_ID, param);
            param = request.getParameter(SUBMITTING_HANDLE);
            if (param != null && !param.equals("")) search.put(SUBMITTING_HANDLE, param);
            param = request.getParameter(TYPE_CODE);
            if (param != null && !param.equals("")) search.put(TYPE_CODE, param);
            param = request.getParameter(HANDLE);
            if (param != null && !param.equals("")) search.put(HANDLE, param);
            param = request.getParameter(IN_DEPTH_HANDLE);
            if (param != null && !param.equals("")) search.put(IN_DEPTH_HANDLE, param);
            param = request.getParameter(EARLIEST_CREATION_DATE);
            if (param != null && !param.equals("")) search.put(EARLIEST_CREATION_DATE, TCData.dateForm(param));
            param = request.getParameter(LATEST_CREATION_DATE);
            if (param != null && !param.equals("")) search.put(LATEST_CREATION_DATE, TCData.dateForm(param));
            param = request.getParameter(NOTE_ID);
            if (param != null && !param.equals("")) search.put(NOTE_ID, param);
            param = request.getParameter(USER_ID);
            if (param != null && !param.equals("")) search.put(USER_ID, param);
            param = request.getParameter(CONTRACT_ID);
            if (param != null && !param.equals("")) search.put(CONTRACT_ID, param);
            param = request.getParameter(PAYMENT_ID);
            if (param != null && !param.equals("")) search.put(PAYMENT_ID, param);
            param = request.getParameter(AFFIDAVIT_ID);
            if (param != null && !param.equals("")) search.put(AFFIDAVIT_ID, param);
            param = request.getParameter(TAX_FORM_ID);
            if (param != null && !param.equals("")) search.put(TAX_FORM_ID, param);
            param = request.getParameter(TAX_FORM_USER_ID);
            if (param != null && !param.equals("")) search.put(TAX_FORM_USER_ID, param);

            results = bean.findNotes(search);
        }

        if (results != null)
            return (new NoteHeaderList(results)).headerList;
        else
            return new NoteHeader[0];
    }


    public NoteHeader[] get(long tax_form_user_id) throws Exception {

        String param;
        Map search = new HashMap();
        Map results;

        DataInterfaceBean bean = new DataInterfaceBean();

        param = request.getParameter(TAX_FORM_ID);
        if (param != null && !param.equals("")) search.put(TAX_FORM_ID, param);

        search.put(TAX_FORM_USER_ID, (new String()).valueOf(tax_form_user_id));

        results = bean.findNotes(search);

        if (results != null)
            return (new NoteHeaderList(results)).headerList;
        else
            return new NoteHeader[0];
    }


    public NoteHeader[] get(Map search) throws Exception {

        String param;
        Map results;

        DataInterfaceBean bean = new DataInterfaceBean();

        results = bean.findNotes(search);

        if (results != null)
            return (new NoteHeaderList(results)).headerList;
        else
            return new NoteHeader[0];
    }

}

;
