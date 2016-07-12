package cordova.plugin.contact.add;

import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CallbackContext;
import android.content.Intent;
import android.content.Context;
import android.provider.ContactsContract;


import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 * This class echoes a string called from JavaScript.
 */
public class CordovaAddContact extends CordovaPlugin {

    @Override
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
        if (action.equals("addContact")) {
          Context context=this.cordova.getActivity().getApplication();
          Intent intent=new Intent(Intent.ACTION_INSERT,ContactsContract.Contacts.CONTENT_URI);
          intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
          intent.putExtra("finishActivityOnSaveCompleted", true);
          context.startActivity(intent);
          return true;
        }
        return false;
    }
}
