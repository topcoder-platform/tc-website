package com.topcoder.web.test;

import javax.servlet.ServletOutputStream;
import java.io.*;

public class ServletOutputStreamHelper extends ServletOutputStream {
	protected FileOutputStream file;
	public ServletOutputStreamHelper() {
		try {
			file = new FileOutputStream("TestOutputStream.out");		
		} catch (FileNotFoundException fnfe) {
			file = null;
		}
	}
	
	public void write(int b) throws IOException {
		file.write(b);
	}
}