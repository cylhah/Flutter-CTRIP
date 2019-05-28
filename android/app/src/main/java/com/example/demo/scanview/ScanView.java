package com.example.demo.scanview;

import android.content.Context;
import android.graphics.ImageFormat;
import android.hardware.Camera;
import android.view.LayoutInflater;
import android.view.SurfaceHolder;
import android.view.SurfaceView;
import android.view.View;
import android.widget.TextView;

import com.example.demo.R;

import java.io.IOException;
import java.util.Map;

import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.platform.PlatformView;

public class ScanView implements PlatformView {
    TextView myNativeView;
    private View cameraView;
    private SurfaceView mSurfaceView;
    private SurfaceHolder mHolder;
    private Camera camera;

    ScanView(Context context, BinaryMessenger messenger, int id, Map<String, Object> params) {
//        TextView myNativeView = new TextView(context);
//        myNativeView.setText("我是来自Android的原生TextView");
//        this.myNativeView = myNativeView;
//        cameraView = LayoutInflater.from(context).inflate(R.layout.camera_view, null);
        mSurfaceView = new SurfaceView(context);
        mHolder = mSurfaceView.getHolder();
        mHolder.addCallback(new SurfaceHolder.Callback() {
            @Override
            public void surfaceCreated(SurfaceHolder holder) {
                try {
                    camera = Camera.open(0); //摄像头Id 0 为后  1 为前
                }catch (Exception e){
                    e.printStackTrace();
                }
            }

            @Override
            public void surfaceChanged(SurfaceHolder holder, int format, int width, int height) {
                initCamera(mSurfaceView.getWidth(), mSurfaceView.getHeight());
                try {
                    camera.setPreviewDisplay(mHolder);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }

            @Override
            public void surfaceDestroyed(SurfaceHolder holder) {

            }
        });
    }

    private void initCamera(int width,int height){
        Camera.Parameters parameters = camera.getParameters();
        parameters.setPreviewFormat(ImageFormat.NV21);
        //根据设置的宽高 和手机支持的分辨率对比计算出合适的宽高算法
//        Camera.Size optionSize = CameraUtil
//                .getInstance(mCamera, mCamerId)
//                .getOptimalPreviewSize(width, height);
//        parameters.setPreviewSize(optionSize.width, optionSize.height);
        //设置照片尺寸
//        parameters.setPictureSize(optionSize.width, optionSize.height);
        //设置实时对焦 部分手机不支持会crash

        parameters.setFocusMode(Camera.Parameters.FOCUS_MODE_CONTINUOUS_PICTURE);
//        mCamera.setParameters(parameters);
        //开启预览
        camera.startPreview();
    }

    @Override
    public View getView() {
        return mSurfaceView;
    }

    @Override
    public void dispose() {

    }
}
