package com.topcoder.web.studio.controller.request.admin;

import java.util.List;
import java.util.Properties;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

import com.topcoder.service.studio.ContestData;
import com.topcoder.service.studio.StudioService;
import com.topcoder.shared.util.logging.Logger;

import foo.FooRemote;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00 Create Date: Aug 29,
 *          2006
 */
// public class AddSubmissionPrize extends SubmissionPrizeBase {
// protected void submissionProcessing(Submission s, Prize p) throws Exception {
// s.addPrize(p);
// //if the prize is a contest prize and we haven't set a contest result placed
// record for this
// //then set one. the site uses contest result to show place, so we need to set
// that up
// //in the case that we're not using online review.
// if (p.getType().getId().equals(PrizeType.CONTEST)) {
// ContestResult cr = s.getResult();
// if (cr == null) {
// cr = new ContestResult(s);
// }
// if (cr.getPlaced() == null) {
// cr.setPlaced(p.getPlace());
// }
// }
// }
// }
public class AddSubmissionPrize extends Base {

	public static void main(String args[]) throws Exception {
		processLookup();
	}
	protected static void processLookup() {
//		Properties env = new Properties();
//		env.setProperty(Context.INITIAL_CONTEXT_FACTORY, "org.jnp.interfaces.NamingContextFactory");
//		//env.setProperty(Context.INITIAL_CONTEXT_FACTORY, "org.jboss.security.jndi.LoginInitialContextFactory");
//		//env.setProperty(Context.INITIAL_CONTEXT_FACTORY, "org.jboss.security.jndi.JndiLoginInitialContextFactory");
//		env.setProperty(Context.PROVIDER_URL, "jnp://localhost:1399");
//		//env.setProperty(Context.SECURITY_CREDENTIALS, "password");
//		//env.setProperty(Context.SECURITY_PRINCIPAL, "heffan");
//		//env.setProperty(Context.SECURITY_PROTOCOL, "cockpitDomain");
//		env.setProperty(Context.URL_PKG_PREFIXES, "org.jboss.naming:org.jnp.interfaces");
//
//		StudioService service = null;
//		try {
//			InitialContext ctx = new InitialContext(env);
//			service = (StudioService) ctx.lookup("StudioServiceBean/remote");
//			System.out.println("SERVICE FOUND: " + service);
//			List<ContestData> list = service.getAllContests();
//			System.out.println("total contest retrieved: " + list.size());
//			for (ContestData c : list) {
//				System.out.println("contest = " + c);
//			}
//		} catch (Exception e) {
//			System.out.println("Exception: " + e.getMessage());
//			e.printStackTrace();
//		}
		
		// JBoss' default remote jndi: <ejb-name>/remote
		try {
			Properties env = new Properties();
			env.setProperty(Context.INITIAL_CONTEXT_FACTORY, "org.jboss.security.jndi.LoginInitialContextFactory");
			env.setProperty(Context.PROVIDER_URL, "jnp://localhost:1399");
			env.setProperty(Context.URL_PKG_PREFIXES, "org.jboss.naming:org.jnp.interfaces");
			env.setProperty(Context.SECURITY_CREDENTIALS, "password");
			env.setProperty(Context.SECURITY_PRINCIPAL, "heffan");
			env.setProperty(Context.SECURITY_PROTOCOL, "cockpitDomain");

//			final String jndiName = "FooBean/remote";
			final String jndiName = "StudioServiceBean/remote";			
			Context ic = new InitialContext(env);
			System.out.println("about to look up jndi name " + jndiName);
			Object obj = ic.lookup(jndiName);
			System.out.println("lookup returned " + obj);
//			FooRemote foo = (FooRemote) obj;
//			String s = foo.echo("Hello Foo on JBoss!");
//			System.out.println(foo + " echo returned " + s);
			StudioService service = (StudioService)obj;
			List<ContestData> list = service.getAllContests();
			System.out.println("total contest retrieved: " + list.size());
			for (ContestData c : list) {
				System.out.println("contest = " + c);
			}
			
		} catch (Exception e) {
			System.out.println("Exception: " + e.getMessage());
			e.printStackTrace();
		}
	}

	protected static final Logger log = Logger.getLogger(AddSubmissionPrize.class);

	protected void dbProcessing() throws Exception {
		processLookup();
		// Properties env = new Properties(); // Try with a login that should
		// succeed
		// env.setProperty(Context.INITIAL_CONTEXT_FACTORY,
		// "org.jboss.security.jndi.LoginInitialContextFactory");
		// env.setProperty(Context.PROVIDER_URL, "jnp://localhost:1099/");
		// env.setProperty(Context.SECURITY_CREDENTIALS, "cat");
		// env.setProperty(Context.SECURITY_PRINCIPAL, "userA");
		// env.setProperty(Context.SECURITY_PROTOCOL,
		// "JBossLoginModuleDemoDomain");
		// InitialContext ctx = new InitialContext(env); // Look up the EJB
		// JBossLoginDemoHome
		// // Use the JBossLoginDemoHome to create a JBossLoginDemo
		// ejbHome = (JBossLoginDemoHome) ctx.lookup("demo/JBossLoginDemoEJB");
		// JBossLoginDemo ejbObject = ejbHome.create(); // Request the EJBs
		// service.
		// System.out.println("Server: " + ejbObject.sayHello1());

		// TCResourceBundle bundle = new TCResourceBundle("ApplicationServer");
		// bundle.getProperty("STUDIO_SERVER_NAME", "studio.dev.topcoder.com");

		// try {
		// Properties prop = new XProperties();
		// java.io.InputStream in = new
		// java.io.FileInputStream("Sample.properties");
		// prop.load(in);
		// env.put(javax.naming.Context.INITIAL_CONTEXT_FACTORY,
		// prop.getProperty("JNDI_FACTORY"));
		// env.put(javax.naming.Context.PROVIDER_URL,
		// prop.getProperty("PACTS_HOST_URL"));
		// env.put(Context.URL_PKG_PREFIXES, "jboss.naming:org.jnp.interfaces");
		// } catch (java.io.FileNotFoundException exception1) {
		// log.error("Error locating properties file for Pacts context");
		// } catch (java.io.IOException exception2) {
		// log.error("Error reading properties file for Pacts context");
		// } catch (java.lang.Exception exception3) {
		// log.error("Error getting context for Pacts");
		// }

		// Hashtable<String, String> env = new Hashtable<String, String>();
		// env.put("java.naming.factory.initial",
		// "org.jnp.interfaces.NamingContextFactory");
		// env.put("java.naming.factory.initial",
		// "org.jboss.security.jndi.JndiLoginInitialContextFactory");
		// env.put("java.naming.provider.url", "jnp://localhost:1399");
		// env.put("java.naming.factory.url.pkgs",
		// "org.jboss.naming:org.jnp.interfaces");
		// env.put(Context.SECURITY_PRINCIPAL, "heffan");
		// env.put(Context.SECURITY_CREDENTIALS, "password");
		//
		// Properties env = new Properties();
		// //env.setProperty(Context.INITIAL_CONTEXT_FACTORY,
		// "org.jboss.security.jndi.LoginInitialContextFactory");
		// env.setProperty(Context.INITIAL_CONTEXT_FACTORY,
		// "org.jboss.security.jndi.JndiLoginInitialContextFactory");
		// //env.setProperty(Context.INITIAL_CONTEXT_FACTORY,
		// "org.jnp.interfaces.NamingContextFactory");
		// env.setProperty(Context.PROVIDER_URL, "jnp://localhost:1399");
		// env.setProperty(Context.SECURITY_PRINCIPAL, "heffan");
		// env.setProperty(Context.SECURITY_CREDENTIALS, "password");
		// env.setProperty(Context.SECURITY_PROTOCOL, "cockpitDomain");
		// env.setProperty(Context.URL_PKG_PREFIXES,
		// "org.jboss.naming:org.jnp.interfaces");
		//		 
		// StudioService service = null;
		// Context ctx = null;
		// // Hashtable<String, String> env = new Hashtable<String, String>();
		// // env.put(Context.INITIAL_CONTEXT_FACTORY,
		// "org.jnp.interfaces.NamingContextFactory");
		// // env.put(Context.PROVIDER_URL, "jnp://127.0.0.1:1399");
		// // env.put(Context.URL_PKG_PREFIXES,
		// "org.jboss.naming:org.jnp.interfaces");
		//
		// try {
		// ctx = new InitialContext(env);
		// //Context ctx = TCContext.getInitial("jnp://localhost:1399");
		// log.debug("Context created...");
		// log.debug("ctx = "+ctx.toString());
		// service = (StudioService) ctx.lookup("StudioServiceBean/remote");
		// //service = (StudioService) ctx.lookup("cockpit/CockpitEJB");
		// log.debug("StudioService FOUND ! : " + service);
		// // service.setSubmissionPlacement(s.getId(), long prizeId);
		// } catch (Exception e) {
		// System.out.println("SERVICE NOT FOUND: " + service);
		// System.out.println("Exception: " + e.getMessage());
		// e.printStackTrace();
		// }
	}
}