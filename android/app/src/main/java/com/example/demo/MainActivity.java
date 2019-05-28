package com.example.demo;

import android.os.Bundle;

import com.example.demo.scanview.ScanViewFlutterPlugin;

import io.flutter.app.FlutterActivity;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);
    ScanViewFlutterPlugin.registerWith(this);
  }
}
