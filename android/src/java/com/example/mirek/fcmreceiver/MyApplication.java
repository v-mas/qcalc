package com.example.mirek.fcmreceiver;

import org.qtproject.qt5.android.bindings.QtApplication;

public class MyApplication extends QtApplication {
    @Override
    public void onCreate() {
        super.onCreate();
//        System.out.println("ON_CREATE____________________");
//        String nativeDir = getApplicationInfo().nativeLibraryDir +"/";
//        System.out.println("natives dir:"+ nativeDir);

//        try {
//            System.load(nativeDir + "libcryptoArm.so");
//            System.load(nativeDir + "libsslArm.so");
//        }catch(UnsatisfiedLinkError unsatisfiedLinkError){
//            System.out.println("librypto.so or libssl.so load error");
//        }
    }
}
