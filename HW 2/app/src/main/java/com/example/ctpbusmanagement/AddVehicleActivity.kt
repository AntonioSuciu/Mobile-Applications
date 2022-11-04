package com.example.ctpbusmanagement

import android.app.AlertDialog
import android.content.Intent
import android.graphics.Color
import android.graphics.drawable.ColorDrawable
import android.os.Bundle
import android.widget.Button
import android.widget.EditText
import android.widget.ImageButton
import androidx.appcompat.app.AppCompatActivity
import androidx.core.content.ContextCompat
import kotlinx.android.synthetic.main.item_custom_row.*

class AddVehicleActivity: AppCompatActivity() {
    lateinit var etPicture: EditText
    lateinit var etLine: EditText
    lateinit var etStartStation: EditText
    lateinit var etStopStation: EditText
    lateinit var etVehicleType: EditText
    lateinit var bttnSave: Button

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_add_vehicle)

        val colorDrawable = ColorDrawable(Color.parseColor("#FFFFFF"))
        supportActionBar?.setBackgroundDrawable(colorDrawable)
        window.statusBarColor = ContextCompat.getColor(this@AddVehicleActivity, R.color.CTP_purple)

        etPicture = findViewById(R.id.etvPicture)
        etLine = findViewById(R.id.etvLine)
        etStartStation = findViewById(R.id.etvStartStation)
        etStopStation = findViewById(R.id.etvStopStation)
        etVehicleType = findViewById(R.id.etvVehicleType)

        bttnSave = findViewById(R.id.bttnSave)

        bttnSave.setOnClickListener() {
            if (etStartStation.text.toString() == etStopStation.toString()) {
                val alertBuilder = AlertDialog.Builder(this)

                alertBuilder.setTitle("Atenție!")
                alertBuilder.setMessage("Vehiculul nu poate avea aceeași stație de pornire și de oprire!")

                alertBuilder.setPositiveButton("Am înțeles") { dialog, _ ->
                    dialog.cancel()
                }
                alertBuilder.show()
            } else {
                if (etPicture.text.isNotEmpty() and etLine.text.isNotEmpty()
                    and etStartStation.text.isNotEmpty() and etStopStation.text.isNotEmpty()
                    and etVehicleType.text.isNotEmpty()
                ) {
                    val bundle = Bundle()
                    bundle.putString("picture", etPicture.text.toString())
                    bundle.putString("line", etLine.text.toString())
                    bundle.putString("startStation", etStartStation.text.toString())
                    bundle.putString("stopStation", etStopStation.text.toString())
                    bundle.putString("vehicleType", etVehicleType.text.toString())

                    val intent = Intent(this, ListVehiclesActivity::class.java)
                    intent.putExtras(bundle)
                    startActivity(intent)
                } else {
                    val alertBuilder = AlertDialog.Builder(this)

                    alertBuilder.setTitle("Atenție - Adăugați un vehicul!")
                    alertBuilder.setMessage("Completați toate câmpurile!")

                    alertBuilder.setPositiveButton("OK") { dialog, _ ->
                        dialog.cancel()
                    }
                    alertBuilder.show()
                }
            }
        }
    }
}