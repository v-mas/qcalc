package com.example.mirek.fcmreceiver;

/**
 * Created by Slawomir Golonka on 2017-03-29.
 */
public interface Callback<T> {
    void success(T result);
}
