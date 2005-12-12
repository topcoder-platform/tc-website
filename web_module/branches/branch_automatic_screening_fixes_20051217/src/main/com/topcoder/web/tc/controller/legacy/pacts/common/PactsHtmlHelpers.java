/**
 * this class contains some helper functions that may be usefull for
 * creating html code inside java.
 *
 * @author Sam King
 */
package com.topcoder.web.tc.controller.legacy.pacts.common;

import java.util.Vector;

public class PactsHtmlHelpers implements PactsConstants {

    /**
     * this class is used to generate a href based on the parameters
     * passed to it.
     *
     * @param path this is the path and the page of the href.
     * @param params these are the parameters.  It is a vector
     *        of strings in the form "someparam=someval" and
     *        this method will fill in the ?'s and &'s
     * @param text the text of the link
     * @return the resulting html, or null of an error occured
     */
    public static String createHtmlHref(String path, Vector params,
                                        String text) {
        StringBuffer buf = new StringBuffer();
        buf.append("<a href=" + path);

        // put any parameters in the href
        if (params.size() > 0) {
            buf.append("?");
            for (int i = 0; i < params.size(); i++) {
                buf.append((String) params.get(i));

                if (i < (params.size() - 1)) {
                    buf.append("&");
                }
            }
        }
        buf.append(">");

        // now the link text and finish it off
        buf.append(text + "</a>");


        return buf.toString();

    }



    // this method added by Steve Burrows during PACTS implementation
    // to incorporate CSS stylesheet class name.

    /**
     * this class is used to generate a href based on the parameters
     * passed to it.
     *
     * @param path this is the path and the page of the href.
     * @param params these are the parameters.  It is a vector
     *        of strings in the form "someparam=someval" and
     *        this method will fill in the ?'s and &'s
     * @param text the text of the link
     * @param className the CSS stylesheet class name string
     * @return the resulting html, or null of an error occured
     */
    public static String createHtmlHref(
            String path
            , Vector params
            , String text
            , String className
            ) {
        StringBuffer buf = new StringBuffer();
        buf.append("<a href=" + path);

        // put any parameters in the href
        if (params.size() > 0) {
            buf.append("?");
            for (int i = 0; i < params.size(); i++) {
                buf.append((String) params.get(i));

                if (i < (params.size() - 1)) {
                    buf.append("&");
                }
            }
        }
        if (className != null) buf.append(" class=\"" + className + "\"");
        buf.append(">");

        // now the link text and finish it off
        buf.append(text + "</a>");


        return buf.toString();

    }


    /**
     * this is used to create an html href where there is a task
     * and a command.  The constants are grabbed from the pacts
     * constants interface. Note, this method will add the values
     * to the vector, thus changing the data.
     *
     * @param path this is the path and the page of the href.
     * @param params these are the parameters.  It is a vector
     *        of strings in the form "someparam=someval" and
     *        this method will fill in the ?'s and &'s
     * @param text the text of the link
     * @param task the string to fill in the task spot with
     * @param command the command string for the command spot
     * @return the resulting html, or null of an error occured
     */
    public static String createPactsHtmlHref(String path, Vector params,
                                             String task, String command,
                                             String text) {
        params.add(0, new String(CMD_STRING + "=" + command));
        params.add(0, new String(TASK_STRING + "=" + task));

        return createHtmlHref(path, params, text);
    }


    // this method added by Steve Burrows during PACTS implementation
    // to incorporate CSS stylesheet class name.

    /**
     * this is used to create an html href where there is a task
     * and a command.  The constants are grabbed from the pacts
     * constants interface. Note, this method will add the values
     * to the vector, thus changing the data.
     *
     * @param path this is the path and the page of the href.
     * @param params these are the parameters.  It is a vector
     *        of strings in the form "someparam=someval" and
     *        this method will fill in the ?'s and &'s
     * @param text the text of the link
     * @param task the string to fill in the task spot with
     * @param command the command string for the command spot
     * @param className the CSS stylesheet class name string
     * @return the resulting html, or null of an error occured
     */
    public static String createPactsHtmlHref(String path, Vector params,
                                             String task, String command,
                                             String text, String className) {
        params.add(0, new String(CMD_STRING + "=" + command));
        params.add(0, new String(TASK_STRING + "=" + task));

        return createHtmlHref(path, params, text, className);
    }


}
