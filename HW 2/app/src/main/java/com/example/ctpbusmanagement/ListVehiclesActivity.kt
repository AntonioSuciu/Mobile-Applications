package com.example.ctpbusmanagement

import android.content.Intent
import android.graphics.Color
import android.graphics.drawable.ColorDrawable
import android.os.Bundle
import android.view.Menu
import android.widget.Button
import androidx.appcompat.app.AppCompatActivity
import androidx.core.content.ContextCompat
import androidx.recyclerview.widget.DividerItemDecoration
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import kotlinx.android.synthetic.main.activity_list_vehicles.*

class ListVehiclesActivity: AppCompatActivity() {
    private lateinit var vehicleAdapter: VehicleAdapter

    var oldPicture: String? = null
    var picture: String? = null
    var line: String? = null
    var startStation: String? = null
    var stopStation: String? = null
    var vehicleType: String? = null

    override fun onCreate(savedInstanceState: Bundle?)
    {
        super.onCreate(savedInstanceState)

        setContentView(R.layout.activity_list_vehicles)

        val colorDrawable = ColorDrawable(Color.parseColor("#FFFFFF"))
        supportActionBar?.setBackgroundDrawable(colorDrawable)
        window.statusBarColor = ContextCompat.getColor(this@ListVehiclesActivity, R.color.CTP_purple)

        vehicleAdapter = VehicleAdapter()

        val recyclerView: RecyclerView = findViewById(R.id.rv_vehicles_list)
        val layoutManager = LinearLayoutManager(this, LinearLayoutManager.VERTICAL, false)

        recyclerView.addItemDecoration(
            DividerItemDecoration(
                baseContext,
                layoutManager.orientation
            )
        )

        rv_vehicles_list.adapter = vehicleAdapter
        rv_vehicles_list.layoutManager = LinearLayoutManager(this)
        val buttonAddVehicle = findViewById<Button>(R.id.bttn_vehicle_add)
        buttonAddVehicle.setOnClickListener(){
            val intent = Intent(this, AddVehicleActivity::class.java)
            startActivity(intent)
        }

        val bundle = intent.extras
        if(bundle != null)
        {
            if(bundle.getString("picture") != null)
            {
                picture = bundle.getString("picture")
                line = bundle.getString("line")
                // lineNumber??
                startStation = bundle.getString("startStation")
                stopStation = bundle.getString("stopStation")
                vehicleType = bundle.getString("vehicleType")

                val vehicle = Vehicle(picture.toString(), line.toString(), startStation.toString(),
                    stopStation.toString(), vehicleType.toString())
                vehicleAdapter.addVehicle(vehicle)
//                vehicleAdapter.addVehicleItem(vehicle)
            }

            else if (bundle.getString("oldPicture") != null)
            {
                oldPicture = bundle.getString("oldPicture")
                picture = bundle.getString("pictureUpdated")
                line = bundle.getString("lineUpdated")
                // lineNumberUpdated??
                startStation = bundle.getString("startStationUpdated")
                stopStation = bundle.getString("stopStationUpdated")
                vehicleType = bundle.getString("vehicleTypeUpdated")

                val vehicle = Vehicle(picture.toString(), line.toString(), startStation.toString(),
                    stopStation.toString(), vehicleType.toString())
                vehicleAdapter.updateVehicle(oldPicture.toString(),vehicle)
//                vehicleAdapter.updateVehicleItem(oldPicture.toString(), vehicle)
            }
        }
    }

}