package com.topcoder.web.studio.controller.request.admin;

import java.util.Hashtable;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

import com.topcoder.service.studio.StudioService;

import com.topcoder.shared.util.logging.Logger;

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

	protected static final Logger log = Logger.getLogger(AddSubmissionPrize.class);

	protected void dbProcessing() throws Exception {
		StudioService service = null;
		Hashtable<String, String> env = new Hashtable<String, String>();
		env.put(Context.INITIAL_CONTEXT_FACTORY, "org.jnp.interfaces.NamingContextFactory");
		env.put(Context.PROVIDER_URL, "jnp://localhost:1399");
		env.put(Context.URL_PKG_PREFIXES, "org.jboss.naming:org.jnp.interfaces");

		try {
			Context ctx = new InitialContext(env);
			service = (StudioService) ctx.lookup("StudioServiceBean/remote");
			log.debug("StudioService FOUND ! : " + service);
			// service.setSubmissionPlacement(s.getId(), long prizeId);
		} catch (NamingException e) {
			log.error("StudioService NOT FOUND ! : " + e.getMessage());
		}
	}
}