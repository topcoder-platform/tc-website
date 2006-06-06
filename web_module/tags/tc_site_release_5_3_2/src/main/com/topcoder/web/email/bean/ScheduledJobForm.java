package com.topcoder.web.email.bean;


import java.io.Serializable;
import java.util.*;


/**

 * Bean to store information about a scheduled job from a form

 *

 * @author	James Lee (jameslee@cs.stanford.edu)

 * @version	1.0

 *

 */


public class ScheduledJobForm

        implements Serializable, Cloneable {

    protected int id;

    protected int templateId;

    // listID is 0 if a predefined query is used

    protected int listId;

    // commandID is 0 if a static list is used

    protected int commandId;

    // testID is only set if a list is needed for a test/report/reminder

    protected int testId;

    // listType is either EmailConstants.STATIC_LIST or EmailConstants.PREDEFINED_QUERY

    protected String listType;

    // maps input id -> value for each input of a predefined query

    protected Map commandInputMap;

    // send test message?

    protected String sendTestMessage;


    protected Date startDate;

    protected Date endDate;


    protected String fromAddress;

    protected String fromPersonal;

    protected String subject;


    protected boolean sendTest;

    protected boolean sendReport;

    protected boolean sendReminder;


    protected Calendar calendar;



    // keep track of whether or not this job was already added

    // (to prevent duplicates when reloading the page)

    protected boolean added;


    public ScheduledJobForm() {

        added = false;

        calendar = new GregorianCalendar();

    }


    public void setAdded(boolean added) {

        this.added = added;

    }


    public boolean isAdded() {

        return added;

    }


    public Object clone()

            throws CloneNotSupportedException {

        return super.clone();

    }


    /**

     * This method validates the fields of the scheduled job form.

     * Returns an empty ArrayList if there are no errors.  Otherwise

     * returns an ArrayList of error messages.

     *

     * @return ArrayList		list of error messages

     */


    public ArrayList validate() {

        ArrayList errors = new ArrayList();


        String fromPersonal = getFromPersonal();

        if (fromPersonal.length() == 0) errors.add("Sender name cannot be empty");


        String fromAddress = getFromAddress();

        boolean emailValid = Utilities.isEmailAddressValid(fromAddress);

        if (!emailValid) {

            errors.add("'" + fromAddress + "' appears to be an invalid e-mail address.");

        }


        Date startDate = getStartDate();

        Date endDate = getEndDate();


        if (endDate.getTime() < startDate.getTime()) {

            errors.add("The end date cannot be earlier than the start date.");

        }


        return errors;

    }


    public void setId(String id) {

        try {

            this.id = Integer.parseInt(id);

        } catch (NumberFormatException e) {

            this.id = 0;

        }

    }


    public String getId() {

        return String.valueOf(id);

    }


    public void setTestId(String id) {

        try {

            testId = Integer.parseInt(id);

        } catch (NumberFormatException e) {

            testId = 0;

        }

    }


    public String getTestId() {

        return String.valueOf(testId);

    }


    public void setTemplateId(String id) {

        try {

            this.templateId = Integer.parseInt(id);

        } catch (NumberFormatException e) {

            this.templateId = 0;

        }

    }


    public String getTemplateId() {

        return String.valueOf(templateId);

    }


    public void setListId(String id) {

        try {

            this.listId = Integer.parseInt(id);

        } catch (NumberFormatException e) {

            this.listId = 0;

        }

    }


    public String getListId() {

        return String.valueOf(listId);

    }


    public void setCommandId(String id) {

        try {

            this.commandId = Integer.parseInt(id);

        } catch (NumberFormatException e) {

            this.commandId = 0;

        }

    }


    public String getCommandId() {

        return String.valueOf(commandId);

    }


    public void setCommandInputMap(Map commandInputMap) {

        this.commandInputMap = commandInputMap;

    }


    public Map getCommandInputMap() {

        if (commandInputMap == null)
            return new HashMap();

        else
            return commandInputMap;

    }


    public void setStartYear(String startYear) {

        try {

            startDate = changeDate(startDate, Calendar.YEAR, startYear);

        } catch (NumberFormatException e) {

        }

    }


    public String getStartYear() {

        return getDateField(startDate, Calendar.YEAR);

    }


    public void setStartMonth(String startMonth) {

        try {

            startDate = changeDate(startDate, Calendar.MONTH, startMonth);

        } catch (NumberFormatException e) {

        }

    }


    public String getStartMonth() {

        return getDateField(startDate, Calendar.MONTH);

    }


    public void setStartDay(String startDay) {

        try {

            startDate = changeDate(startDate, Calendar.DAY_OF_MONTH, startDay);

        } catch (NumberFormatException e) {

        }

    }


    public String getStartDay() {

        String day = getDateField(startDate, Calendar.DAY_OF_MONTH);

        while (day.length() < 2) day = "0" + day;


        return day;

    }


    public void setStartHour(String startHour) {

        try {

            startDate = changeDate(startDate, Calendar.HOUR_OF_DAY, startHour);

        } catch (NumberFormatException e) {

        }

    }


    public String getStartHour() {

        String hour = getDateField(startDate, Calendar.HOUR_OF_DAY);

        while (hour.length() < 2) hour = "0" + hour;


        return hour;

    }


    public void setStartMinutes(String startMinutes) {

        try {

            startDate = changeDate(startDate, Calendar.MINUTE, startMinutes);

        } catch (NumberFormatException e) {

        }

    }


    public String getStartMinutes() {

        String minutes = getDateField(startDate, Calendar.MINUTE);

        while (minutes.length() < 2) minutes = "0" + minutes;


        return minutes;

    }


    public void setEndYear(String endYear) {

        try {

            endDate = changeDate(endDate, Calendar.YEAR, endYear);

        } catch (NumberFormatException e) {

        }

    }


    public String getEndYear() {

        return getDateField(endDate, Calendar.YEAR);

    }


    public void setEndMonth(String endMonth) {

        try {

            endDate = changeDate(endDate, Calendar.MONTH, endMonth);

        } catch (NumberFormatException e) {

        }

    }


    public String getEndMonth() {

        return getDateField(endDate, Calendar.MONTH);

    }


    public void setEndDay(String endDay) {

        try {

            endDate = changeDate(endDate, Calendar.DAY_OF_MONTH, endDay);

        } catch (NumberFormatException e) {

        }

    }


    public String getEndDay() {

        String day = getDateField(endDate, Calendar.DAY_OF_MONTH);

        while (day.length() < 2) day = "0" + day;


        return day;

    }


    public void setEndHour(String endHour) {

        try {

            endDate = changeDate(endDate, Calendar.HOUR_OF_DAY, endHour);

        } catch (NumberFormatException e) {

        }

    }


    public String getEndHour() {

        String hour = getDateField(endDate, Calendar.HOUR_OF_DAY);

        while (hour.length() < 2) hour = "0" + hour;


        return hour;

    }


    public void setEndMinutes(String endMinutes) {

        try {

            endDate = changeDate(endDate, Calendar.MINUTE, endMinutes);

        } catch (NumberFormatException e) {

        }

    }


    public String getEndMinutes() {

        String minutes = getDateField(endDate, Calendar.MINUTE);

        while (minutes.length() < 2) minutes = "0" + minutes;


        return minutes;

    }


    public void setFromAddress(String fromAddress) {

        this.fromAddress = fromAddress;

    }


    public String getFromAddress() {

        return (fromAddress == null ? "" : fromAddress);

    }


    public void setFromPersonal(String fromPersonal) {

        this.fromPersonal = fromPersonal;

    }


    public String getFromPersonal() {

        return (fromPersonal == null ? "" : fromPersonal);

    }


    public void setSubject(String subject) {

        this.subject = subject;

    }


    public String getSubject() {

        return (subject == null ? "" : subject);

    }


    public void setStartDate(Date startDate) {

        this.startDate = startDate;

    }


    public Date getStartDate() {

        return startDate;

    }


    public void setEndDate(Date endDate) {

        this.endDate = endDate;

    }


    public Date getEndDate() {

        return endDate;

    }


    public boolean getSendTestState() {
        return sendTest;
    }


    public String getSendTest() {

        if (sendTest) return "checked";

        return "";

    }


    public void setSendTest(String value) {

        sendTest = value != null;

    }


    public boolean getSendReportState() {
        return sendReport;
    }


    public String getSendReport() {

        if (sendReport) return "checked";

        return "";

    }


    public void setSendReport(String value) {

        sendReport = value != null;

    }


    public boolean getSendReminderState() {
        return sendReminder;
    }


    public String getSendReminder() {

        if (sendReminder) return "checked";

        return "";

    }


    public void setSendReminder(String value) {

        sendReminder = value != null;

    }





    // Utilities






    /**

     * Changes a specified field in initialDate to a new value.

     * (for example, changeDate(date, Calendar.MONTH, 0) returns

     * the date with the month as January and all other fields

     * untouched).

     *

     * @param initialDate	the original date

     * @param field		the Calendar field to alter

     * @param newValue	the new value for the field

     *

     * @return Date		the altered date

     */


    private Date changeDate(Date initialDate, int field, String newValue)

            throws NumberFormatException {

        calendar.setTime(initialDate);

        int value = Integer.parseInt(newValue);

        calendar.set(field, value);

        return calendar.getTime();

    }


    /**

     * Returns the specified field of a Date.

     *

     * @param date		the date

     * @param field		the desired field

     *

     * @return String	the value of the field as a String

     */


    private String getDateField(Date date, int field) {

        calendar.setTime(date);

        return String.valueOf(calendar.get(field));

    }


    public String toString() {

        StringBuffer sb = new StringBuffer(1000);


        sb.append("ID:\n");

        sb.append(id);

        sb.append("\n");

        sb.append("Template ID:\n");

        sb.append(templateId);

        sb.append("\n");

        sb.append("Address List ID:\n");

        sb.append(listId);

        sb.append("\n");

        sb.append("Command ID:\n");

        sb.append(commandId);

        sb.append("\n");

        sb.append("From Address:\n");

        sb.append(fromAddress);

        sb.append("\n");


        sb.append("From Personal:\n");

        sb.append(fromPersonal);

        sb.append("\n");

        sb.append("Subject:\n");

        sb.append(subject);

        sb.append("\n");

        sb.append("Start Date:\n");

        //sb.append(startMonth + "/" + startDay + "/" + startYear + " " + startHour + ":" + startMinutes);

        sb.append(getStartDate());

        sb.append("\n");

        sb.append("End Date:\n");

        //sb.append(endMonth + "/" + endDay + "/" + endYear + " " + endHour + ":" + endMinutes);

        sb.append(getEndDate());


        return sb.toString();

    }


}


