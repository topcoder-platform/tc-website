package com.topcoder.web.project.servlet;

import com.topcoder.web.project.common.DBMS;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.Hashtable;
import java.util.Map;

public final class ProjectCtxServlet extends HttpServlet {

    /* the path to use for calling JSPs */
    public final static String jspPath = "/project/";

    /* dispatcherMap caches RequestDispatchers */
    private Map dispatcherMap;

    public synchronized void init(ServletConfig config) throws ServletException {
        super.init(config);
        /* a previous instance of the servlet may have already created the dispatcherMap */
        dispatcherMap = (Map) getServletContext().getAttribute("dispatcherMap");
        /* if not, then create the map and bind it to the ServletContext */
        if (dispatcherMap == null) {
            dispatcherMap = new Hashtable();
            getServletContext().setAttribute("dispatcherMap", dispatcherMap);
        }
    }

    public final void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processCommands(request, response);
    }

    private void processCommands(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String pt_vp = "";
        String pt_page = "";
        String pt_params = "";
        String pt_action = "";

        pt_page = request.getParameter("pt_page");

        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("handle") != null) {
            if (pt_page == null) {
                forwardRequest(request, response, "menu");
            } else if (pt_page.equals("logout")) {
                int loginId = Integer.parseInt("" + session.getAttribute("loginId"));
                ProjectBean projectBean = new ProjectBean();
                try {
                    projectBean.logoutMember(loginId, "");
                } catch (Exception e) {
                    e.printStackTrace();
                }
                session.invalidate();
                forwardRequest(request, response, "login");
            } else {
                forwardRequest(request, response, pt_page);
            }
        } else {
            if (pt_page != null && pt_page.equals("login")) {
                String handle = request.getParameter("handle");
                String password = request.getParameter("password");
                ProjectBean projectBean = new ProjectBean();
                int user_id = projectBean.validateLogin(handle, password);
                if (user_id > 0) {
                    String groups = projectBean.getGroups(user_id);
                    session = request.getSession(true);
                    session.setAttribute("user_id", new Integer(user_id));
                    session.setAttribute("handle", handle);
                    session.setAttribute("groups", groups);
                    try {
                        int loginId = DBMS.getSeqId(DBMS.PT_LOGIN_SEQ);
                        projectBean.loginMember(loginId, user_id, "");
                        session.setAttribute("loginId", "" + loginId);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }

                    forwardRequest(request, response, "menu");
                } else {
                    request.setAttribute("message", "Invalid login/password. Please try again");
                    forwardRequest(request, response, "login");
                }
            } else {
                forwardRequest(request, response, "login");
            }
        }
    }

    protected void forwardRequest(HttpServletRequest req, HttpServletResponse resp, String target) throws ServletException, IOException {
        if (target == null || target.length() == 0) target = "blank";
        RequestDispatcher rd = null;
        synchronized (this) {
            rd = (RequestDispatcher) dispatcherMap.get(target);
            if (rd == null) {
                rd = getServletContext().getRequestDispatcher(jspPath + target + ".jsp");
                if (rd == null) throw new ServletException("cannot obtain request dispatcher");
                //dispatcherMap.put(target, rd);
            }
        }
        req.setAttribute("dispatched", "true");
        rd.forward(req, resp);
    }

    // CUSTOM GET_BYTES BECAUSE THE PERFORMANCE OF String.getBytes() ROTS!!!
    public static byte[] asciiGetBytes(String s) {
        int size = s.length();
        byte[] result = new byte[size];
        for (int i = 0; i < size; i++) {
            result[i] = (byte) s.charAt(i);
        }
        return result;
    }

}
