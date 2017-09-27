#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
package ${package}.biz;

import lombok.extern.log4j.Log4j2;
import org.junit.Test;

/**
 * @author kangyonggan
 * @since 4/11/17
 */
@Log4j2
public class AppTest extends AbstractServiceTest {

    @Test
    public void testApp() {
        log.info("success");
    }

}
