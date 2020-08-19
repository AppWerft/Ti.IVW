package ti.infonline;

import org.appcelerator.kroll.KrollProxy;
import org.appcelerator.kroll.annotations.Kroll;

import de.infonline.lib.IOLEvent;

@Kroll.proxy(name = "Event", creatableInModule = InfonlineModule.class)
public class InfonlineEventProxy extends KrollProxy {
    public IOLEvent event;
}
