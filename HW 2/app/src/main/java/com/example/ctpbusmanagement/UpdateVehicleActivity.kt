package com.example.ctpbusmanagement

import android.content.Intent
import android.graphics.Color
import android.graphics.drawable.ColorDrawable
import android.os.Bundle
import android.widget.Button
import android.widget.EditText
import android.widget.ImageButton
import androidx.appcompat.app.AppCompatActivity
import androidx.core.content.ContextCompat

class UpdateVehicleActivity: AppCompatActivity() {

    var etOldPicture: String? = null
    lateinit var etPicture: EditText
    lateinit var etLine: EditText
    lateinit var etStartStation: EditText
    lateinit var etStopStation: EditText
    lateinit var etVehicleType: EditText
    lateinit var bttnSave: Button

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_update_vehicle)

        val colorDrawable = ColorDrawable(Color.parseColor("#FFFFFF"))
        supportActionBar?.setBackgroundDrawable(colorDrawable)
        window.statusBarColor = ContextCompat.getColor(this@UpdateVehicleActivity, R.color.CTP_purple)

        etPicture = findViewById(R.id.etvPicture)
        etLine = findViewById(R.id.etvLine)
        etStartStation = findViewById(R.id.etvStartStation)
        etStopStation = findViewById(R.id.etvStopStation)
        etVehicleType = findViewById(R.id.etvVehicleType)

        bttnSave = findViewById(R.id.bttnSave)

        val bundle = intent.extras
        if(bundle != null)
        {
            etPicture.hint = bundle.getString("pictureUpdate")
            etOldPicture = bundle.getString("pictureUpdate").toString()
            etLine.hint = bundle.getString("lineUpdate")
            etStartStation.hint = bundle.getString("startStationUpdate")
            etStopStation.hint = bundle.getString("stopStationUpdate")
            etVehicleType.hint = bundle.getString("vehicleTypeUpdate")
        }

    bttnSave.setOnClickListener()
    {
        val newBundle = Bundle()
        newBundle.putString("oldPicture", etOldPicture)

        if(etPicture.text.isNotEmpty())
        {
            newBundle.putString("pictureUpdated", etPicture.text.toString())
        }

        else
        {
            newBundle.putString("pictureUpdated", etPicture.hint.toString())
        }

        if(etLine.text.isNotEmpty())
        {
            newBundle.putString("lineUpdated", etLine.text.toString())
        }

        else
        {
            newBundle.putString("lineUpdated", etLine.hint.toString())
        }

        if(etStartStation.text.isNotEmpty())
        {
            newBundle.putString("startStationUpdated", etStartStation.text.toString())
        }

        else
        {
            newBundle.putString("startStationUpdated", etStartStation.hint.toString())
        }

        if(etStopStation.text.isNotEmpty())
        {
            newBundle.putString("stopStationUpdated", etStopStation.text.toString())
        }

        else
        {
            newBundle.putString("stopStationUpdated", etStopStation.hint.toString())
        }

        if(etVehicleType.text.isNotEmpty())
        {
            newBundle.putString("vehicleTypeUpdated", etVehicleType.text.toString())
        }

        else
        {
            newBundle.putString("vehicleTypeUpdated", etVehicleType.hint.toString())
        }

        val intent = Intent(this, ListVehiclesActivity::class.java)
        intent.putExtras(newBundle)
        startActivity(intent)
    }

    }

}

