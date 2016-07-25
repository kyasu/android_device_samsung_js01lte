/*
 * Copyright (c) 2016, The CyanogenMod Project. All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.android.internal.telephony;

import android.content.Context;
import android.os.Message;
import android.provider.Settings;

/**
 * RIL customization for Samsung Galaxy Note 3 (hltedcm)
 *
 * {@hide}
 */
public class HltedcmRIL extends SamsungQcomRIL {

    public HltedcmRIL(Context context, int networkMode, int cdmaSubscription) {
        super(context, networkMode, cdmaSubscription, null);
        Settings.Global.putInt(mContext.getContentResolver(),
            Settings.Global.MOBILE_DATA_ALWAYS_ON, 1);
    }

    public HltedcmRIL(Context context, int preferredNetworkType,
            int cdmaSubscription, Integer instanceId) {
        super(context, preferredNetworkType, cdmaSubscription, instanceId);
        Settings.Global.putInt(mContext.getContentResolver(),
            Settings.Global.MOBILE_DATA_ALWAYS_ON, 1);
    }


    @Override
    public void
    setupDataCall(String radioTechnology, String profile, String apn,
            String user, String password, String authType, String protocol,
            Message result) {

        super.setupDataCall(radioTechnology, profile, apn, user, password,
                    authType, protocol, result);

        try {
            int prefNwType = Integer.parseInt(radioTechnology)-2;
            setPreferredNetworkType(prefNwType, null);
        } catch (NumberFormatException nfe) {
        }
    }
}
