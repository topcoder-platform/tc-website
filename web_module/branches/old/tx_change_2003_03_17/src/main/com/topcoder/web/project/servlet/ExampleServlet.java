package com.topcoder.web.project.servlet;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.OutputStream;
import java.util.zip.GZIPOutputStream;


public final class ExampleServlet extends HttpServlet {


    public synchronized void init(ServletConfig config) throws ServletException {
        super.init(config);
    }


    public final void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }


    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        processCommands(request, response);
    }

    private void processCommands(HttpServletRequest request, HttpServletResponse response) {
        OutputStream outputStream = null;
        GZIPOutputStream gzipStream = null;
        String HTMLString = "TESTING EXAMPLE SERVLET";
        try {
            String encode = request.getHeader("Accept-Encoding");
            if (encode != null && encode.indexOf("gzip") != -1) {
                outputStream = response.getOutputStream();
                gzipStream = new GZIPOutputStream(outputStream);
                response.setHeader("Content-Encoding", "gzip");
                byte[] HTMLByte = asciiGetBytes(HTMLString);
                gzipStream.write(HTMLByte);
            } else {
                outputStream = response.getOutputStream();
                byte[] HTMLByte = asciiGetBytes(HTMLString);
                outputStream.write(HTMLByte);
            }
        } catch (Exception e) {
            e.printStackTrace();
            try {
            } catch (Exception end) {
                end.printStackTrace();
                try {
                } catch (Exception ignore) {
                }
            }
        } finally {
            if (gzipStream != null) {
                try {
                    gzipStream.finish();
                    gzipStream.flush();
                    gzipStream.close();
                } catch (Exception ignore) {
                }
            }
        }
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
