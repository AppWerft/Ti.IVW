package ti.infonline;

import org.appcelerator.kroll.KrollProxy;
import org.appcelerator.kroll.annotations.Kroll;

import de.infonline.lib.IOLEvent;

@Kroll.proxy(parentModule = InfonlineModule.class)
public class InfonlineEventProxy extends KrollProxy {
    public IOLEvent event;
}
