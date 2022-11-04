package com.example.ctpbusmanagement

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.Window
import androidx.core.content.ContextCompat

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_list_vehicles)

        supportActionBar?.hide()

        val window: Window = this@MainActivity.window

        window.statusBarColor =
            ContextCompat.getColor(this@MainActivity, R.color.CTP_grey)

            val intent = Intent(this, ListVehiclesActivity::class.java)
            startActivity(intent)

    }
}