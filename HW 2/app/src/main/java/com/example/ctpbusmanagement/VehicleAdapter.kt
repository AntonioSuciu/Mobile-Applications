package com.example.ctpbusmanagement

import android.app.AlertDialog
import android.content.Intent
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.lifecycle.MutableLiveData
import androidx.recyclerview.widget.RecyclerView
import kotlinx.android.synthetic.main.item_custom_row.view.*

class VehicleAdapter () : RecyclerView.Adapter<VehicleAdapter.VehicleViewHolder>()
{
    inner class VehicleViewHolder(itemView: View) : RecyclerView.ViewHolder(itemView)

    private var vehicles : MutableList<Vehicle> = mutableListOf()

//    private var vehicleItems = MutableLiveData<MutableList<Vehicle>>()

    init {
        populateVehicles()
//        vehicleItems.value = mutableListOf()
//        populateVehicleItems()
    }


    private fun populateVehicles()
    {
        vehicles.add(Vehicle("PBE1", "47", "Str. Harghitei", "Piața Mihai Viteazu", "Autobuz Electric"));
        vehicles.add(Vehicle("PTro1", "5", "Aeroport", "Piața Gării", "Troleibuz"));
        vehicles.add(Vehicle("PBD1", "32B", "Str. C-tin Brâncuși", "Piața Mihai Viteazu", "Autobuz Diesel"));
        vehicles.add(Vehicle("PTra1", "101", "Str. Bucium", "Piața Gării", "Tramvai"));
        vehicles.add(Vehicle("PBD2", "32B", "Str. C-tin Brâncuși", "Piața Mihai Viteazu", "Autobuz Diesel"));
        vehicles.add(Vehicle("PTro2", "5", "Aeroport", "Piața Gării", "Troleibuz"));
        vehicles.add(Vehicle("PTro3", "5", "Aeroport", "Piața Gării", "Troleibuz"));
        vehicles.add(Vehicle("PB2E", "47", "Str. Harghitei", "Piața Mihai Viteazu", "Autobuz Electric"));

    }
//
//    private fun populateVehicleItems()
//    {
//
//        val list = vehicleItems.value
//
//
//        list!!.add(Vehicle("PBE1", "47", "Str. Harghitei", "Piața Mihai Viteazu", "Autobuz Electric"))
//        list.add(Vehicle("PTro1", "5", "Aeroport", "Piața Gării", "Troleibuz"))
//        list.add(Vehicle("PBD1", "32B", "Str. C-tin Brâncuși", "Piața Mihai Viteazu", "Autobuz Diesel"))
//        list.add(Vehicle("PTra1", "101", "Str. Bucium", "Piața Gării", "Tramvai"))
//        list.add(Vehicle("PBD2", "32B", "Str. C-tin Brâncuși", "Piața Mihai Viteazu", "Autobuz Diesel"))
//        list.add(Vehicle("PTro2", "5", "Aeroport", "Piața Gării", "Troleibuz"))
//        list.add(Vehicle("PTro3", "5", "Aeroport", "Piața Gării", "Troleibuz"))
//        list.add(Vehicle("PB2E", "47", "Str. Harghitei", "Piața Mihai Viteazu", "Autobuz Electric"))
//    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): VehicleViewHolder {
        return VehicleViewHolder(
            LayoutInflater.from(parent.context).inflate(
                R.layout.item_custom_row,
                parent,
                false
            )
        )
    }

    override fun onBindViewHolder(holder: VehicleViewHolder, position: Int) {
        val currentVehicle = vehicles[position]
        holder.itemView.apply {
            tvVehiclePic.text = currentVehicle.picture
            tvVehicleLine.text = currentVehicle.lineNumber
            tvVehicleStartStation.text = currentVehicle.startStation
            tvVehicleStopStation.text = currentVehicle.stopStation
            tvVehicleType.text = currentVehicle.vehicleType
        }

        holder.itemView.bttnEdit.setOnClickListener()
        {
            val bundle = Bundle()
            bundle.putString("pictureUpdate", currentVehicle.picture)
            bundle.putString("lineUpdate", currentVehicle.lineNumber)
            bundle.putString("startStationUpdate", currentVehicle.startStation)
            bundle.putString("stopStationUpdate", currentVehicle.stopStation)
            bundle.putString("vehicleTypeUpdate", currentVehicle.vehicleType)

            val intent = Intent(holder.itemView.rootView.context, UpdateVehicleActivity::class.java)
            intent.putExtras(bundle)
            holder.itemView.context.startActivity(intent)
        }

        holder.itemView.bttnDelete.setOnClickListener()
        {
            val alertBuilder = AlertDialog.Builder(holder.itemView.rootView.context)

            alertBuilder.setTitle("Doriți să ștergeți acest vehicul?")
            alertBuilder.setMessage("Pentru a șterge vehiculul selectat, apăsați OK.")

            alertBuilder.setNegativeButton("RENUNȚĂ"){ dialog, _ ->
                dialog.cancel()
            }.setPositiveButton("OK") { _, _ ->
                deleteVehicle(position)
//                deleteVehicleItem(position)
            }
            alertBuilder.show()
        }
    }

    fun addVehicle(vehicle: Vehicle)
    {
        vehicles.add(vehicle)
        notifyDataSetChanged()

    }

//    fun addVehicleItem(vehicle: Vehicle)
//    {
//        val list = vehicleItems.value
//        list!!.add(vehicle)
//        vehicleItems.postValue(list)
//    }

    private fun deleteVehicle(position: Int)
    {
        vehicles.removeAt(position)
        notifyDataSetChanged()
    }

//    fun deleteVehicleItem(position:Int)
//    {
//        val list = vehicleItems.value
//        list!!.removeAt(position)
//        vehicleItems.postValue(list)
//    }

    fun updateVehicle(oldPicture: String, newVehicle: Vehicle)
    {
        var i: Int = -1
        for (vehicle in vehicles)
        {
            i ++
            if (vehicle.picture == oldPicture)
            {
                vehicles[i] = newVehicle
                break
            }
        }
        notifyDataSetChanged()
    }

//    fun updateVehicleItem(oldPicture: String, newVehicle: Vehicle)
//    {
//
//        val list = vehicleItems.value
//        val vehicle = list!!.find{ it.picture == oldPicture }!!
//        vehicle.lineNumber = newVehicle.lineNumber
//        vehicle.startStation = newVehicle.startStation
//        vehicle.stopStation = newVehicle.stopStation
//        vehicle.vehicleType = newVehicle.vehicleType
//        vehicleItems.postValue(list)
//
//    }
    override fun getItemCount(): Int {
        return vehicles.size
    }


}