package com.example.mirek.fcmreceiver;

import android.util.Log;

import org.qtproject.qt5.android.bindings.QtApplication;

public class MyApplication extends QtApplication {
    @Override
    public void onCreate() {
        super.onCreate();
//        System.out.println("ON_CREATE____________________");
//        String nativeDir = getApplicationInfo().nativeLibraryDir +"/";
//        System.out.println("natives dir:"+ nativeDir);

//        try {
//            System.load(nativeDir + "libcrypto.so");
//            System.load(nativeDir + "libssl.so");
//        }catch(UnsatisfiedLinkError unsatisfiedLinkError){
//            System.out.println("librypto.so or libssl.so load error");
//        }
    }

    public void startSomeWork() {
        Log.d("APP TEST", "going to start this shit");
        new Thread(new Runnable() {
            @Override
            public void run() {
                try {
                    Log.d("APP TEST", "waiting a bit...");
                    Thread.sleep(5000);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                Log.d("APP TEST", "starting this shit up");
                jniUploadAsync("testtt", new Callback<String>() {
                    @Override
                    public void success(String result) {
                        Log.d("APP TEST", "callback from native jniUploadAsync");
                    }
                });
            }
        }).start();
    }

    private native void jniUploadAsync(String imagePath, Callback<String> callback);
}
