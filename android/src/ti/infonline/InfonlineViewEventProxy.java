package ti.infonline;

import org.appcelerator.kroll.KrollProxy;
import org.appcelerator.kroll.annotations.Kroll;
import org.appcelerator.titanium.TiBlob;

import de.infonline.lib.IOLViewEvent;

@Kroll.proxy(parentModule = InfonlineModule.class)
public class InfonlineViewEventProxy extends InfonlineEventProxy {

    public IOLViewEvent event;

    public InfonlineViewEventProxy() {
        super();

        IOLViewEvent.IOLViewEventType type = IOLViewEvent.IOLViewEventType.Appeared;

        switch (this.properties.getInt("type")) {
            case 0: {
                type = IOLViewEvent.IOLViewEventType.Appeared;
            }
            case 1: {
                type = IOLViewEvent.IOLViewEventType.Disappeared;
            }
            case 2: {
                type = IOLViewEvent.IOLViewEventType.Refreshed;
            }
        }

        event = new IOLViewEvent(type);
        event.setCategory(this.properties.getString("category"));
        event.setComment(this.properties.getString("comment"));
    }
}
