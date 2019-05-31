package com.example.demo;

import android.Manifest;
import android.content.pm.PackageManager;
import android.os.Bundle;

import com.example.asr.AsrPlugin;
import com.example.demo.scanview.ScanViewFlutterPlugin;

import java.util.ArrayList;

import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;
import io.flutter.app.FlutterActivity;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);
    registerSelfPlugin();
    initPermission();
    ScanViewFlutterPlugin.registerWith(this);
  }

  private void registerSelfPlugin() {
    AsrPlugin.registerWith(registrarFor("com.example.asr.AsrPlugin"));
  }

  /**
   * android 6.0 以上需要动态申请权限
   */
  private void initPermission() {
    String permissions[] = {Manifest.permission.RECORD_AUDIO,
            Manifest.permission.ACCESS_NETWORK_STATE,
            Manifest.permission.INTERNET,
            Manifest.permission.READ_PHONE_STATE,
            Manifest.permission.WRITE_EXTERNAL_STORAGE,
            Manifest.permission.CAMERA
    };


    ArrayList<String> toApplyList = new ArrayList<>();

    for (String perm : permissions) {
      if (PackageManager.PERMISSION_GRANTED != ContextCompat.checkSelfPermission(this, perm)) {
        toApplyList.add(perm);
        //进入到这里代表没有权限.

      }
    }

    String tmpList[] = new String[toApplyList.size()];
    if (!toApplyList.isEmpty()) {
      ActivityCompat.requestPermissions(this, toApplyList.toArray(tmpList), 123);
    }
  }
}
