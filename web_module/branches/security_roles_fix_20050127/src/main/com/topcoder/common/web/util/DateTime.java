package com.topcoder.common.web.util;

import com.topcoder.ejb.Util.Util;
import com.topcoder.ejb.Util.UtilHome;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.TCContext;
import com.topcoder.web.common.BaseProcessor;

import javax.naming.Context;
import javax.naming.InitialContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.*;

public final class DateTime {


    private static final String LONG_DATE_FORMAT = "MM/dd/yyyy hh:mm:ss aaa";
    private static final String SHORT_DATE_FORMAT = "MM/dd/yyyy";
    private static final String SORT_DATE_FORMAT = "yyyy-MM-dd";
    private static final char CORRECT_DELIMETER = '/';
    private static final char[] INCORRECT_DELIMETER = {'-', '.'};
    private static final String[] VALID_TIMESTAMP = {
        "MM/dd/yy hh:mm a"
        , "MM/dd/yyyy hh:mm a"
        , "MM/dd/yy"
        , "MM/dd/yyyy"
    };


    public static final java.sql.Date getCurrentDate() throws Exception {
        java.sql.Date result = null;
        InitialContext ctx = null;
        try {
            ctx = TCContext.getInitial();
            Util util = (Util)BaseProcessor.createEJB(ctx, Util.class);
            result = util.getCurrentDate();
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception("common.DateTime:getCurrentDate: Error " + e);
        } finally {
            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ignore) {
                }
            }
        }
        return result;
    }


    public static final java.sql.Date getCurrentDate(java.sql.Connection conn) throws Exception {
        java.sql.Date result = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = conn.prepareStatement("SELECT CURRENT FROM dual");
            rs = ps.executeQuery();
            if (rs.next()) result = rs.getDate(1);
        } catch (Exception e) {
            throw new Exception("common.DateTime:getCurrentDate: Error " + e);
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                }
            }
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                }
            }
        }
        return result;
    }


    public static final java.sql.Time getCurrentTime() throws Exception {
        java.sql.Time result = null;
        InitialContext ctx = null;
        try {
            ctx = TCContext.getInitial();
            Util util = (Util)BaseProcessor.createEJB(ctx, Util.class);
            result = util.getCurrentTime();
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception("common.DateTime:getCurrentTime:ERROR:" + e);
        } finally {
            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ignore) {
                }
            }
        }
        return result;
    }


    public static final java.sql.Time getCurrentTime(java.sql.Connection conn) throws Exception {
        java.sql.Time result = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = conn.prepareStatement("SELECT CURRENT FROM dual");
            rs = ps.executeQuery();
            if (rs.next()) result = rs.getTime(1);
        } catch (Exception e) {
            throw new Exception("common.DateTime:getCurrentDate: Error " + e);
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                }
            }
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                }
            }
        }
        return result;
    }


    public static final java.sql.Timestamp getCurrentTimestamp() throws Exception {
        java.sql.Timestamp result = null;
        InitialContext ctx = null;
        try {
            ctx = TCContext.getInitial();
            Util util = (Util)BaseProcessor.createEJB(ctx, Util.class);
            result = util.getCurrentTimestamp();
        } catch (Exception e) {
            throw new Exception("common.DateTime:getCurrentTimestamp: Error " + e);
        } finally {
            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ignore) {
                }
            }
        }
        return result;
    }

    public static final java.sql.Timestamp getCurrentTimestamp(java.sql.Connection conn)
            throws Exception {
        java.sql.Timestamp result = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = conn.prepareStatement("SELECT CURRENT FROM dual");
            rs = ps.executeQuery();
            if (rs.next()) result = rs.getTimestamp(1);
        } catch (Exception e) {
            throw new Exception("common.DateTime:getCurrentDate: Error " + e);
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                }
            }
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                }
            }
        }
        return result;
    }


    public static final String timeStampToString(java.sql.Timestamp timeStamp) {
        String result = null;
        if (timeStamp != null) {
            SimpleDateFormat dateFormat = new SimpleDateFormat(LONG_DATE_FORMAT);
            dateFormat.setLenient(false);
            StringBuffer buffer = new StringBuffer(LONG_DATE_FORMAT.length());
            buffer = dateFormat.format(timeStamp, buffer, new FieldPosition(0));
            if (buffer != null) {
                result = buffer.toString();
            }
        }
        return result;
    }


    public static final String timeStampToShortString(java.sql.Timestamp timeStamp) {
        String result = null;
        if (timeStamp != null) {
            SimpleDateFormat dateFormat = new SimpleDateFormat(SHORT_DATE_FORMAT);
            dateFormat.setLenient(false);
            StringBuffer buffer = new StringBuffer(SHORT_DATE_FORMAT.length());
            buffer = dateFormat.format(timeStamp, buffer, new FieldPosition(0));
            if (buffer != null) {
                result = buffer.toString();
            }
        }
        return result;
    }


    public static String dateToString(java.sql.Date date) {
        String result = null;
        if (date != null) {
            SimpleDateFormat dateFormat = new SimpleDateFormat(LONG_DATE_FORMAT);
            dateFormat.setLenient(false);
            StringBuffer buffer = new StringBuffer(LONG_DATE_FORMAT.length());
            buffer = dateFormat.format(date, buffer, new FieldPosition(0));
            if (buffer != null) {
                result = buffer.toString();
            }
        }
        return result;
    }


    public static String dateToShortString(java.sql.Date date) {
        String result = null;
        if (date != null) {
            SimpleDateFormat dateFormat = new SimpleDateFormat(SHORT_DATE_FORMAT);
            dateFormat.setLenient(false);
            StringBuffer buffer = new StringBuffer(SHORT_DATE_FORMAT.length());
            buffer = dateFormat.format(date, buffer, new FieldPosition(0));
            if (buffer != null) {
                result = buffer.toString();
            }
        }
        return result;
    }

    public static String dateToShortSortString(java.sql.Date date) {
        String result = null;
        if (date != null) {
            SimpleDateFormat dateFormat = new SimpleDateFormat(SORT_DATE_FORMAT);
            dateFormat.setLenient(false);
            StringBuffer buffer = new StringBuffer(SORT_DATE_FORMAT.length());
            buffer = dateFormat.format(date, buffer, new FieldPosition(0));
            if (buffer != null) {
                result = buffer.toString();
            }
        }
        return result;
    }

    public static java.sql.Date stringToDate(String strDate) {
        java.sql.Date result = null;
        if ((strDate != null) && !strDate.equals("")) {
            for (int i = 0; i < INCORRECT_DELIMETER.length; i++) {
                strDate = strDate.replace(INCORRECT_DELIMETER[i], CORRECT_DELIMETER);
            }
            SimpleDateFormat dateFormat = new SimpleDateFormat(SHORT_DATE_FORMAT);
            dateFormat.setLenient(false);
            java.util.Date utilDate = dateFormat.parse(strDate, new ParsePosition(0));
            if (utilDate != null) {
                result = new java.sql.Date(utilDate.getTime());
            }
        }
        return result;
    }


    public static java.sql.Timestamp convertStringToTimestamp(String strDate) {
        java.sql.Timestamp result = null;
        if ((strDate != null) && !strDate.equals("")) {
            try {
                for (int i = 0; i < INCORRECT_DELIMETER.length; i++) {
                    strDate = strDate.replace(INCORRECT_DELIMETER[i], CORRECT_DELIMETER);
                }
                for (int i = 0; i < VALID_TIMESTAMP.length; i++) {
                    result = convertStringToTimestamp(strDate, VALID_TIMESTAMP[i]);
                    if (result != null) break;
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return result;
    }


    public static java.sql.Timestamp convertStringToTimestamp(String strDate, String sFormat) {
        java.sql.Timestamp result = null;
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat(sFormat);
            dateFormat.setLenient(false);
            java.util.Date utilDate = dateFormat.parse(strDate, new ParsePosition(0));
            if (utilDate != null) {
                result = new java.sql.Timestamp(utilDate.getTime());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }


}
