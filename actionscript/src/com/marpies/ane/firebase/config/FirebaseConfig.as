/**
 * Copyright 2016 Marcel Piestansky (http://marpies.com)
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.marpies.ane.firebase.config {

    import flash.system.Capabilities;

    public class FirebaseConfig {

        private static const TAG:String = "[FirebaseConfig]";
        private static const EXTENSION_ID:String = "com.marpies.ane.firebase.config";
        private static const iOS:Boolean = Capabilities.manufacturer.indexOf( "iOS" ) > -1;
        private static const ANDROID:Boolean = Capabilities.manufacturer.indexOf( "Android" ) > -1;

        /**
         * @private
         * Do not use.
         */
        public function FirebaseConfig() {
            throw Error( "Do not use FirebaseConfig." );
        }

        /**
         *
         *
         * Getters / Setters
         *
         *
         */

        /**
         * Extension version.
         */
        public static function get version():String {
            return "1.0.0";
        }

        /**
         * Supported on iOS and Android.
         */
        public static function get isSupported():Boolean {
            return iOS || ANDROID;
        }

    }

}
