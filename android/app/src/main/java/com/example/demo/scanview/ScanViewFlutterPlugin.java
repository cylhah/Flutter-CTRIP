package com.example.demo.scanview;

import io.flutter.plugin.common.PluginRegistry;

public class ScanViewFlutterPlugin {
    public static void registerWith(PluginRegistry registry) {
        final String key = ScanViewFlutterPlugin.class.getCanonicalName();

        if (registry.hasPlugin(key)) return;

        PluginRegistry.Registrar registrar = registry.registrarFor(key);
        registrar.platformViewRegistry().registerViewFactory("scanView", new ScanViewFactory(registrar.messenger()));
    }
}
