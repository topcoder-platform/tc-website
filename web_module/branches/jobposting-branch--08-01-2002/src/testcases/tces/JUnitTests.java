
import junit.framework.*;

/**
 * TestSuite that runs all the  tests
 *
 */
public class JUnitTests {

	/*public static void main (String[] args) {
		junit.textui.TestRunner.run (suite());
	}*/
	public static Test suite ( ) {
		TestSuite suite= new TestSuite("PageNumTestCase Tests");
		suite.addTest(new TestSuite(PageNumTestCase.class));
	    return suite;
	}
}