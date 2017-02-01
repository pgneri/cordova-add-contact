package cordova.plugin.contact.add;

import android.content.Context;
import android.content.Intent;
import android.provider.ContactsContract;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class CordovaAddContact extends CordovaPlugin {

    @Override
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
        if (action.equals("addContact")) {
            Context context = this.cordova.getActivity().getApplication();
            Intent intent = new Intent(Intent.ACTION_INSERT, ContactsContract.Contacts.CONTENT_URI);
            JSONObject params = args.getJSONObject(0);
            addExtra(intent, params, "name", ContactsContract.Intents.Insert.NAME);
            addExtra(intent, params, "phone", ContactsContract.Intents.Insert.PHONE);
            addExtra(intent, params, "email", ContactsContract.Intents.Insert.EMAIL);
            intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            intent.putExtra("finishActivityOnSaveCompleted", true);
            context.startActivity(intent);
            return true;
        }
        return false;
    }

    private void addExtra(Intent intent, JSONObject params, String paramKey, String extraKey) throws JSONException {
        String value = params.getString(paramKey);
        if (value != null) {
            intent.putExtra(extraKey, value);
        }
    }
}
