package ti.infonline;

import org.appcelerator.kroll.KrollDict;
import org.appcelerator.kroll.annotations.Kroll;
import org.appcelerator.kroll.common.Log;

import de.infonline.lib.IOLViewEvent;

@Kroll.proxy(name = "ViewEvent", creatableInModule = InfonlineModule.class)
public class InfonlineViewEventProxy extends InfonlineEventProxy {

    public IOLViewEvent event;

    @Override
    public void handleCreationDict(KrollDict dict) {
        super.handleCreationDict(dict);

        int type = dict.getInt("type");
        String category = dict.getString("category");
        String comment = dict.getString("comment");

        IOLViewEvent.IOLViewEventType nativeType = IOLViewEvent.IOLViewEventType.Appeared;

        switch (type) {
            case 0: {
                nativeType = IOLViewEvent.IOLViewEventType.Appeared;
                break;
            }
            case 1: {
                nativeType = IOLViewEvent.IOLViewEventType.Refreshed;
                break;
            }
            case 2: {
                nativeType = IOLViewEvent.IOLViewEventType.Disappeared;
            }
        }

        this.event = new IOLViewEvent(nativeType);
        this.event.setCategory(category);
        this.event.setComment(comment);
    }
}
