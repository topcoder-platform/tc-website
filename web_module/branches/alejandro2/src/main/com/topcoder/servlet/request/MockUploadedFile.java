package com.topcoder.servlet.request;

import java.io.File;

public class MockUploadedFile extends LocalUploadedFile {

	public MockUploadedFile(File file, String contentType) {
		super(file, contentType);
	}

	public MockUploadedFile(File file, String fileId, String contentType) {
		super(file, fileId, contentType);
	}

}
