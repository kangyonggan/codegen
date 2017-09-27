#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
package ${package}.common.util;

import org.pegdown.PegDownProcessor;

/**
 * @author kangyonggan
 * @since 2016/10/18
 */
public class MarkdownUtil {

    /**
     * markdown语法转html语法
     *
     * @param markdown
     * @return
     */
    public static String markdownToHtml(String markdown) {
        return new PegDownProcessor(Integer.MAX_VALUE).markdownToHtml(markdown);
    }

}
