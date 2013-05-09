/*
 * Copyright (C) 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.reg;

import java.io.File;
import java.io.FileOutputStream;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import com.topcoder.randomstringimg.RandomStringImage;
import com.topcoder.reg.RegistrationHelper;

/**
 * <p>
 * This class functions as captcha generator, which will be used by both
 * traditional session store word and REST ways.
 * </p>
 * 
 * <p>
 * Main goal of this class is achieved by {@link #generate(HttpServletRequest)}
 * method. Please refer to it for more info.
 * </p>
 * 
 * <p>
 * <strong>Thread Safety: </strong> Technically speaking, it's mutable and not
 * thread safe. But this class will be used in thread-safe manner.
 * </p>
 * 
 * @author leo_lol
 * @version 1.0
 * @since 1.0
 */
public class CaptchaGenerator {
	
	/**
	 * This field represents the qualified name of this class.
	 */
	private static final String CLASS_NAME = CaptchaGenerator.class.getName();

	/**
	 * Random string image configuration file. It's be injected by Spring.
	 */
	private String randomStringImageConfigFile;

	/**
	 * Life span of the captcha. It's be injected by Spring.
	 */
	private Integer captchaLifeSpan;
	
	/**
	 * Threshold of deprecated captcha number to check. Will be injected by Spring. 0 means "always check".
	 */
	private Integer deprecatedCaptchaCheckValve;
	
	/**
	 * This method will generate a captcha image and a corresponding uuid along
	 * with the captcha word. The relation between UUID and the cpatcha word is
	 * maintained by a HashMap in ServletContext.
	 * 
	 * @param request
	 *            the associated HttpServletRequest instance. Not null.
	 * 
	 * @return Instance of {@link Captcha}.
	 */
	@SuppressWarnings("unchecked")
	public Captcha generate(HttpServletRequest request) {
		Captcha captcha = new Captcha();
		captcha.setCreatedDate(System.currentTimeMillis());
		try {
			ServletContext application = request.getSession()
					.getServletContext();
			String captchaFileName = "REG_" + captcha.getCreatedDate() + ".png";
			captcha.setPath(captchaFileName);

			String appRoot = application.getRealPath("/");
			String captchaDir = appRoot + RegistrationHelper.CAPTCHA_RELATIVE_DIR;
			File captchaDirFile = new File(captchaDir);
			if (!captchaDirFile.exists()) {
				captchaDirFile.mkdirs();
			}
			
			File newCaptchaFile = new File(captchaDirFile, captchaFileName);
			newCaptchaFile.createNewFile();
			
			FileOutputStream fos = new FileOutputStream(newCaptchaFile);
			RandomStringImage rsi = new RandomStringImage(
					randomStringImageConfigFile);

			try {
				String word = rsi.generateRandomFromDictionaries(fos);
				Map<String, Captcha> captchaMap = (Map<String, Captcha>) application
						.getAttribute(RegistrationHelper.CAPTCHA_APPLICATION_KEY);
				if (null == captchaMap) {
					captchaMap = new HashMap<String, Captcha>();
					application.setAttribute(RegistrationHelper.CAPTCHA_APPLICATION_KEY,
							captchaMap);
				}
				String uuid = UUID.randomUUID().toString();
				captcha.setWord(word);
				captcha.setUuid(uuid);
				captchaMap.put(uuid, captcha);
				
				if(captchaMap.size() >= deprecatedCaptchaCheckValve) {
					deleteDeprecatedCaptchas(request);
				}
			} finally {
				fos.close();
			}
		} catch (Throwable e) {
			e.printStackTrace();
		}
		return captcha;
	}
	
	/**
	 * This method is used to delete deprecated Captcha info, including image file and the UUID-word pair in 
	 * ServletContext.
	 * @param application The ServletContext instance.
	 * @param uuid UUID of the captcha entity.
	 */
	public static void deleteCaptcha(ServletContext application, String uuid) {
		@SuppressWarnings("unchecked")
		Map<String, Captcha> captchaMap = 
				(Map<String, Captcha>) application.getAttribute(RegistrationHelper.CAPTCHA_APPLICATION_KEY);
		if(null == captchaMap) {
			return;
		}
		
		Captcha captcha = (Captcha)captchaMap.get(uuid);
		if(null == captcha) {
			return;
		}
		String appRoot = application.getRealPath("/");
		String captchaImagePath = appRoot + RegistrationHelper.CAPTCHA_RELATIVE_DIR + captcha.getPath();
		File captchaImageFile = new File(captchaImagePath);
		if(captchaImageFile.exists()) {
			captchaImageFile.delete();
		}
		captchaMap.remove(uuid);
	}
	
	/**
	 * This method would delete those unused deprecated captcha image, and remove the catpcha UUID-word pair from 
	 * ServletContext.
	 * 
	 * @param request Instance of ServletContext.
	 */
	private void deleteDeprecatedCaptchas(HttpServletRequest request) {
		ServletContext application = request.getSession().getServletContext();
		@SuppressWarnings("unchecked")
		Map<String, Captcha> map = 
				(Map<String, Captcha>) application.getAttribute(RegistrationHelper.CAPTCHA_APPLICATION_KEY);
		
		if(null == map) {
			return;
		}
		long current = System.currentTimeMillis();
		Set<String> uuidSet = new HashSet<String>();
		
		//find all to-delete captcha items.
		for(Map.Entry<String, Captcha> entry : map.entrySet()) {
			if(entry.getValue().getCreatedDate() + captchaLifeSpan < current) {
				uuidSet.add(entry.getKey());
			}
		}
		//delete all deprecated items.
		if(!uuidSet.isEmpty()) {
			for(String uuid : uuidSet) {
				deleteCaptcha(application, uuid);
			}
		}
	}
	
	/**
	 * This method would check the configuration of Spring.
	 */
	public void checkInit() {
		if(null == randomStringImageConfigFile) {
			throw new RuntimeException("Check your spring configuration file to" +
					" configure\"randomStringImageConfigFile\" for beans of " + CLASS_NAME);
		}
		
		if(null == captchaLifeSpan) {
			throw new RuntimeException("Check your spring configuration file to" +
					" configure\"captchaLifeSpan\" for beans of " + CLASS_NAME);
		}
		
		if(null == deprecatedCaptchaCheckValve) {
			throw new RuntimeException("Check your spring configuration file to " +
					"configure\"deprecatedCaptchaCheckValve\" for beans of " + CLASS_NAME);
		}
	}

	/**
	 * The setter for the randomStringImageConfigFile instance variable.
	 * 
	 * @param randomStringImageConfigFile
	 *            the randomStringImageConfigFile to set
	 */
	public void setRandomStringImageConfigFile(
			String randomStringImageConfigFile) {
		this.randomStringImageConfigFile = randomStringImageConfigFile;
	}

	/**
	 * Setter of the name-sake field.
	 * 
	 * @param captchaLifeSpan
	 *            the name-sake field to set
	 */
	public void setCaptchaLifeSpan(Integer captchaLifeSpan) {
		this.captchaLifeSpan = captchaLifeSpan;
	}

	/**
	 * Setter of the name-sake field.
	 * @param deprecatedCaptchaCheckValve the name-sake field to set
	 */
	public void setDeprecatedCaptchaCheckValve(Integer deprecatedCaptchaCheckValve) {
		this.deprecatedCaptchaCheckValve = deprecatedCaptchaCheckValve;
	}
}
