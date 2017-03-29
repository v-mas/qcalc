package com.example.mirek.fcmreceiver;

import android.os.Bundle;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.RelativeLayout;

import org.qtproject.qt5.android.bindings.QtActivity;

/**
 * Created by Slawomir Golonka on 2017-03-29.
 */

public class MyActivity extends QtActivity {
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        RelativeLayout rl = new RelativeLayout(this);
        Button sB = new Button(this);
        sB.setText("start");
        sB.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                ((MyApplication) getApplication()).startSomeWork();
            }
        });
        RelativeLayout.LayoutParams lp = new RelativeLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);

        rl.addView(sB, lp);

        ViewGroup.LayoutParams mlp = new ViewGroup.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        addContentView(rl, mlp);
    }
}
